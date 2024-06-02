

import '../../../../api_links.dart';
import '../../../../core/class/crud.dart';

class SignUpData {
  CRUD crud;

  SignUpData(this.crud);

  postData(String username, String password, String email) async {
    try {
      var response = await crud.postData(AppLink.signUp, {
        "username": username,
        "password": password,
        "email": email,
      });
      return response.fold((l) => l, (r) => r);
    } catch (e) {
      print('Error in SignUpData.postData: $e'); // Print error
    }
  }
}
