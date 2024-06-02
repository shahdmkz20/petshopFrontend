
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../../controller/homecontroller/homescreencontroller.dart';
import 'customappbarbutton.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) =>  BottomAppBar(
          height: 50,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             /* ...List.generate(controller.pagesList.length, (index) => index > 1 ?const Spacer() :CustomAppBarButton(
                title: controller.buttonsTitle[index],
                icon: Icons.home,
                onPressed: () {
                  controller.changePage(index);
                }, selected: controller.currentPage == index ? true : false,
              ),)
*/

              CustomAppBarButton(
                title: '54'.tr,
                icon: Icons.home,
                onPressed: () {
                  controller.changePage(0);
                }, selected: controller.currentPage == 0 ? true : false,
              ),
              CustomAppBarButton(
                title: '55'.tr,
                icon: Icons.settings,
                onPressed: () {
                  controller.changePage(1);
                }, selected: controller.currentPage == 1 ? true : false,
              ),
            ],
          ),
        ),);
  }
}