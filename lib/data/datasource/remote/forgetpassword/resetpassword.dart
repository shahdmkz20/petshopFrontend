
import '../../../../api_links.dart';
import '../../../../core/class/crud.dart';
class ResetPasswordData {
  CRUD crud;

  ResetPasswordData(this.crud);

  postData(
    String email,
    String password,
  ) async {
    try {
      var response = await crud.postData(
          AppLink.resetPassword, {"email": email, "password": password});
      return response.fold((l) => l, (r) => r);
    } catch (e) {
      print('Error in SignUpData.postData: $e'); // Print error
    }
  }
}
