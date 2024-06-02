import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String btnTxt;
  final void Function()? onPressed;

  const CustomButton({
    Key? key,
    required this.btnTxt,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        elevation: 20,
        onPressed: onPressed,
        child: Text(
          btnTxt,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: AppColors.defaultWhite,
          ),
        ),
      ),
    );
  }
}
