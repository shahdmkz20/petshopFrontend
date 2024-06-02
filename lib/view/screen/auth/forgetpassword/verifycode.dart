import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/imageassets.dart';
import '../../../reusable/mediumbodytext.dart';
import '../../../widget/auth/forgetpassword/verifycode.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '26'.tr,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: ListView(
                children: [
                  Image.asset(
                    ImageAssets.otp,
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MediumBodyText(text: '27'.tr), //enter email to reset password
                  const SizedBox(
                    height: 15,
                  ),
                  const VerifyCodeField(),
                ],
              ))),
    );
  }
}
