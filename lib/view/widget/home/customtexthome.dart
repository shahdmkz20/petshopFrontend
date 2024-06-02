import 'package:flutter/cupertino.dart';

import '../../../core/constants/colors.dart';

class CustomTextHome extends StatelessWidget {
  final String text;
  const CustomTextHome({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5.0 ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: AppColors.primaryColor),
      ),
    );
  }
}
