import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../constants/apptheme.dart';
import '../services/services.dart';

class LocalLangController extends GetxController {
  Locale? lang;

  MyServices myServices = Get.find();

  ThemeData appTheme = EnglishTheme;
  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar" ? ArabicTheme : EnglishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      lang = const Locale('ar');
      appTheme = ArabicTheme;
    } else if (sharedPrefLang == "en") {
      lang = const Locale("en");
      appTheme = EnglishTheme;
    } else {
      lang = Locale(Get.deviceLocale!.languageCode);
      appTheme = EnglishTheme;
    }
    super.onInit();
  }
}
