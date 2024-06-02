import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../controller/auth/forgetpasswordcontroller/checkemail.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/functions/validator.dart';
import '../../../reusable/button.dart';
import '../../../reusable/largebodytext.dart';
import '../../../reusable/mediumbodytext.dart';
import '../../../widget/auth/customformfield.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    CheckEmailImp controller = Get.put(CheckEmailImp());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
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
            GetBuilder<CheckEmailImp>(
                builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Center(
                        child: Form(
                          key: controller.formState,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 40),
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.5, // Set height as per your requirement
                                  child: ListView(
                                    children: [
                                      LargeBodyText(
                                        text: '25'.tr,
                                      ),
                                      MediumBodyText(
                                          text: '24'
                                              .tr), //enter email to reset password
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomFormField(
                                          validator: (val) {
                                            return validInp(
                                                val!, 20, 100, 'email');
                                          },
                                          hintTxt: "12".tr,
                                          fieldName: '13'.tr,
                                          iconData: Icons.email_outlined,
                                          txtController:
                                              controller.emailController),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomButton(
                                        btnTxt: '23'.tr,
                                        onPressed: () {
                                          controller.checkEmail();
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
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
