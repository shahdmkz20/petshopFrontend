import 'dart:io';

import 'package:get/get.dart';

import '../constants/colors.dart';


Future<bool> AlertExitApp() {
  return Get.defaultDialog(
    title: "46".tr,
    middleText: "45".tr,
    textConfirm: "47".tr,
    textCancel: "48".tr,
    confirmTextColor: AppColors.defaultWhite,
    buttonColor: AppColors
        .primaryColor, // Example color, you can change it as per your app's design
    cancelTextColor: AppColors
        .defaultRed, // Example color, you can change it as per your app's design
    onConfirm: () {
      exit(0);
    },
  ).then((value) => value ?? false);
}
