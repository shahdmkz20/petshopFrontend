import 'package:get/get.dart';


import '../../../core/class/statusrequest.dart';
import '../../../core/constants/approutes.dart';
import '../../../core/functions/handling_data_controller.dart';
import '../../../data/datasource/remote/forgetpassword/verifycode.dart';

abstract class VerifyCodeController extends GetxController {
  resetpassword(String verifyCode);
}

class VerifyCodeImp extends VerifyCodeController {
  String? email;
  VerifyCodeForgetPass verifyCodeForgetPass = VerifyCodeForgetPass(Get.find());
  StatusRequest statusRequest = StatusRequest.begin;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  resetpassword(verifyCode) async {
    update();
    statusRequest = StatusRequest.loading;
    final response = await verifyCodeForgetPass.postData(email!, verifyCode);
    if (response != null) {
      statusRequest = handlingData(response) as StatusRequest;
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoutes.resetPassword, arguments: {"email": email});
        } else {
          print("Wrong.");
          Get.defaultDialog(title: '46'.tr, middleText: 'Email not found');
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      print("Signup API response is null or empty.");
      // Handle case where response is null
    }
  }
}
