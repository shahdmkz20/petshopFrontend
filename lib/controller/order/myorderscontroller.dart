
import 'package:get/get.dart';
import 'package:petshop/core/services/services.dart';
import 'package:petshop/data/datasource/remote/order/orderdata.dart';
import 'package:petshop/model/ordersmodel.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';

abstract class MyOrders extends GetxController{
  view();
}


class myOrdersImp extends MyOrders{
StatusRequest statusRequest = StatusRequest.begin;
List<ordersmodel> data = [];
MyServices myServices = Get.find();

OrderData orderdata = OrderData(Get.find());
  @override
  view()async {
     data.clear();
    statusRequest = StatusRequest.loading;
    var response = await orderdata.postData(myServices.sharedPreferences.getString('email')!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        print(listdata);
        data.addAll(listdata.map((e) => ordersmodel.fromJson(e)));
        } 
      } else {
        statusRequest = StatusRequest.failure;
      }
       update();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }

}

