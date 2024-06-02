
import '../../../../api_links.dart';
import '../../../../core/class/crud.dart';

class CheckEmailData {
  CRUD crud;

  CheckEmailData(this.crud);

  postData(
    String email,
  ) async {
    try {
      var response = await crud.postData(AppLink.confirmEmail, {
        "email": email,
      });
      return response.fold((l) => l, (r) => r);
    } catch (e) {
      print('Error in SignUpData.postData: $e'); // Print error
    }
  }
}
