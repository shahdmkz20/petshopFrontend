import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'bindings/init_binding.dart';
import 'core/localizations/changelocal.dart';
import 'core/localizations/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocalLangController controller = Get.put(LocalLangController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.lang,
      theme: controller.appTheme,
      getPages: routes,
      initialBinding: InitBindings(),
    );
  }
}
