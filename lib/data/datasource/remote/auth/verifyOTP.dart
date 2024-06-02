
import '../../../../api_links.dart';
import '../../../../core/class/crud.dart';

class verifyOTPData {
  CRUD crud;

  verifyOTPData(this.crud);

  postData(
    String email,
    String verifyCode,
  ) async {
    try {
      var response = await crud.postData(
          AppLink.verifyOtpSignUp, {"email": email, "verifycode": verifyCode});
      return response.fold((l) => l, (r) => r);
    } catch (e) {
      print('Error in SignUpData.postData: $e'); // Print error
    }
  }

  resendCode(
    String email,
  ) async {
    try {
      var response = await crud.postData(
          AppLink.resendCode, {"email": email});
      return response.fold((l) => l, (r) => r);
    } catch (e) {
      print('Error in SignUpData.postData: $e'); // Print error
    }
  }
}
