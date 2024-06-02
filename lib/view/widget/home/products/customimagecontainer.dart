import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api_links.dart';
import '../../../../core/constants/colors.dart';

class CustomProductImageContainer extends StatelessWidget {
  final String imageName;
  const CustomProductImageContainer({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return     Container(
            decoration: BoxDecoration(
                color: AppColors.secondryColor,
                borderRadius: BorderRadius.circular(25)),
            width: double.infinity,
            height: Get.height / 1.65,
            child: CachedNetworkImage(
              imageUrl:
                  '${AppLink.imageItems}/$imageName',
            ),
    );
  }
}