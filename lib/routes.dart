
import 'package:get/get.dart';
import 'package:petshop/core/constants/approutes.dart';
import 'package:petshop/view/screen/auth/signup/verifyotp.dart';
import 'package:petshop/view/screen/home/items.dart';
import 'package:petshop/view/screen/order/myorders.dart';
import 'package:petshop/view/screen/order/orderplaced.dart';
import 'package:petshop/view/screen/product/productdetails.dart';

import 'core/middleware/middleware.dart';
import 'view/screen/auth/forgetpassword/checkemail.dart';
import 'view/screen/auth/forgetpassword/resetpassword.dart';
import 'view/screen/auth/forgetpassword/verifycode.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup/emailconfirmed.dart';
import 'view/screen/auth/signup/signup.dart';
import 'view/screen/cart/cart.dart';
import 'view/screen/home/homescreen.dart';
import 'view/screen/language.dart';
import 'view/screen/onboarding.dart';
import 'view/screen/order/orderaddress.dart';


List<GetPage<dynamic>>? routes = [
  //auth
  //start page
  GetPage(
 name: "/", page: () => const OnBoarding(), middlewares: [MyMiddleWare()]),
 //GetPage(name: "/", page: () => const Cart()) ,
  //sign up
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.verifyOTPSignup, page: () => const VerifyOTP()),
  GetPage(name: AppRoutes.emailConfirmed, page: () => const EmailConfirmed()),

  //forget password
  GetPage(name: AppRoutes.forgetPassword, page: () => const CheckEmail()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),

  //login
  GetPage(name: AppRoutes.login, page: () => const LogIn()),


  //home
  GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.items, page: () => const Items()),
  GetPage(name: AppRoutes.productdetails, page: () => const ProductDetails()),


//cart 
 GetPage(name: AppRoutes.cart, page: () => const Cart()),

 //checkout
GetPage(name: AppRoutes.orderplaced, page: () => const OrderPlaced()),
GetPage(name: AppRoutes.orderAddress, page: () => const OrderAddress()),
GetPage(name: AppRoutes.myOrders, page: () => const MyOrders()),

  //language
  GetPage(name: AppRoutes.changeLanguage, page: () => const Language()),
];

