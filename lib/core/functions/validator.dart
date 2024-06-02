import 'package:get/get.dart';

validInp(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "33".tr;
    }
  }
 if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "79".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "34".tr;
    }
  }
   
  if (type == "password") {
    if (val.length < min) {
      return "43".tr + min.toString() + "42".tr;
    }
    if (val.length > max) {
      return {"41".tr + max.toString() + "42".tr};
    }

    // Check if the password contains at least one letter and one digit
    if (!val.contains(RegExp(r'[a-zA-Z]')) || !val.contains(RegExp(r'[0-9]'))) {
      return "40".tr;
    }
  }

  if (val.length < min) {
    return {"37".tr + min.toString()};
  }

  if (val.length > max) {
    return {"38".tr + max.toString()};
  }

  if (val.isEmpty) {
    return "39".tr;
  }
}
