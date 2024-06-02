
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop/controller/homecontroller/homecontroller.dart';
import 'package:petshop/core/class/statusrequest.dart';
import 'package:petshop/core/constants/approutes.dart';
import 'package:petshop/data/datasource/remote/home/itemsdata.dart';
import 'package:petshop/model/itemsmodel.dart';

import '../../core/functions/handling_data_controller.dart';

abstract class itemsController extends SearchDataMix{
initData();
changeCat(val , String categoryId);
getItems(String categoryId);
goToProd(ItemsModel itemsModel);
}


class itemSControllerImp extends itemsController{

  List categories = [];
  int? selectedCat;
  late String catId;

  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.begin;
  List<dynamic> data = [];

  @override
  initData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catId = Get.arguments['cartegoryId'];
    getItems(catId);
     search = TextEditingController();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
  
  @override
  changeCat(val , categoryId) {
   selectedCat = val;
   getItems(categoryId);
   update();
  }
  
  @override
  getItems(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    final response = await itemsData.getData(categoryId);
    print("================== Controller  $response ================");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
          data.addAll(response['data'] as List<dynamic>);
        } 
      } else {
        statusRequest = StatusRequest.failure;
      }
       update();
    }
    
      @override
      goToProd(itemsModel) {
          Get.toNamed(AppRoutes.productdetails  , arguments: {
            'itemsModel' : itemsModel , 
          });
      }
   
  }

