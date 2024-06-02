import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';


import '../../../../controller/auth/signupcontrollers/verifyotp.dart';
import '../../../../core/constants/colors.dart';

class VerifyOTPfield extends StatelessWidget {
  const VerifyOTPfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyOTPcontrollerImp controller = Get.put(VerifyOTPcontrollerImp());
    return Directionality(
      textDirection: TextDirection.ltr, // Ensure text starts from left
      child: OtpTextField(
        numberOfFields: 5,
        fieldWidth: 50,
        borderRadius: BorderRadius.circular(15),
        focusedBorderColor: AppColors.primaryColor,
        borderColor: const Color(0xFF512DA8),
        showFieldAsBox: true,
        onCodeChanged: (String code) {
          // handle validation or checks here
        },
        onSubmit: (String verificationCode) {
          controller.success(verificationCode);
        },
      ),
    );
  }
}
