import 'package:flutter/material.dart';
import 'package:izisoft_flutter_test_caovanlam/components/campaigns.dart';
import 'package:izisoft_flutter_test_caovanlam/components/categories.dart';
import 'package:izisoft_flutter_test_caovanlam/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = HomeController();
  HomePage({Key? key}) : super(key: key);

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
            ),
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
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.green],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            child: Icon(Icons.brightness_1, color: Colors.red),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(width: 8),
          Text(
            'Make The World More Meaningful',
            style: TextStyle(color: Colors.white),
          ),
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
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
    return FutureBuilder(
      future: controller.getListCampaigns(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trading Campaign',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'See more',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 225,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: controller.campaigns.map((campaign) {
                    return CampaignItem(campaign: campaign);
                  }).toList(),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
