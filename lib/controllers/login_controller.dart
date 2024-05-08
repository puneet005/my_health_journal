
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/common-widgets/custom_loader.dart';
import 'package:my_health_journal/resources/apis.dart';
import 'package:my_health_journal/resources/local_storage.dart';
import 'package:my_health_journal/resources/utils.dart';
import 'package:my_health_journal/routers/app_routers.dart';

import '../resources/api_constant.dart';

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


  // Login Api

Future<void> LoginApi() async {  
  // fcmToken = (await FirebaseMessaging.instance.getToken())!;
  // log(fcmToken.toString());
  checkInternetConnectivity().then((isConnected) async {
    
  if (isConnected) {
   
    showLoader(true);
    try {                      
      var map = <String, dynamic>{};
      map['email'] = 
      // phoneNoCtrl.text.trim();
      map['password'] =    passwordCtrl.text.trim();
      // map['fcm_token'] = fcmToken;
      log(ApiUrls.login);
      log(map.toString());

      var result = await ApiHandler().PostApi(apiName: ApiUrls.login, data: map);     
      if(result != null){
      // logindata = LoginModel.fromJson(result);
      update();  
       if(rememberme){
        storeBoolValue(LocalStorage.REMERBERME, true);           
      }   
      storeValue(LocalStorage.TOKEN, "");
     
      // Get.offAllNamed(AppRoutes.splashScreen);  
    
      }
      showLoader(false);
         
  } catch (e) {
    log("catch");
    log(e.toString());
    showToastError(e.toString(), );  
    showLoader(false);
    }
  } else {    
    showToastError('No Internet'.tr);
    showLoader(false);
  }
});
    
}


}
