import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop/controller/homecontroller/productdetailscontroller.dart';
import 'package:petshop/core/class/handlingdataview.dart';
import 'package:petshop/core/constants/colors.dart';
import 'package:petshop/view/widget/home/products/customdleaddcontainer.dart';

import '../../../core/constants/approutes.dart';
import '../../../core/functions/translatedb.dart';
import '../../widget/home/products/customimagecontainer.dart';
import '../../widget/home/products/customproductbutton.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ProductControllerImp controller = Get.put(ProductControllerImp());
    return Scaffold(
      body: GetBuilder<ProductControllerImp>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(25),
            child: ListView(children: [
              CustomProductImageContainer(
                  imageName: "${controller.itemsModel.itemImage}"),
              SizedBox(
                height: Get.height / 50,
              ),
              Text(
                '${translateDatabase(controller.itemsModel.itemNameAr, controller.itemsModel.itemNameEng)}',
                style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: Get.height / 100,
              ),
              Text(
                  '${translateDatabase(controller.itemsModel.categoryNameAr, controller.itemsModel.categoryNameEng)}'),
              SizedBox(
                height: Get.height / 100,
              ),
              Text(
                  '${'57'.tr} : ${translateDatabase(controller.itemsModel.itemDescriptionAr, controller.itemsModel.itemDescriptionEng)}'),
              SizedBox(
                height: Get.height / 100,
              ),
              CustomAddDelPriceContanier(
                price: controller.itemsModel.itemPrice!,
                count: controller.itemCount,
                onDelete: () {
                
                  controller.remove();
                },
                onAdd: () {
                
                  controller.add();
                },
              ),
              SizedBox(
                height: Get.height / 80,
              ),
              CustomProductButton(lang: controller.lang, onPressed: () {   Get.toNamed(AppRoutes.cart);},),
            ]),
          ),
        );
      }),
    );
  }
}
