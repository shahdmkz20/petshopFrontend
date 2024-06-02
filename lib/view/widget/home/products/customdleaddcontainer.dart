import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

// ignore: must_be_immutable
class CustomAddDelPriceContanier extends StatelessWidget {
  final double price;
  final int count;
  void Function()? onAdd;
  void Function()? onDelete;
  CustomAddDelPriceContanier(
      {super.key,
      required this.price,
      required this.count,
      required this.onAdd,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            MaterialButton(
              minWidth: 10,
              padding: EdgeInsets.zero,
              onPressed: onDelete,
              child: const Icon(
                Icons.remove,
                color: AppColors.primaryColor,
              ),
            ),
            Text("$count"),
            MaterialButton(
              minWidth: 10,
              padding: EdgeInsets.zero,
              onPressed: onAdd,
              child: const Icon(
                Icons.add,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          '$price \$',
          textAlign: TextAlign.end,
          textDirection: TextDirection.ltr,
          style: const TextStyle(
              color: AppColors.defaultRed, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
