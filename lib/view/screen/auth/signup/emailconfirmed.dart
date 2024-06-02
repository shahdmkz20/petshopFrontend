import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/approutes.dart';
import '../../../../core/constants/imageassets.dart';
import '../../../reusable/largebodytext.dart';


class EmailConfirmed extends StatelessWidget {
  const EmailConfirmed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Future.delayed to push a route after 5 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // After 5 seconds, navigate to the next screen or remove this one
      Get.offNamed(AppRoutes.login);
    });

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LargeBodyText(text: '32'.tr),
            const SizedBox(
              height: 15,
            ),
            // Use Stack to overlay the animated icon over the container
            Stack(
              children: [
                Image.asset(
                  ImageAssets.verified,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
