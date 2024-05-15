
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_health_journal/common-widgets/custom_loader.dart';
import 'package:my_health_journal/controllers/profile_controller.dart';
import 'package:my_health_journal/main.dart';
import 'package:my_health_journal/models/auth/sign_up_model.dart';
// import 'package:my_health_journal/models/sign_up_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/local_storage.dart';
import 'package:my_health_journal/resources/utils.dart';
import 'package:my_health_journal/routers/app_routers.dart';

import '../resources/apis.dart';

class SignUpController extends GetxController {
  bool obscureText = true; 
  bool obscureText2 = true; 
  final signinKey = GlobalKey<FormState>();
  TextEditingController fNameCtrl = TextEditingController();
  // TextEditingController lNameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passwordConfCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String countryCode = "1";
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
    fNameCtrl.clear();
    phoneCtrl.clear();
    emailCtrl.clear();
    passwordConfCtrl.clear();
    passwordCtrl.clear();
    update();

    // Future.delayed(Duration(seconds: 2), () {
    //
    //     Get.offAllNamed(AppRoutes.onboardingScreen);
    // });
  }


 


Future<bool> signUpApi() async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
    showLoader(true);
    try {                      
      var map = <String, dynamic>{};   
      map['name'] = fNameCtrl.text.trim();    
      map['email'] = emailCtrl.text.trim();        
      map['phone'] = phoneCtrl.text.trim();
      map['password'] = passwordConfCtrl.text.trim();
      map['device_token'] = fcmToken;     
      log(ApiUrls.register);
      log(map.toString());
      var result =  await ApiHandler().PostApi(apiName: ApiUrls.register, data: map,);   
      if(result != null){
        SignUpModel res = SignUpModel.fromJson(result);
        log(result.toString());   
       
        storeValue(LocalStorage.TOKEN, res.data!.token!);
        storeBoolValue(LocalStorage.REMERBERME, true);
        update();
         showLoader(false);
         Future.delayed(Duration(microseconds: 100), (){
            Get.find<ProfileContorller>().GetProfileApi(naviagtion: true);
         });                  
        return true;
              
      }
      else{
        showLoader(false);
          return false;
      }
      //          
  } catch (e) {
    showLoader(false);
    log("catch");
    log(e.toString());
    showToastError(e.toString(), );  
    showLoader(false);
     return false;
    }
  } else {        
    showToastError('No Internet'.tr);
    showLoader(false);
    return false;
  }
});
   return true;  
}

// Logout Api

 void signOutApi() async {
    var result = await ApiHandler().GetApi(apiName: "${ApiUrls.logout}");     
    // await GoogleSignIn().signOut();
    // await FacebookAuth.instance.logOut();     
    // await FirebaseAuth.instance.signOut();
    removeValue(LocalStorage.TOKEN);
    removeValue(LocalStorage.REMERBERME);
    // removeValue(LocalStorage.FIRSTTIME);

    Get.offAllNamed(AppRoutes.loginScreen);
    // print("User signed out from Google.");
  }

}