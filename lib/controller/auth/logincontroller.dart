import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/approutes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/logindata.dart';

abstract class LoginController extends GetxController {
  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  login();
  signUp();
  forgetPassword();
  showPass();
}

class LoginControllerImp extends LoginController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool show = true;
  LoginData logindata = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.begin;
  MyServices myServices = Get.find();

  @override
  login() async {
    var formData = formStateKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      final response = await logindata.postData(
          emailController.text, passwordController.text);
      if (response != null) {
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            if (response["data"]["verified"] == 1) {
              myServices.sharedPreferences
                  .setString('email', response['data']['user_email']);
              myServices.sharedPreferences
                  .setString('username', response['data']['user_name']);
              myServices.sharedPreferences.setString('step', '2');
              Get.offNamed(AppRoutes.home);
            } else {
              Get.defaultDialog(title: 'not confirmed' , middleText: "Your account is not verified. Please verify your account." , onConfirm:  ()=> Get.offNamed(
                AppRoutes
                    .verifyOTPSignup, 
                arguments: {
                  "email": emailController.text
                }, 
              ))  ;
            }
          } else {
            print(" ================ Wrong ==================");
            Get.defaultDialog(title: '46'.tr, middleText: '50'.tr);
            statusRequest = StatusRequest.failure;
          }
        }
      } else {
        print("Signup API response is null or empty.");
        // Handle case where response is null
      }
    } else {
      print("not valid");
    }
    update();
  }

  @override
  signUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  void onInit() {
    super.onInit();
    FirebaseMessaging.instance.getToken().then((value) {
      print("value of token: $value");
    }).catchError((error) {
      print("Error getting token: $error");
    });
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  forgetPassword() {
    Get.offNamed(AppRoutes.forgetPassword);
  }

  String trimString(String input) {
    return input.trim();
  }

  @override
  showPass() {
    show = !show; // Toggle the value of ShowPass
    update();
  }
}
