import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop/view/screen/language.dart';

import '../../view/screen/home/home.dart';

abstract class HomeScreenController extends GetxController{
    changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController{
  int currentPage = 0;
  List<Widget> pagesList = [
    const Home() ,
    const Language() ,
  ];
  List buttonsTitle = [
    "54".tr ,
    "55".tr
  ];
  @override
  changePage(int index) {
   currentPage = index;
   update();
  }
}