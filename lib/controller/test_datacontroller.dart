
/*
import '../core/functions/handling_data_controller.dart';

class TestController extends GetxController {
  final CRUD crud = CRUD();
  List<dynamic> data = [];
  StatusRequest statusRequest = StatusRequest.loading;

  Future<void> getData() async {
    final response = await TestData(crud).getData();
    print("================== Controller  $response ================");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        if (response['data'] != null && response['data'].isNotEmpty) {
          data.addAll(response['data'] as List<dynamic>);
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
*/
