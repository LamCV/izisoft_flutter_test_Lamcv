import 'package:izisoft_flutter_test_caovanlam/models/campaign.dart';
import 'package:izisoft_flutter_test_caovanlam/models/user.dart';
import 'package:izisoft_flutter_test_caovanlam/services/dio_http.dart';

class UserController {
  List<User?> _userList = <User>[];
  List<User?> get userList => _userList;


  Future<void> getUserList() async {

    DioHttp dioHttp = DioHttp();
     await dioHttp.getListUser().then((value) {
      _userList = value!;
    });
  }
}
