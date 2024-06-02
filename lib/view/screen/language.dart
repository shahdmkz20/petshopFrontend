import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/approutes.dart';
import '../../core/localizations/changelocal.dart';
import '../reusable/button.dart';

class Language extends GetView<LocalLangController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 25),
            CustomButton(
                btnTxt: "English",
                onPressed: () {
                  controller.changeLang('en');
                  Get.toNamed(AppRoutes.onBoarding);
                }),
            const SizedBox(
              height: 5,
            ),
            CustomButton(
                btnTxt: "Arabic",
                onPressed: () {
                  controller.changeLang('ar');
                  Get.toNamed(AppRoutes.onBoarding);
                }),
          ],
        ),
      ),
    );
  }
}
