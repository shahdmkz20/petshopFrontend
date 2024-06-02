
import '../../../../api_links.dart';
import '../../../../core/class/crud.dart';

class VerifyCodeForgetPass {
  CRUD crud;

  VerifyCodeForgetPass(this.crud);

  postData(
    String email,
    String verifyCode,
  ) async {
    try {
      var response = await crud.postData(AppLink.verifyCodeForgetPass,
          {"email": email, "verifycode": verifyCode});
      return response.fold((l) => l, (r) => r);
    } catch (e) {
      print('Error in SignUpData.postData: $e'); // Print error
    }
  }
}
