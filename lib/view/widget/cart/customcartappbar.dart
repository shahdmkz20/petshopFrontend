import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCartAppBar extends StatelessWidget {
  const CustomCartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10),
        child: const Text(
      'My Cart',
      style: TextStyle(fontSize: 25),
    ));
  }
}
