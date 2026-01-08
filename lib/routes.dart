import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/middleware/mymiddleware.dart';
import 'package:ecommerceapp/test.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerceapp/view/screen/auth/login.dart';
import 'package:ecommerceapp/view/screen/auth/signup.dart';
import 'package:ecommerceapp/view/screen/auth/success_signup.dart';
import 'package:ecommerceapp/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerceapp/view/screen/homescreen.dart';
import 'package:ecommerceapp/view/screen/itesms.dart';
import 'package:ecommerceapp/view/screen/language.dart';
import 'package:ecommerceapp/view/screen/onboarding.dart';
import 'package:ecommerceapp/view/screen/productdetails.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [Mymiddleware()],
  ),
  //GetPage(name: "/", page: () => const TestView()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.test, page: () => const Test()),
  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
    name: AppRoute.successResetPassword,
    page: () => const SuccessResetpassword(),
  ),
  GetPage(
    name: AppRoute.verifyCodeSignUp,
    page: () => const VerifyCodeSignUp(),
  ),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
];
