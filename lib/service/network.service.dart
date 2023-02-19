import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../common/api_common.dart';
import '../common/constants_common.dart';


class NetworkService extends GetxService {
  NetworkService._();
  final _dio = Dio(BaseOptions(
    baseUrl: kBaseUrl,
  ));
  Dio get dio => _dio;
  final box = GetStorage();

  static NetworkService get instance {
    final _networkService = NetworkService._();
    return _networkService;
  }

  String? get accessToken => box.read<String>(accessTokenKey);
  set accessToken(String? value) => box.write(accessTokenKey, value);

  String? get refreshToken => box.read<String>(refreshTokenKey);
  set refreshToken(String? value) => box.write(refreshTokenKey, value);

  String? get userPhone => box.read<String>(userPhoneKey);
  set userPhone(String? value) => box.write(userPhoneKey, value);

  String? get userEmail => box.read<String>(userEmailKey);
  set userEmail(String? value) => box.write(userEmailKey, value);

  String? get userName => box.read<String>(userNameKey);
  set userName(String? value) => box.write(userNameKey, value);

  String? get id => box.read<String>(idKey);
  set id(String? value) => box.write(idKey, value);

  String? get jobrole => box.read<String>(jobroleKey);
  set jobrole(String? value) => box.write(jobroleKey, value);

  String? get bookingId => box.read<String>(bookingIdKey);
  set bookingId(String? value) => box.write(bookingIdKey, value);

  String? get userId => box.read<String>(userIdKey);
  set userId(String? value) => box.write(userIdKey, value);

  String? get firstLoginCheck => box.read<String>(firstLoginKey);
  set firstLoginCheck(String? value) => box.write(firstLoginKey, value);

  String? get auditionCountCheck => box.read<String>(auditionCountKey);
  set auditionCountCheck(String? value) => box.write(auditionCountKey, value);

// S-Cube code ends
}
