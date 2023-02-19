
import 'package:get/get.dart';

import '../service/auth.service.dart';
import '../service/dashboard.service.dart';
import '../service/network.service.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService.instance);
    Get.lazyPut<AuthService>(() => AuthService());
  Get.lazyPut<DashBoardService>(() => DashBoardService());
  }
}

