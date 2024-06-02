import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:petshop/data/datasource/remote/forgetpassword/resetpassword.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constants/approutes.dart';
import '../../../core/functions/handling_data_controller.dart';

abstract class ResetPasswordController extends GetxController {
  passwordChanged();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController confirm_Password;
  String? email;
  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.begin;
  @override
  void onInit() {
    password = TextEditingController();
    confirm_Password = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confirm_Password.dispose();
    super.dispose();
  }

  @override
  passwordChanged() async {
    var formData = formStateKey.currentState;
    if (password.text == confirm_Password.text) {
      if (formData!.validate()) {
        update();
        statusRequest = StatusRequest.loading;
        final response =
            await resetPasswordData.postData(email!, password.text);
        if (response != null) {
          statusRequest = handlingData(response) as StatusRequest;
          if (statusRequest == StatusRequest.success) {
            if (response["status"] == "success") {
              Get.offNamed(AppRoutes.login);
            } else {
              print(email);
              print("Wrong.");
              Get.defaultDialog(title: '46'.tr, middleText: 'please try again');
              statusRequest = StatusRequest.failure;
            }
          }
        } else {
          print("Signup API response is null or empty.");
          // Handle case where response is null
        }
      } else {
        print("invalid data");
      }
    } else {
      Get.defaultDialog(title: '46'.tr, middleText: "password didn't match");
    }
  }
}
