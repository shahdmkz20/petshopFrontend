import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop/core/constants/approutes.dart';
import 'package:petshop/model/itemsmodel.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart/cartdata.dart';
import '../../data/datasource/remote/home/homedata.dart';

class HomeControllerImp extends SearchDataMix {
  MyServices myServices = Get.find();
  List data = [];
  List categories = [];
  List items = [];
  String? username;
  String? lang;
   CartData cartData = CartData(Get.find());

  @override
  void onInit() {
    search = TextEditingController();
    initData();
    getData();
    super.onInit();
  }

  void initData() {
    username = myServices.sharedPreferences.getString('username');
    Locale l = Locale(Get.deviceLocale!.languageCode);
    myServices.sharedPreferences.setString('lang', l.toString());
    lang = myServices.sharedPreferences.getString('lang');
    update();
  }

  addtoCart(itemId) async {
    statusRequest = StatusRequest.loading;
    final response = await cartData.addToCart(
        myServices.sharedPreferences.getString('email')!, itemId);
    if (response != null) {
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        Get.snackbar('70'.tr, '71'.tr);
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  goToProd(itemsModel) {
    Get.toNamed(AppRoutes.productdetails, arguments: {
      'itemsModel': itemsModel,
    });
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    final response = await homeData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  toItem(categories, selectedCat, categoryId) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "cartegoryId": categoryId
    });
  }
}

class SearchDataMix extends GetxController {
  HomeData homeData = HomeData(Get.find());
  TextEditingController? search;
  bool isSearch = false;
  List<ItemsModel> searchedItemList = [];
  StatusRequest statusRequest = StatusRequest.begin;
  searchData() async {
    statusRequest = StatusRequest.loading;
    final response = await homeData.searchData(search!.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        searchedItemList.clear();
        List responseData = response['data'];
        searchedItemList
            .addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearch() {
    isSearch = true;
    searchData();
    update();
  }
}
