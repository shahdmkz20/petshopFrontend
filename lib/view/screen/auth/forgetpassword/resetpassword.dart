import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../controller/auth/forgetpasswordcontroller/resetpasswordcontroller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/functions/validator.dart';
import '../../../reusable/button.dart';
import '../../../reusable/mediumbodytext.dart';
import '../../../widget/auth/customformfield.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      body: SafeArea(
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
                  color: Colors.orange.withOpacity(0.1), // Change opacity here
                ),
              ),
            ),
            GetBuilder<ResetPasswordControllerImp>(
                builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Form(
                        key: controller.formStateKey,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 40),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    MediumBodyText(
                                        text: '29'.tr), //enter new password
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    CustomFormField(
                                        validator: (val) {
                                          return validInp(
                                              val!, 8, 100, 'password');
                                        },
                                        hintTxt: "14".tr,
                                        fieldName: '30'.tr,
                                        iconData: Icons.lock_outline,
                                        onTapPass: () {},
                                        txtController: controller.password),
                                    CustomFormField(
                                        validator: (val) {
                                          return validInp(
                                              val!, 8, 100, 'password');
                                        },
                                        onTapPass: () {},
                                        hintTxt: "14".tr,
                                        fieldName: '16'.tr,
                                        iconData: Icons.lock_outline,
                                        txtController:
                                            controller.confirm_Password),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomButton(
                                      btnTxt: '31'.tr,
                                      onPressed: () {
                                        controller.passwordChanged();
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
