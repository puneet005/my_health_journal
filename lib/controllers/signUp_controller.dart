
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/common-widgets/custom_loader.dart';

class SignUpController extends GetxController {
  bool obscureText = true; 
  bool obscureText2 = true; 
  final signinKey = GlobalKey<FormState>();
  TextEditingController fNameCtrl = TextEditingController();
  TextEditingController lNameCtrl = TextEditingController();
  TextEditingController companyCtrl = TextEditingController();
  TextEditingController passwordConfCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  onPassSuffixTap(){
    obscureText = !obscureText;
    update();
  }

    onPassSuffixTap2(){
    obscureText2 = !obscureText2;
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
