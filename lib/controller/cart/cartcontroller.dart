import 'package:get/get.dart';
import 'package:petshop/core/class/statusrequest.dart';
import 'package:petshop/core/services/services.dart';

import '../../core/constants/approutes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/cart/cartdata.dart';
import '../../model/cartmodel.dart';

abstract class CartController extends GetxController {
  add(String itemId);
  delete(String itemId);
  view();
  reserVariable();
  refreshUi();
  goToPlaceOrder();
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.begin;
  MyServices myServices = Get.find();
  List<CartModel> data = [];
  late double totalPrice = 0.0;
  int productCount = 0;

  @override
  void onInit() {
    view();
    super.onInit();
  }

  @override
  add(itemId) async {
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
  delete(itemId) async {
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
  view() async {
    statusRequest = StatusRequest.loading;
    update();
    final response = await cartData
        .viewCart(myServices.sharedPreferences.getString('email')!);
    if (response != null) {
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['data']['status'] == 'success') {
          List responeData = response['data']['data'];
          Map responeDataCountPrice = response['countprice'];
          data.clear();
          data.addAll(responeData.map((e) => CartModel.fromJson(e)));
          productCount = int.parse(responeDataCountPrice['totalCount']);
          totalPrice = responeDataCountPrice['totalPrice'];
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  refreshUi() {
    reserVariable();
    view();
  }

  @override
  reserVariable() {
    totalPrice = 0.0;
    productCount = 0;
    data.clear();
  }

  @override
  goToPlaceOrder() {
   if(data.isEmpty ) {
      return Get.snackbar('Warning', 'Your cart is empty');
    }
   Get.toNamed(AppRoutes.orderAddress , 
   arguments: {
    "totalPrice" :totalPrice.toString() , 
   });
  }
}
