import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api_links.dart';
import '../../../controller/homecontroller/homecontroller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constants/colors.dart';
import '../../../core/functions/translatedb.dart';
import '../../../model/itemsmodel.dart';
import '../../reusable/customappbar.dart';
import '../../widget/home/customcategorieslist.dart';
import '../../widget/home/custominfobar.dart';
import '../../widget/home/customitemslist.dart';
import '../../widget/home/customtexthome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return SafeArea(
      child: GetBuilder<HomeControllerImp>(
          builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
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
                    HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: !controller.isSearch
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomInfoBar(
                                    title: '52'.tr,
                                    body: '53'.tr,
                                  ),
                                  CustomTextHome(text: '81'.tr),
                                  const CustomCategoryList(),
                                  CustomTextHome(text: '51'.tr),
                                  const CustomListItems(),
                                ],
                              )
                            : SearchedItemList(
                                searchedItemList: controller.searchedItemList,
                              ))
                  ],
                ),
              )),
    );
  }
}

class SearchedItemList extends GetView<HomeControllerImp> {
  final List<ItemsModel> searchedItemList;
  const SearchedItemList({super.key, required this.searchedItemList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: searchedItemList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToProd(searchedItemList[index]);
            },
            child: Card(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: CachedNetworkImage(
                            width: 50,
                            height: 100,
                            imageUrl:
                                '${AppLink.imageItems}/${searchedItemList[index].itemImage}')),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        title: Text(
                            "${translateDatabase(searchedItemList[index].itemNameAr, searchedItemList[index].itemNameEng)}"),
                        subtitle: Text(
                            '${translateDatabase(searchedItemList[index].categoryNameAr, searchedItemList[index].categoryNameEng)}'),
                        trailing: Text(
                          "${searchedItemList[index].itemPrice}\$",
                          style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.defaultRed,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
