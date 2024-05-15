
import 'dart:developer';
import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_health_journal/Screens/sign_up/forget_otp_screen.dart';
import 'package:my_health_journal/Screens/sign_up/reset_password.dart';
import 'package:my_health_journal/common-widgets/custom_loader.dart';
import 'package:my_health_journal/main.dart';
import 'package:my_health_journal/models/auth/forget_password_model.dart';
import 'package:my_health_journal/models/auth/login_model.dart';

import 'package:my_health_journal/resources/apis.dart';
import 'package:my_health_journal/resources/local_storage.dart';
import 'package:my_health_journal/resources/utils.dart';
import 'package:my_health_journal/routers/app_routers.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../resources/api_constant.dart';
import 'profile_controller.dart';

class LoginController extends GetxController {

  bool obscureText = true;
  bool forgetobscureText1 = true;
  bool forgetobscureText2 = true;
  
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController forgetemailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController forgetEmailCtrl = TextEditingController();



  TextEditingController forgetPasswordCtrl = TextEditingController();
  TextEditingController forgetConfPasswordCtrl = TextEditingController();

  TextEditingController forgetOtpCtrl = TextEditingController();

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final forgetKey = GlobalKey<FormState>();
  final forgetOTPKey = GlobalKey<FormState>();
  final resetPasswordFormKey = GlobalKey<FormState>();
  
  bool rememberme = true;
  // LoginModel?  logindata;
  

onPassSuffixTap(){
  obscureText = !obscureText;
  update();
}
  

forgetonPassSuffixTap(){
  forgetobscureText1 = !forgetobscureText1;
  update();
}

forgetonPassSuffixTap2(){
  forgetobscureText2 = !forgetobscureText2;
  update();
}


  @override
  void onInit() {
    super.onInit();
    emailCtrl.clear();
    forgetemailCtrl.clear();
    passwordCtrl.clear();
    update();
    // Future.delayed(Duration(seconds: 2), () {
    //
    //     Get.offAllNamed(AppRoutes.onboardingScreen);
    // });
  }


  // Login Api

Future<void> LoginApi() async {  
  // fcmToken = (await FirebaseMessaging.instance.getToken())!;
  log(fcmToken.toString());
  checkInternetConnectivity().then((isConnected) async {    
  if (isConnected) {   
    showLoader(true);
    try {                      
      var map = <String, dynamic>{};
      map['phone'] = emailCtrl.text.trim();
      map['password'] =  passwordCtrl.text.trim();    
      map['device_token'] = fcmToken;
      log(ApiUrls.login);
      log(map.toString());
      var result = await ApiHandler().PostApi(apiName: ApiUrls.login, data: map);     
      if(result != null){      
        LoginModel res =  LoginModel.fromJson(result);
        if(res.status == 200){
            if(rememberme){
        storeBoolValue(LocalStorage.REMERBERME, true);           
      }   
      storeValue(LocalStorage.TOKEN, res.data!.token!);       
      showLoader(false);
      update();
         Future.delayed(Duration(microseconds: 100), (){
            Get.find<ProfileContorller>().GetProfileApi(naviagtion: true);
         });       
          
        }
        else{
        showToastError(res.message!);
      }
      // // logindata = LoginModel.fromJson(result);
      // // update();  
               
      }
      showLoader(false);
         
  } catch (e) {
    log("catch");
    log(e.toString());
    // showToastError(e.toString(), );  
    showLoader(false);
    }
  } else {    
    showToastError('No Internet'.tr);
    showLoader(false);
  }
});
    
}

// Forget Password Api Block
ForgetPasswordModel forgetOpt = ForgetPasswordModel();
 Future<void> forgetPasswordApi() async{
   checkInternetConnectivity().then((isConnected) async {    
    showLoader(true);
  if (isConnected) {   
    try {                      
      var map = <String, dynamic>{};
      map['email'] = forgetEmailCtrl.text.trim();
      log(ApiUrls.forgotPassword);
      log(map.toString());
      var result = await ApiHandler().PostApi(apiName: ApiUrls.forgotPassword, data: map);     
      if(result != null){    
        showLoader(false);  
        forgetOpt =  ForgetPasswordModel.fromJson(result);
        if(forgetOpt.status == 200){            
           showToast(forgetOpt.otp!.toString() );   
            Get.to(const ForgetOTP());
        } 
        else{
          showToastError(forgetOpt.message!);   
        }

      }
      // 
      update();
      
         
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
  // showLoader(false);
    
  }
 Future<void> verifyForgetPasswordApi() async{
      checkInternetConnectivity().then((isConnected) async {    
    showLoader(true);
  if (isConnected) {   
    try {                      
      var map = <String, dynamic>{};
      map['email'] = forgetEmailCtrl.text.trim();
      map['otp'] = forgetOtpCtrl.text.trim();
      log(ApiUrls.forgotPassword);
      log(map.toString());
      var result = await ApiHandler().PostApi(apiName: ApiUrls.forgotPassword, data: map);     
      if(result != null){    
        showLoader(false);  
        forgetOpt =  ForgetPasswordModel.fromJson(result);
        if(forgetOpt.status == 200){            
           showToast(forgetOpt.message! );   
            Get.to(const ResetPassword());
        } 
        else{
          showToastError(forgetOpt.message!);   
        }
      }
      update();               
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


     Future<void> resetPasswordApi() async{
      checkInternetConnectivity().then((isConnected) async {    
    showLoader(true);
    if (isConnected) {   
    try {                      
      var map = <String, dynamic>{};
      map['email'] = forgetEmailCtrl.text.trim();
      map['password'] = forgetPasswordCtrl.text.trim();
      map['confirm_password'] =  forgetConfPasswordCtrl.text.trim();
      log(ApiUrls.resetPassword);
      log(map.toString());
      var result = await ApiHandler().PostApi(apiName: ApiUrls.resetPassword, data: map);     
      if(result != null){    
        showLoader(false);  
        // var res =  ForgetPasswordModel.fromJson(result);
        if(result["status"] == 200){            
           showToast(result["message"]);   
             
        } 
        else{
          showToastError(result["message"]);   
        }
      }
      update();               
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

// Social Login

// 
Future<void> SocialLoginApi({required String social_id, required String login_type, String? email, String? name}) async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
    showLoader(true);
    try {                      
      var map = <String, dynamic>{};
      map['social_id'] = social_id;
      map['login_type'] = login_type;
      map['email'] = email ?? '';
      map['login_type'] = 1;
      map['device_token'] = fcmToken;
      // map['phone'] = name ?? "";
      log(ApiUrls.login);
      log(map.toString());
      var result = await ApiHandler().PostApi(apiName: ApiUrls.login, data: map);     
      if(result != null){
      LoginModel res =  LoginModel.fromJson(result);
      update();    
      if(res.status == 200)     {
      storeBoolValue(LocalStorage.REMERBERME, true);  
      storeValue(LocalStorage.TOKEN, res.data!.token!.toString());  
      showLoader(false);
      update();
         Future.delayed(Duration(microseconds: 100), (){
            Get.find<ProfileContorller>().GetProfileApi(naviagtion: true);
         });       
      }
      else{
        showToastError(res.message!);
      }
        // }

      // Get.offAllNamed(AppRoutes.splashScreen);
      }
       
         
  } catch (e) {
    log("catch");
    log(e.toString());
    showToastError(e.toString(), );  
    showLoader(false);
    update();
    }
  } else {    
    showToastError('No Internet'.tr);
    showLoader(false);
    update();
  }
});
showLoader(false);
update();

}
// static final GoogleSignIn _googleSignIn = GoogleSignIn();
// static final FirebaseAuth _auth = FirebaseAuth.instance;
// Future<User?> signInWithGoogle() async {
//     try {
//       showLoader(true);
//       final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );
//         final UserCredential authResult = await _auth.signInWithCredential(credential);
//         final User? user = authResult.user;
//         showLoader(false);
//         log(authResult.user!.uid);
//         return user;
//       }
//       else{
//          showLoader(false);
//       }
//     } catch (e) {
//       showLoader(false);
//       showToast("Google Sign-In Error: $e"); 
//     }
//     showLoader(false);
//     return null;
//   }


  // loginWithApple() async {
  //   try {
  //     final credential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );
  //     if (credential.userIdentifier != null) {
  //       log("printing userIdentifier ${credential.userIdentifier}");
  //       print("AppleCredientials=> " + credential.toString());
  //       print("AppleCredientials authorizationCode=> " + credential.authorizationCode.toString());
  //       print("AppleCredientials email=> " + credential.email.toString());
  //       print("AppleCredientials givenName=> " + credential.givenName.toString());
  //       print("AppleCredientials familyName=> " + credential.familyName.toString());
  //       print("AppleCredientials identityToken=> " + credential.identityToken.toString());
  //       print("AppleCredientials userIdentifier=> " + credential.userIdentifier.toString());
  //        SocialLoginApi(
  //                                     login_type: 'apple', 
  //                                     social_id: credential.userIdentifier.toString(),
  //                                     email: credential.email.toString(),
  //                                     name: credential.givenName.toString(),
  //                                     );  
                                              
  //     }
  //   } catch (error) {
  //     // showToastError(error.toString());
  //     log('catch');
  //     print(error.toString());
  //     // Helpers.createSnackBar(context, error.toString());
  //   }
  // }



 
}
