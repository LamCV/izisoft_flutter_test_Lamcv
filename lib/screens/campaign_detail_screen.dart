import 'package:flutter/material.dart';
import 'package:izisoft_flutter_test_caovanlam/models/campaign.dart';

class CampaignDetailScreen extends StatelessWidget {
  final Campaign? campaign;

  const CampaignDetailScreen({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 350,
            margin: EdgeInsets.all(10),
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
          ),
          SizedBox(
            height: 10,
          ),
          _statusCampaign(),
          SizedBox(
            height: 10,
          ),
          _sponsorInfor(),
          SizedBox(
            height: 10,
          ),
          Text(campaign!.description!),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back this projects'),
        ),
      ),
    );
  }

  Widget _statusCampaign() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Snacks for the elderly'),
              Text(campaign!.timeRemain!),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 10,
            decoration: BoxDecoration(
              color: const Color(0xffe4e2e2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF039e75),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Target = 25.000'),
              Text('48'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sponsorInfor() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.account_circle),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sponsored by'),
                  Text('Benjamin Evalent'),
                ],
              ),
            ],
          ),
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFFc2fff0),
            ),
            child: const Center(
              child: Text(
                'Medical',
                style: TextStyle(
                  color: Color(0xFF039e75),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
