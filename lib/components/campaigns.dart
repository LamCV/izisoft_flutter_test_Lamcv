import 'package:flutter/material.dart';
import 'package:izisoft_flutter_test_caovanlam/models/campaign.dart';
import 'package:izisoft_flutter_test_caovanlam/screens/campaign_detail_screen.dart';

class CampaignItem extends StatelessWidget {
  final Campaign? campaign;

  const CampaignItem({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CampaignDetailScreen(
                    campaign: campaign,
                  )),
        );
      },
      child: Container(
        width: 225,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              campaign!.thumbnail,
            ),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                child: Icon(Icons.masks_rounded),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Container(
                height: 25,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${timeRemain(campaign!.startTime, campaign!.endTime)} days left',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String timeRemain(int startTime, int endTime) {
    int timestamp = endTime - startTime;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return dateTime.day.toString();
  }
}
