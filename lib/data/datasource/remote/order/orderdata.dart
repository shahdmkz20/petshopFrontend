import '../../../../api_links.dart';
import '../../../../core/class/crud.dart';

class OrderData {
  CRUD crud;

  OrderData(this.crud);

  postData(
    String email,
  ) async {
    try {
      var response = await crud.postData(AppLink.orders, {
        "email": email,
      });
      return response.fold((l) => l, (r) => r);
    } catch (e) {
      return (e);
    }
  }
}
