import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/test.dart';
import 'package:ecommerceapp/view/screen/auth/checkemail.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerceapp/view/screen/auth/login.dart';
import 'package:ecommerceapp/view/screen/auth/signup.dart';
import 'package:ecommerceapp/view/screen/auth/success_signup.dart';
import 'package:ecommerceapp/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerceapp/view/screen/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = ({
  AppRoute.login: (context) => const Login(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.test: (context) => const Test(),
  AppRoute.onboarding: (context) => const OnBoarding(),
  AppRoute.forgetPassword: (context) => const ForgetPassword(),
  AppRoute.verifyCode: (context) => const VerifyCode(),
  AppRoute.resetPassword: (context) => const ResetPassword(),
  AppRoute.successResetPassword: (context) => const SuccessResetpassword(),
  AppRoute.checkEmail: (context) => const CheckEmail(),
  AppRoute.verifyCodeSignUp: (context) => const VerifyCodeSignUp(),
  AppRoute.successSignUp: (context) => const SuccessSignUp(),
});
