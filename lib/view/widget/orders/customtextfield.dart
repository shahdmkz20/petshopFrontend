import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String data;
  const CustomTextField({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(data, style:const  TextStyle(fontSize: 20 , fontWeight: FontWeight.w600 , color: AppColors.primaryColor));
  }
}