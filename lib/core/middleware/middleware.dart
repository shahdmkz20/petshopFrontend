import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constants/approutes.dart';
import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.home);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
