import 'package:flutter/cupertino.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpasswordcontroller/verfiycodecontroller.dart';
import '../../../../core/constants/colors.dart';

class VerifyCodeField extends StatelessWidget {
  const VerifyCodeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeImp controller = Get.put(VerifyCodeImp());
    return Directionality(
      textDirection: TextDirection.ltr, // Ensure text starts from left
      child: OtpTextField(
        numberOfFields: 5, // Ensure this is an integer value
        fieldWidth: 50,
        borderRadius: BorderRadius.circular(15),
        focusedBorderColor: AppColors.primaryColor,
        borderColor: const Color(0xFF512DA8),
        showFieldAsBox: true,
        onCodeChanged: (String code) {
          // handle validation or checks here
        },
        onSubmit: (String verificationCode) {
          controller.resetpassword(verificationCode);
        },
      ),
    );
  }
}
