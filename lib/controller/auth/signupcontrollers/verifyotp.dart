import 'package:get/get.dart';


import '../../../core/class/statusrequest.dart';
import '../../../core/constants/approutes.dart';
import '../../../core/functions/handling_data_controller.dart';
import '../../../data/datasource/remote/auth/verifyOTP.dart';

abstract class VerifyOTP extends GetxController {
  success(String verifyCode);
  resendCode();
}

class VerifyOTPcontrollerImp extends VerifyOTP {
  verifyOTPData verifyOtp = verifyOTPData(Get.find());

  String? email;
  StatusRequest statusRequest = StatusRequest.begin;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  success(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    print(email);
    if (email != null) {
      final response = await verifyOtp.postData(email!, verifyCode);
      if (response != null) {
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            Get.offNamed(AppRoutes.emailConfirmed);
          } else {
            print("Wrong verify code.");
            Get.defaultDialog(
                title: 'Warning', middleText: 'wrong verify code');
            statusRequest = StatusRequest.failure;
          }
        }
      } else {
        print("Signup API response is null or empty.");
        // Handle case where response is null
      }
      update();
    } else {
      print("email is null $email");
    }
  }
  @override
  resendCode() async {
  final arguments = Get.arguments;
  
    final email = arguments["email"];
    // ignore: unused_local_variable
    final response = await verifyOtp.resendCode(email);

}

}
