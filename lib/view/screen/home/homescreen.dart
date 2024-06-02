
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop/core/constants/approutes.dart';
import 'package:petshop/core/constants/colors.dart';
import 'package:petshop/view/widget/home/custombottomappbar.dart';


import '../../../controller/homecontroller/homescreencontroller.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            Get.toNamed(AppRoutes.cart);
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.shopping_cart , color: AppColors.defaultWhite),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:const CustomBottomAppBar() ,
        body: controller.pagesList.elementAt(controller.currentPage),
      ),
    );
  }
}
