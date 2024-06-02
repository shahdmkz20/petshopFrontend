import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../core/constants/approutes.dart';
import '../core/services/services.dart';
import '../data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  late PageController pageCont;
  int currentPage = 0;

  next();

  onPageChanged(int p);
  MyServices myServices = Get.find();
}

class OnBoardingControllerImp extends OnBoardingController {
  @override
  next() {
    currentPage++;

    // the user have seen all the on boarding pages
    if (currentPage > onBoardingModelList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.signUp);
    } else {
      pageCont.animateToPage(currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int p) {
    currentPage = p;
    update();
  }

  @override
  void onInit() {
    pageCont = PageController();
    super.onInit();
  }
}
