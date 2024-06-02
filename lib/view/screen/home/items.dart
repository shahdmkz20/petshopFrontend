import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop/controller/homecontroller/itemscontroller.dart';
import 'package:petshop/core/class/handlingdataview.dart';
import 'package:petshop/model/itemsmodel.dart';
import 'package:petshop/view/reusable/customappbar.dart';
import 'package:petshop/view/screen/home/home.dart';

import '../../widget/home/items/customcatitemlist.dart';
import '../../widget/home/items/customlistcart.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(itemSControllerImp());
    return Scaffold(
      body: GetBuilder<itemSControllerImp>(
        builder: (controller) => Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              CustomAppBar(
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                controller: controller.search!,
                iconPressed: () {},
                searchPressed: () {
                  controller.onSearch();
                },
              ),
              const CustomItemCategoryList(),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return CustomItemCar(
                              itemsModel:
                                  ItemsModel.fromJson(controller.data[index]),
                            );
                          },
                        )
                      : SearchedItemList(
                          searchedItemList: controller.searchedItemList,
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
