import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/auth/logincontroller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/exitalert.dart';
import '../../../core/functions/validator.dart';
import '../../reusable/button.dart';
import '../../reusable/largebodytext.dart';
import '../../reusable/logocontainer.dart';
import '../../widget/auth/customformfield.dart';
import '../../widget/auth/customtextsignuologin.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => (LoginControllerImp()));
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "19".tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          centerTitle: true,
        ),
        body: WillPopScope(
          onWillPop: AlertExitApp,
          child: GetBuilder<LoginControllerImp>(
              init: LoginControllerImp(),
              builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Form(
                      key: controller.formStateKey,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          child: ListView(
                            children: [
                              const LogoContainer(),
                              LargeBodyText(
                                text: '20'.tr,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomFormField(
                                validator: (val) {
                                  return validInp(val!, 12, 80, "email");
                                },
                                fieldName: "12".tr,
                                hintTxt: "13".tr,
                                iconData: Icons.email_outlined,
                                onTapPass: () {},
                                txtController: controller.emailController,
                              ),
                              CustomFormField(
                                validator: (val) {
                                  return validInp(val!, 8, 50, "password");
                                },
                                fieldName: "14".tr,
                                hintTxt: "15".tr,
                                isPassword: controller.show,
                                onTapPass: () {
                                  controller.showPass();
                                },
                                iconData: Icons.lock_outline,
                                txtController: controller.passwordController,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.forgetPassword();
                                },
                                child: Text(
                                  "17".tr,
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ), // forget password?
                              CustomButton(
                                btnTxt: '19'.tr,
                                onPressed: () {
                                  controller.login();
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //login
                              CustomTextSignUpLogin(
                                  text: "22".tr,
                                  btnTxt: '9'.tr,
                                  onTap: () =>
                                      controller.signUp()) //don't have account
                            ],
                          )),
                    ),
                  )),
        ));
  }
}
