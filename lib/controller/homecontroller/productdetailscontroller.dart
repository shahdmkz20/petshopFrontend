import 'package:get/get.dart';
import 'package:petshop/core/class/statusrequest.dart';
import 'package:petshop/core/services/services.dart';
import 'package:petshop/model/itemsmodel.dart';

import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/cart/cartdata.dart';

abstract class ProductController extends GetxController {
  initData();
  add();
  remove();
  addtoCart(String itemId);
  removeFromCart(String itemId);
  getItemCount(String itemId);
}

class ProductControllerImp extends ProductController {
  CartData cartData = CartData(Get.find());
  late ItemsModel itemsModel;
  MyServices myServices = Get.find();
  String? lang;

  int itemCount = 0;
  StatusRequest statusRequest = StatusRequest.begin;
  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    lang = myServices.sharedPreferences.getString('lang');
    itemCount = await getItemCount('${itemsModel.itemId}');
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  add() {
    addtoCart("${itemsModel.itemId}");
    itemCount++;
    update();
  }

  @override
  remove() {
    if (itemCount > 0) {
      itemCount--;
      removeFromCart("${itemsModel.itemId!}");
    }
    update();
  }

  @override
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

  @override
  removeFromCart(itemId) async {
    statusRequest = StatusRequest.loading;
    final response = await cartData.deleteFromCart(
        myServices.sharedPreferences.getString('email')!, itemId);
    if (response != null) {
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        Get.snackbar('72'.tr, '73'.tr);
      } else {
        statusRequest = StatusRequest.failure;
      }

      update();
    }
  }

  @override
  getItemCount(itemId) async {
    statusRequest = StatusRequest.loading;
    var itemCount;
    final response = await cartData.getItemCount(
        myServices.sharedPreferences.getString('email')!, itemId);
    if (response != null) {
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        itemCount = response['data'];
        return itemCount;
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }
}
