import 'package:izisoft_flutter_test_caovanlam/models/campaign.dart';
import 'package:izisoft_flutter_test_caovanlam/services/dio_http.dart';

class HomeController {
  List<Campaign?> _campaigns = <Campaign>[];
  List<Campaign?> get campaigns => _campaigns;


  Future<void> getListCampaigns() async {

    DioHttp dioHttp = DioHttp();
     await dioHttp.getListCampaign().then((value) {
      _campaigns = value!;
    });

    print(campaigns.length);
  }
}
