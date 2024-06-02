import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';

class CustomProductButton extends StatelessWidget {
  final String? lang;
  final void Function()? onPressed;
  const CustomProductButton(
      {super.key, required this.lang, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.secondryColor,
          ),
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          child: Row(
            children: [
              Text(
                '58'.tr,
                style: TextStyle(fontSize: lang == 'ar' ? 15 : 18),
              ),
              Spacer(),
              const Icon(Icons.add_shopping_cart)
            ],
          )),
    );
  }
}
