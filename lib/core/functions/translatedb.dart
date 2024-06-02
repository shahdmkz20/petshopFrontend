import 'package:get/get.dart';
import 'package:petshop/core/services/services.dart';

translateDatabase(columnAr , columnEN){
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString('lang') == 'ar'){
    return columnAr;
  }
  else {
    return columnEN;
  }
}