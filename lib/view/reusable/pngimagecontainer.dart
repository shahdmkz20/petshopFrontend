import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class PngImageContainer extends StatelessWidget {
  final String assetname;
  final double height;
  final double width;
  const PngImageContainer(
      {Key? key,
      required this.assetname,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(30),
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
          assetname,
          width: width,
          height: height,
        ));
  }
}
