import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:izisoft_flutter_test_caovanlam/data/dio_api.dart';
import 'package:izisoft_flutter_test_caovanlam/models/campaign.dart';
import 'package:izisoft_flutter_test_caovanlam/models/user.dart';

class DioHttp {
  static final DioHttp _instance = DioHttp._internal();

  factory DioHttp() => _instance;

  DioHttp._internal() {
    debugPrint('DioHttp Initialize');
  }

  final _dio = Dio(BaseOptions(
    baseUrl: DIOAPI.BASE_URL,
    connectTimeout: 10000,
    receiveTimeout: 10000,
    contentType: 'application/json;charset=UTF-8',
  ));

  Dio get dio => _dio;

  Future<List<User>?> getListUser() async {
    try {
      Response response = await dio.get(DIOAPI.API_USERS);
      List<User> data = <User>[];
      response.data.forEach((user) {
        data.add(User.fromJson(user));
      });
      return data;
    } on DioError catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<User?> getUserByID(String id) async {
    try {
      Response response = await dio.get(
        "${DIOAPI.API_USERS}/$id",
      );

      return User.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<List<Campaign>?> getListCampaign() async {
    try {
      Response response = await dio.get(DIOAPI.API_CAMPAIGNS);
      List<Campaign> data = <Campaign>[];
      response.data.forEach((campaign) {
        data.add(Campaign.fromJson(campaign));
      });
      return data;
    } on DioError catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<Campaign?> getCampaignByID(String id) async {
    try {
      Response response = await dio.get(
        "${DIOAPI.API_CAMPAIGNS}/$id",
      );

      return Campaign.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint('$e');
    }
    return null;
  }
}