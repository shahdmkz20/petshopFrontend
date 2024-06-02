import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop/core/constants/colors.dart';

class CustomCartButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomCartButton({super.key, required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap
      ,
      child: Container(
        decoration:  BoxDecoration(color: AppColors.primaryColor  ,
        borderRadius: BorderRadius.circular(10) , 
        ) ,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(child: Text('59'.tr , style:const TextStyle( 
          fontWeight: FontWeight.w600,
          color: AppColors.defaultWhite , 
          fontSize: 20,
        ))),
      ),
    );
  }
}