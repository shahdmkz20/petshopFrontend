import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/colors.dart';

class svgImageContainer extends StatelessWidget {
  final String assetname;
  const svgImageContainer({Key? key, required this.assetname})
      : super(key: key);

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
        child: SvgPicture.asset(
          assetname,
          width: 150,
          height: 250,
        ));
  }
}
