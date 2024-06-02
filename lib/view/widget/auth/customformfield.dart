import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';


// ignore: must_be_immutable
class CustomFormField extends StatelessWidget {
  final String hintTxt;
  final String fieldName;
   IconData? iconData;

  String? Function(String?)? validator;
  TextEditingController? txtController;
  final bool isPassword;
  final void Function()? onTapPass;

  CustomFormField({
    Key? key,
    required this.hintTxt,
    required this.fieldName,
    this.iconData,
    required this.txtController,
    this.validator,
    this.isPassword = false,
    this.onTapPass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: isPassword,
        validator: validator,
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          suffixIcon: onTapPass != null
              ? InkWell(
                  onTap: onTapPass,
                  child: Icon(iconData),
                )
              : null,
        ),
      ),
    );
  }
}
