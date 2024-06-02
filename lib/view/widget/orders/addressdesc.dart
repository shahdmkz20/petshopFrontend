import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

// ignore: must_be_immutable
class CustomDescriptionField extends StatelessWidget {
  final String hintTxt;
  final String fieldName;
  final TextEditingController? txtController;

  const CustomDescriptionField({
    super.key,
    required this.hintTxt,
    required this.fieldName,
    required this.txtController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        maxLines: 5,
        style: const TextStyle(fontSize: 17),
        controller: txtController,
        decoration: InputDecoration(
          hintText: hintTxt,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.orange), // Border color when focused
            borderRadius: BorderRadius.circular(25),
          ),
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: fieldName,
          labelStyle: const TextStyle(fontSize: 14),
         
        ),
      ),
    );
  }
}
