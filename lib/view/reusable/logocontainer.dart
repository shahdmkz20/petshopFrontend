import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/imageassets.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        clipBehavior: Clip.hardEdge,
        width: double.infinity,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            border: Border(
                top: BorderSide(color: AppColors.primaryColor, width: 5),
                bottom: BorderSide(color: AppColors.primaryColor, width: 5),
                right: BorderSide(color: AppColors.primaryColor),
                left: BorderSide(color: AppColors.primaryColor))),
        child: Image.asset(
          ImageAssets.logo,
          width: 150,
          height: 250,
        ));
  }
}
