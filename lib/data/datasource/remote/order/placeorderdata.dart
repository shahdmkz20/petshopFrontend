import '../../../../api_links.dart';
import '../../../../core/class/crud.dart';

class PlaceOrderData {
  CRUD crud;

  PlaceOrderData(this.crud);

  postData(String email, String address, String price,
     ) async {
    try {
      var response = await crud.postData(AppLink.placeOrder, {
        "email": email,
        "address": address,
        "price": price,
      });
      return response.fold((l) => l, (r) => r);
    } catch (e) {
      return (e);
    }
  }
}
