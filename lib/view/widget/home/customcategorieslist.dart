import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop/core/services/services.dart';
import '../../../api_links.dart';
import '../../../controller/homecontroller/homecontroller.dart';
import '../../../core/constants/colors.dart';
import '../../../core/functions/translatedb.dart';
import '../../../model/categoriesmodel.dart';

class CustomCategoryList extends GetView<HomeControllerImp> {
  const CustomCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 145,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: AppColors.primaryColor), // Border styling
                borderRadius:
                    BorderRadius.circular(10), // Optional: Add border radius
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: 130,
              child: Categories(
                i : index , 
                categoriesModel: CategoriesModel.fromJson(controller.categories[index]),
              ),
            );
          }),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel , required this.i});

  @override
  Widget build(BuildContext context) {
     MyServices myServices = Get.find();
    String? lang = myServices.sharedPreferences.getString('lang');
    return InkWell(
      onTap: () {
      controller.toItem(controller.categories, i! , categoriesModel.categoryId.toString());
      },
      child: Column(
        children: [
          Image.network(
            "${AppLink.imageCategories}/${categoriesModel.categoryImage}",
            width: 80,
          ),
          const Spacer(),
          Text(
            "${translateDatabase(categoriesModel.categoryNameAr ,categoriesModel.categoryNameEng )}"
            ,
            style:  TextStyle(fontSize: lang == 'ar' ? 15 : 18),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
