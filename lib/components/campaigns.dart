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
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              campaign!.image!,
            ),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            const Positioned(
                right: 10, top: 10, child: Icon(Icons.masks_sharp)),
            Positioned(
              left: 10,
              bottom: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: Colors.grey), // Customize border color
                ),
                child: Text(
                  campaign!.timeRemain!,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
