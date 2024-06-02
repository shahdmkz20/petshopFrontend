import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:petshop/core/class/statusrequest.dart';

import '../../../core/constants/approutes.dart';
import '../../../core/functions/handling_data_controller.dart';
import '../../../data/datasource/remote/forgetpassword/checkemail.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
}

class CheckEmailImp extends CheckEmailController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  late TextEditingController emailController;
  StatusRequest statusRequest = StatusRequest.begin;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  checkEmail() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      final response = await checkEmailData.postData(emailController.text);
      if (response != null) {
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            Get.offNamed(AppRoutes.verifyCode,
                arguments: {"email": emailController.text});
          } else {
            print("Wrong.");
            Get.defaultDialog(title: '46'.tr, middleText: 'Email not found');
            statusRequest = StatusRequest.failure;
          }
        }
      } else {
        // Handle case where response is null
      }
    } else {
      print("invalid data");
    }
  }
}
