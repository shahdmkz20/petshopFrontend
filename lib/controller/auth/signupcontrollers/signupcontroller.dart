import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../../core/class/statusrequest.dart';
import '../../../core/constants/approutes.dart';
import '../../../core/functions/handling_data_controller.dart';
import '../../../data/datasource/remote/auth/signup.dart';

abstract class SignupController extends GetxController {
  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  login();
  signup();
  verifyOTP();
  showPass();
}

class SignupControllerImp extends SignupController {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;
  StatusRequest statusRequest = StatusRequest.begin;
  SignUpData signupData = SignUpData(Get.find());
  List<dynamic> data = [];
  bool ShowPass = true;
  bool showPassConfirm = true;

  @override
  login() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
    usernameController = TextEditingController();
    super.onInit();
  }

  @override
  signup() async {
    var formData = formStateKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      final username = usernameController.text;
      final password = passwordController.text;
      final email = emailController.text;
      statusRequest = StatusRequest.loading;
      final response = await signupData.postData(username, password, email);
      if (response != null) {
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            print("Signup successful. Redirecting to OTP verification.");
            verifyOTP();
          } else {
            print("Signup failed: Email already exists.");
            Get.defaultDialog(
                title: 'Warning', middleText: 'email already exists');
            statusRequest = StatusRequest.failure;
          }
        }
      } else {
        print("Signup API response is null or empty.");
        // Handle case where response is null
      }
      update();
      // Handle the response...
    } else {
      print("Form validation failed.");
      // Handle invalid form state
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  verifyOTP() {
    Get.offNamed(AppRoutes.verifyOTPSignup,
        arguments: {"email": emailController.text});
  }

  @override
  showPass() {
    ShowPass = !ShowPass; // Toggle the value of ShowPass
    update();
  }

  void ShowPassConfirm() {
    showPassConfirm = !showPassConfirm;
    update();
  }
}
