import 'package:get/get.dart';
import 'package:petshop/core/class/crud.dart';


class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CRUD());
  }
}
