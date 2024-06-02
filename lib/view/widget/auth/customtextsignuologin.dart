import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';


class CustomTextSignUpLogin extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final String btnTxt;
  const CustomTextSignUpLogin(
      {Key? key, required this.text, this.onTap, required this.btnTxt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 15),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            btnTxt,
            style: const TextStyle(
                fontSize: 15,
                color: AppColors.defaultRed,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
