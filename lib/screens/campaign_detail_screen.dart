import 'package:flutter/material.dart';
import 'package:izisoft_flutter_test_caovanlam/models/campaign.dart';

class CampaignDetailScreen extends StatefulWidget {
  final Campaign? campaign;

  const CampaignDetailScreen({super.key, required this.campaign});

  @override
  State<CampaignDetailScreen> createState() => _CampaignDetailScreenState();
}

class _CampaignDetailScreenState extends State<CampaignDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    widget.campaign!.thumbnail,
                  ),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _statusCampaign(),
            const SizedBox(
              height: 10,
            ),
            _sponsorInfor(),
            const SizedBox(
              height: 20,
            ),
            _showBackers(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(17),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF039e75),
              foregroundColor: Colors.white),
          child: const Text(
            'BACK THIS PROJECT',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
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
              Text(
                widget.campaign!.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(
                '${timeRemain(widget.campaign!.startTime, widget.campaign!.endTime)} days left',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Target = \$ ${widget.campaign!.amountTarget}'),
              Text(
                  '${countPortion(widget.campaign!.amountTarget, widget.campaign!.currentAmount)}%'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sponsorInfor() {
    bool isExpanded = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          widget.campaign!.author.avatar,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sponsored by',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        widget.campaign!.author.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 30,
                width: 100,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFc2fff0),
                ),
                child: Center(
                  child: Text(
                    widget.campaign!.author.job,
                    style: const TextStyle(
                        color: Color(0xFF039e75), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.campaign!.author.describe,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              if (!isExpanded)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = true;
                    });
                  },
                  child: const Text(
                    'See more',
                    style: TextStyle(
                      color: Color(0xFF039e75),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String timeRemain(int startTime, int endTime) {
    int timestamp = endTime - startTime;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return dateTime.day.toString();
  }

  int countPortion(int amountTarget, int currentAmount) {
    double portion = currentAmount * 100 / amountTarget;
    return portion.round();
  }

  Widget _showBackers() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          widget.campaign!.backers.length < 4
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        widget.campaign!.backers[0].avatar,
                      ),
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 4
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                )
              : Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.campaign!.backers[0].avatar,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    const Text('+ backers')
                  ],
                )
        ],
      ),
    );
  }
}
