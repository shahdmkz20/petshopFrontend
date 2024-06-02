import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/signupcontrollers/signupcontroller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/functions/confirmpass.dart';
import '../../../../core/functions/exitalert.dart';
import '../../../../core/functions/validator.dart';
import '../../../reusable/button.dart';
import '../../../reusable/largebodytext.dart';
import '../../../reusable/mediumbodytext.dart';
import '../../../widget/auth/customformfield.dart';
import '../../../widget/auth/customtextsignuologin.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => (SignupControllerImp()));
    return WillPopScope(
      onWillPop: AlertExitApp,
      child: Scaffold(
        body: GetBuilder<SignupControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formStateKey,
                    child: Stack(
                      children: [
                        // Circle with low opacity in the top left corner
                        Positioned(
                          top: -35.0,
                          right: -25.0,
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange.withOpacity(0.1),
                            ),
                          ),
                        ),
                        Center(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 35),
                                    LargeBodyText(text: '10'.tr),
                                    const SizedBox(height: 15),
                                    MediumBodyText(text: "11".tr),
                                    const SizedBox(height: 25),
                                    CustomFormField(
                                      validator: (val) {
                                        return validInp(
                                            val!, 3, 25, "username");
                                      },
                                      fieldName: "21".tr,
                                      hintTxt: "21".tr,
                                      iconData: Icons.person_2_outlined,
                                      txtController:
                                          controller.usernameController,
                                    ),
                                    CustomFormField(
                                      validator: (val) {
                                        return validInp(val!, 8, 50, "email");
                                      },
                                      txtController: controller.emailController,
                                      fieldName: "12".tr,
                                      hintTxt: "13".tr,
                                      iconData: Icons.email_outlined,
                                    ),

                                    CustomFormField(
                                      validator: (val) {
                                        return validInp(
                                            val!, 8, 50, "password");
                                      },
                                      
                                      txtController:
                                          controller.passwordController,
                                      fieldName: "14".tr,
                                      hintTxt: "15".tr,
                                      iconData: Icons.lock_outline,
                                      isPassword: controller.ShowPass,
                                      onTapPass: controller
                                          .showPass, // Passing reference to the function
                                    ),
                                    CustomFormField(
                                      validator: (val) {
                                        return confirmPassword(
                                            controller.passwordController.text,
                                            val!);
                                      },
                                      txtController:
                                          controller.confirmPassController,
                                      fieldName: "16".tr,
                                      hintTxt: "16".tr,
                                      iconData: Icons.lock_outline,
                                      isPassword: controller.showPassConfirm,
                                      onTapPass: controller
                                          .ShowPassConfirm, // Passing reference to the function
                                    ),
                                    const SizedBox(height: 10),
                                    CustomButton(
                                      btnTxt: '9'.tr,
                                      onPressed: () {
                                        controller.signup();
                                      },
                                    ), //signup
                                    const SizedBox(height: 10),
                                    CustomTextSignUpLogin(
                                      text: "18".tr,
                                      btnTxt: '19'.tr,
                                      onTap: () => controller.login(),
                                    ), //already have account
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
