

import '../../../../api_links.dart';
import '../../../../core/class/crud.dart';
class LoginData {
  CRUD crud;

  LoginData(this.crud);

  postData(String email, String password) async {
    try {
      var response = await crud
          .postData(AppLink.login, {"email": email, "password": password});
      return response.fold((l) => l, (r) => r);
    } catch (e) {
      print('Error in SignUpData.postData: $e'); // Print error
    }
  }
}
