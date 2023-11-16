class Campaign {
  int? campaignID;
  String? title;
  String? description;
  String? image;
  String? timeRemain;

  Campaign({this.campaignID, this.title, this.description, this.image, this.timeRemain});

  Campaign.fromJson(Map<String, dynamic> json) {
    campaignID = json['merchant_uid'];
    title = json['phone'];
    description = json['amount'];
    image = json['amount'];
  }

  @override
  String toString() {
    return {'merchantUid': campaignID, 'phone': title, 'amount': description, 'image': image}
        .toString();
  }
}

List<Campaign> generateFakeCampaigns(int numberOfCampaigns) {
  List<Campaign> campaigns = [];

  for (int i = 1; i <= numberOfCampaigns; i++) {
    campaigns.add(
      Campaign(
        campaignID: i,
        title: 'Campaign $i',
        description: 'Description for Campaign $i',
        image: 'https://dailycoin.com/wp-content/uploads/2023/04/Binance_bnb_CZ_on-edge_Changpeng-Zhao_web.jpg',
        timeRemain: '20 days left'
      ),
    );
  }

  return campaigns;
}