
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop/core/constants/approutes.dart';

import '../../core/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? iconPressed;
  final void Function(String)? onChanged;
  final void Function()? searchPressed;
  final TextEditingController controller;
  const CustomAppBar(
      {super.key, required this.iconPressed, required this.searchPressed, this.onChanged, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: controller,
                onChanged: onChanged,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: searchPressed,
                    icon: const Icon(
                      Icons.search,
                      size: 35,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    color: AppColors.defaultGrey,
                  ),
                  hintText: '56'.tr,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.defaultBlack.withOpacity(0.5)) , 
              borderRadius: BorderRadius.circular(32)
            ),
            child: IconButton(onPressed: (){
              Get.toNamed(AppRoutes.myOrders);
            }, icon: const Icon(Icons.airport_shuttle , color: AppColors.primaryColor, size: 35,)))
        ],
      ),
    );
  }
}
