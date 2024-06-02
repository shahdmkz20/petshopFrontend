import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop/core/constants/approutes.dart';
import 'package:petshop/core/constants/imageassets.dart';
import 'package:petshop/view/reusable/mediumbodytext.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay navigation after 5 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.myOrders);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAssets.orderplaced),
            MediumBodyText(text: '74'.tr),
          ],
        ),
      ),
    );
  }
}
