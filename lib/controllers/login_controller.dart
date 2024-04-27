
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  bool obscureText = true;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController forgetemailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  final forgetKey = GlobalKey<FormState>();
  bool rememberme = true;
  // LoginModel?  logindata;
  

onPassSuffixTap(){
  obscureText = !obscureText;
  update();
}
  

  @override
  void onInit() {
    super.onInit();

    // Future.delayed(Duration(seconds: 2), () {
    //
    //     Get.offAllNamed(AppRoutes.onboardingScreen);
    // });
  }

}
