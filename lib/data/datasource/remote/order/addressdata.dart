import '../../../../api_links.dart';
import '../../../../core/class/crud.dart';

class AddressData {
  CRUD crud;

  AddressData(this.crud);

  postData(String email, String city, String street,
      String phone , String description) async {
    try {
      var response = await crud.postData(AppLink.address, {
        "email": email,
        "city": city,
        "street": street,
        "phone": phone,
        "description" :description
      });
      return response.fold((l) => l, (r) => r);
    } catch (e) {
      return (e);
    }
  }
}
