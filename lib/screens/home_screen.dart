import 'package:flutter/material.dart';
import 'package:izisoft_flutter_test_caovanlam/components/campaigns.dart';
import 'package:izisoft_flutter_test_caovanlam/components/categories.dart';
import 'package:izisoft_flutter_test_caovanlam/controller/home_controller.dart';
import 'package:izisoft_flutter_test_caovanlam/models/campaign.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            _searchBox(),
            const SizedBox(
              height: 30,
            ),
            _adImage(),
            const SizedBox(
              height: 30,
            ),
            _category(),
            const SizedBox(
              height: 30,
            ),
            _tradingCampaign(),
          ],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return InkWell(
      onTap: () {
        // Handle search box tap
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey), // Customize border color
        ),
        child: const Row(
          children: [
            Icon(Icons.search, color: Colors.grey), // Search Icon
            SizedBox(width: 8),
            Text(
              'Search...',
              style: TextStyle(color: Colors.grey),
            ), // Hint Text
          ],
        ),
      ),
    );
  }

  Widget _adImage() {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF039e75),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Icon(Icons.face_rounded, color: Colors.white), // Search Icon
          SizedBox(width: 8),
          Text(
            'Make The World More Meaningful',
            style: TextStyle(color: Colors.white),
          ), // Hint Text
        ],
      ),
    );
  }

  Widget _category() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Container(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CategoryItem('Education'),
              CategoryItem('Disaster'),
              CategoryItem('Medical'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tradingCampaign() {
    List<Campaign>? campaigns = HomeController().campaigns;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Trading Compaign',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'See more',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:  [
              CampaignItem(campaign: campaigns![0]),
              CampaignItem(campaign: campaigns[1]),
              CampaignItem(campaign: campaigns[2]),
            ],
          ),
        ),
      ],
    );
  }
}
