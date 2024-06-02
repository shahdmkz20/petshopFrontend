import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop/core/constants/colors.dart';

class CustomTotalRow extends StatelessWidget {

  final String totalPrice;
  const CustomTotalRow({super.key,  required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return    Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${'60'.tr} :',
                        style: const TextStyle(fontSize: 22 ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$totalPrice \$',
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700, fontSize: 25),
                      ),
                    ),
                  ],
                );
  }
}