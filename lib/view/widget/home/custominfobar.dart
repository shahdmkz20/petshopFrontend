import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop/core/services/services.dart';

import '../../../core/constants/colors.dart';

class CustomInfoBar extends StatelessWidget{
  final String title;
  final String body;
  const CustomInfoBar({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String? lang  = myServices.sharedPreferences.getString('lang');
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(
                  fontSize: 15, color: AppColors.defaultWhite),
            ),
            subtitle: Text(
              body,
              style: const TextStyle(
                  fontSize: 30, color: AppColors.defaultWhite),
            ),
          ),
        ),
        
        Positioned(
          top: -30,
          right: lang == "en" ? -30 : null,
          left: lang == 'ar' ? -30 : null,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              color: AppColors.thirdColor,
              borderRadius: BorderRadius.circular(160),
            ),
          ),
        )
      ],
    );
  }
}
