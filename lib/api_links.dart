// api_links.dart
class AppLink {
  static const String server = 'https://petshop1542025.com/petshop';
  static const String test = "$server/test.php";

  //    =================images==================   //
  static const String imagesUrl = "$server/upload";
  static const String imageCategories = "$imagesUrl/categories";
  static const String imageItems = "$imagesUrl/items";
  // ================================================== //

  //    =================auth==================   //
  static const String signUp = "$server/auth/signup.php";
  static const String verifyOtpSignUp = "$server/auth/verifyCode.php";
  static const String login = "$server/auth/login.php";
  static const String resendCode = "$server/auth/resendcode.php";
// ================================================== //

//    =================forgetpassword==================   //
  static const String forgetPassword = "$server/forgetpassword";
  static const String confirmEmail = "$forgetPassword/checkemail.php";
  static const String verifyCodeForgetPass = "$forgetPassword/verifycode.php";
  static const String resetPassword = "$forgetPassword/resetpassword.php";

//    =================home==================   //
  static const String home = "$server/home.php";
  static const String search = "$server/home/search.php";

//    =================items==================   //
  static const String items = "$server/items/items.php";

//    =================cart==================   //
  static const String addToCart = "$server/cart/add.php";
  static const String deleteFromCart = "$server/cart/delete.php";
  static const String viewCart = "$server/cart/view.php";
  static const String getItemCount= "$server/cart/getitemcount.php";
  static const String address= "$server/address/add.php";
  static const String placeOrder= "$server/placeorder/add.php";
  static const String orders= "$server/placeorder/view.php";
  
}
