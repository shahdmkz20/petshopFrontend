import 'package:get/get.dart';

confirmPassword(String pass, String repeatPass) {
  if (pass != repeatPass) {
    return "44".tr;
  }
}
