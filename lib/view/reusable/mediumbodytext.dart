import 'package:flutter/material.dart';

class MediumBodyText extends StatelessWidget {
  final String text;
  const MediumBodyText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
