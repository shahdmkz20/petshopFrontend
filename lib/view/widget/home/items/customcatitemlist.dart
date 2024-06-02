import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:petshop/controller/homecontroller/itemscontroller.dart';
import 'package:petshop/core/functions/translatedb.dart';

import '../../../../core/constants/colors.dart';
import '../../../../model/categoriesmodel.dart';


class CustomItemCategoryList extends GetView<itemSControllerImp> {
  const CustomItemCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 10),
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
              i : index , 
              categoriesModel: CategoriesModel.fromJson(controller.categories[index]),
            );
          }),
    );
  }
}

class Categories extends GetView<itemSControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel , required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       controller.changeCat(i , categoriesModel.categoryId.toString());
      },
      child: Column(
        children: [
          GetBuilder<itemSControllerImp>(
            builder: (controller) => Container(
                 padding : const EdgeInsets.all(5) , 
              decoration: BoxDecoration(
             
                borderRadius: BorderRadius.circular(8),
                border: Border(bottom:BorderSide(color: controller.selectedCat == i ? AppColors.primaryColor: AppColors.defaultGrey , width: 2) ,)
              ),
              child: Text(
                "${translateDatabase(categoriesModel.categoryNameAr, categoriesModel.categoryNameEng)}",
                style:  const TextStyle(fontSize: 19 ,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
