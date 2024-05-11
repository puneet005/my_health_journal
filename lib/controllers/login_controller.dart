
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_health_journal/common-widgets/custom_loader.dart';
import 'package:my_health_journal/main.dart';
import 'package:my_health_journal/models/login_model.dart';
import 'package:my_health_journal/resources/apis.dart';
import 'package:my_health_journal/resources/local_storage.dart';
import 'package:my_health_journal/resources/utils.dart';
import 'package:my_health_journal/routers/app_routers.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../resources/api_constant.dart';
import 'profile_controller.dart';

class LoginController extends GetxController {

  bool obscureText = true;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController forgetemailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController emaiCtrl = TextEditingController();

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
  fcmToken = (await FirebaseMessaging.instance.getToken())!;
  log(fcmToken.toString());
  checkInternetConnectivity().then((isConnected) async {    
  if (isConnected) {   
    showLoader(true);
    try {                      
      var map = <String, dynamic>{};
      map['phone'] = emailCtrl.text.trim();
      map['password'] =  passwordCtrl.text.trim();    
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
      map['phone'] = name ?? "";
      log(ApiUrls.login);
      log(map.toString());
      var result = await ApiHandler().PostApi(apiName: ApiUrls.login, data: map);     
      if(result != null){
      LoginModel res =  LoginModel.fromJson(result);
      update();         
      storeBoolValue(LocalStorage.REMERBERME, true);  
      storeValue(LocalStorage.TOKEN, res.data!.token!.toString());  
      showLoader(false);
      update();
         Future.delayed(Duration(microseconds: 100), (){
            Get.find<ProfileContorller>().GetProfileApi(naviagtion: true);
         });       

        // }

      // Get.offAllNamed(AppRoutes.splashScreen);
      }
      //  showLoader(false);
         
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
static final GoogleSignIn _googleSignIn = GoogleSignIn();
static final FirebaseAuth _auth = FirebaseAuth.instance;
Future<User?> signInWithGoogle() async {
    try {
      showLoader(true);
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential authResult = await _auth.signInWithCredential(credential);
        final User? user = authResult.user;
        showLoader(false);
        log(authResult.user!.uid);
        return user;
      }
      else{
         showLoader(false);
      }
    } catch (e) {
      showLoader(false);
      showToast("Google Sign-In Error: $e"); 
    }
    return null;
  }


  loginWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      if (credential.userIdentifier != null) {
        log("printing userIdentifier ${credential.userIdentifier}");
        print("AppleCredientials=> " + credential.toString());
        print("AppleCredientials authorizationCode=> " + credential.authorizationCode.toString());
        print("AppleCredientials email=> " + credential.email.toString());
        print("AppleCredientials givenName=> " + credential.givenName.toString());
        print("AppleCredientials familyName=> " + credential.familyName.toString());
        print("AppleCredientials identityToken=> " + credential.identityToken.toString());
        print("AppleCredientials userIdentifier=> " + credential.userIdentifier.toString());
         SocialLoginApi(
                                      login_type: 'apple', 
                                      social_id: credential.userIdentifier.toString(),
                                      email: credential.email.toString(),
                                      name: credential.givenName.toString(),
                                      );  
                                              
      }
    } catch (error) {
      // showToastError(error.toString());
      log('catch');
      print(error.toString());
      // Helpers.createSnackBar(context, error.toString());
    }
  }
}
