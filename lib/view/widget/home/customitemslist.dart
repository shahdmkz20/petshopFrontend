import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petshop/core/functions/translatedb.dart';
import '../../../api_links.dart';
import '../../../controller/homecontroller/homecontroller.dart';
import '../../../core/constants/colors.dart';
import '../../../core/services/services.dart';
import '../../../model/itemsmodel.dart';

class CustomListItems extends GetView<HomeControllerImp> {
  const CustomListItems({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      // Background color
      child: ListView.builder(
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: [
              items(
                itemsModel: ItemsModel.fromJson(controller.items[index]),

              ),
            ],
          );
        },
      ),
    );
  }
}

class items extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
 
  const items({Key? key, required this.itemsModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String? lang = myServices.sharedPreferences.getString('lang');
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: AppColors.primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                '${AppLink.imageItems}/${itemsModel.itemImage}',
                width: 150,
                height: 140,
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "${translateDatabase(itemsModel.itemNameAr, itemsModel.itemNameEng)}",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.defaultGrey),
                    ),
                    Text(
                      "${itemsModel.itemPrice}\$",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.defaultGrey),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: lang == 'en' ? 5 : null,
          left: lang == 'ar' ? 5 : null,
          child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight:
                        lang == 'en' ? Radius.circular(17) : Radius.zero,
                    bottomLeft:
                        lang == 'ar' ? Radius.circular(17) : Radius.zero,
                    topLeft: lang == 'en' ? Radius.circular(20) : Radius.zero,
                    topRight: lang == 'ar' ? Radius.circular(20) : Radius.zero,
                  )),
              child: IconButton(
                icon: const Icon(Icons.add_shopping_cart_outlined),
                onPressed:(){
                   controller.addtoCart("${itemsModel.itemId}");
                },
                color: AppColors.defaultWhite,
              )),
        )
      ],
    );
  }
}
