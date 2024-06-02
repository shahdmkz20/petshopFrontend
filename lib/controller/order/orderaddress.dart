import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petshop/core/class/statusrequest.dart';
import 'package:petshop/core/constants/approutes.dart';
import 'package:petshop/core/services/services.dart';
import 'package:petshop/data/datasource/remote/order/addressdata.dart';
import 'package:petshop/data/datasource/remote/order/placeorderdata.dart';

import '../../core/functions/handling_data_controller.dart';

abstract class OrderAddress extends GetxController {
  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  verifyAddress();
  confirmOrder();
  toOrders();
}

class OrderAddressImp extends OrderAddress {
  late TextEditingController addressCity;
  late TextEditingController addressStreet;
  late TextEditingController addressLat;
  late TextEditingController addressLang;
  late TextEditingController addressPhone;
  late TextEditingController addressDesc;
  late String totalPrice;
  late String addressId;
  bool showConfirm = false;
  AddressData addressData = AddressData(Get.find());
  PlaceOrderData placeOrderData = PlaceOrderData(Get.find());
  StatusRequest statusRequest = StatusRequest.begin;
  List addressDate = [];
  MyServices myServices = Get.find();
  @override
  verifyAddress() async {
    var formData = formStateKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      final response = await addressData.postData(
          myServices.sharedPreferences.getString('email')!,
          addressCity.text,
          addressStreet.text,
          addressPhone.text,
          addressDesc.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        addressId = response["address_id"].toString();
        showConfirm = true;
        Get.snackbar('85'.tr, '86'.tr);
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    addressPhone = TextEditingController();
    addressCity = TextEditingController();
    addressStreet = TextEditingController();
    addressLat = TextEditingController();
    addressLang = TextEditingController();
    addressDesc = TextEditingController();
    totalPrice = Get.arguments['totalPrice'];
    super.onInit();
  }

  @override
  void dispose() {
    addressCity.dispose();
    addressStreet.dispose();
    addressLat.dispose();
    addressLang.dispose();
    addressPhone.dispose();
    addressDesc.dispose();
    super.dispose();
  }

  @override
  confirmOrder() async {
    statusRequest = StatusRequest.loading;
    final response = await placeOrderData.postData(
      myServices.sharedPreferences.getString('email')!,
      addressId,
      totalPrice,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.snackbar('91'.tr, '92'.tr);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
  
  @override
  toOrders() {
   Get.offAllNamed(AppRoutes.orderplaced);
  }


}
