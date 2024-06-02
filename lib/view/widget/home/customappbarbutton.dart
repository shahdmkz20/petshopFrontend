// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:petshop/core/constants/colors.dart';

class CustomAppBarButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final IconData icon;
  final bool? selected;
  const CustomAppBarButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.icon,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selected == true ? AppColors.primaryColor : AppColors.defaultBlack,
          ),
      
        ],
      ),
    );
  }
}
