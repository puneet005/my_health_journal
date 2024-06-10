import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:my_health_journal/common-widgets/custom_loader.dart';

import 'package:my_health_journal/resources/apis.dart';
import 'package:my_health_journal/resources/local_storage.dart';
import 'package:my_health_journal/resources/utils.dart';
import 'package:my_health_journal/routers/app_routers.dart';

import '../models/auth/profile_model.dart';
import '../resources/api_constant.dart';

class ProfileContorller extends GetxController {
  bool notification = false;
  ProfileModel profileData = ProfileModel();
  String? initialCountry;
  String? countryDialCode; 
  late File image;
  final _picker = ImagePicker();
   late String userImgPath = "";
  TextEditingController fNameCtrl = TextEditingController();
  final editProfileKey =  GlobalKey<FormState>();

  Future<bool> GetProfileApi({bool naviagtion = false}) async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {

    try {                                
      log(ApiUrls.profile);    
      var result = await ApiHandler().GetApi(apiName: ApiUrls.profile); 
      // log(result.toString());
      profileData = ProfileModel.fromJson(result);         
      if(result != null){  
      // initialCountry = profileData.data!.countryName ?? "US";
      // countryDialCode = profileData.data!.countryCode ?? "1";     
      notification =  profileData.data!.notification == "1"  ? true : false; 
      showLoader(false);         
      update();   
      if(naviagtion)
      Get.offAllNamed(AppRoutes.bottomNav);  
      return true;
      }
      else{
        showToastError(profileData.message.toString());
        return false;
      }
      
  } catch (e) {
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


Future<XFile?> getImage() async {
    final pickedFile = 
    // camerabool
    //     ? await _picker.pickImage(source: ImageSource.camera):
    await _picker.pickImage(source: ImageSource.gallery,imageQuality: 50);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      return pickedFile;
      // idImgName = pickedFile.name;
      // print(idmagePath);
      // log(pickedFile.name);
      // update();      
    } else {
       print('No image selected.');
      return null;
     
    }
  }

Future<XFile?> getImageToCamera() async {
    final pickedFile = 
    // camerabool
    //     ? await _picker.pickImage(source: ImageSource.camera):
    await _picker.pickImage(source: ImageSource.camera,imageQuality: 50);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      return pickedFile;         
    } else {
       print('No image selected.');
      return null;
     
    }
  }

Future<void> editProfileApi() async{
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
    showLoader(true);
    // try {                      
      var map = <String, dynamic>{};
      var filesmap= <String, dynamic>{};
      map['name'] = fNameCtrl.text.trim();
      map['email'] = profileData.data!.email;
      if(userImgPath != ""){
        filesmap['profile'] = userImgPath;
      }
      // if(idmagePath != ""){
      //   filesmap['proof_id'] = idmagePath;
      // }
      // if(profileimagePath != ""){
      //   filesmap['profile'] = profileimagePath; 
      // }
      log(ApiUrls.profileUpdate);
      log(map.toString());
      var result =  await ApiHandler().PostMultipartApi(apiName: ApiUrls.profileUpdate, data: map, files: filesmap);   
      if(result != null){
        if(result['status'] ==  "200"){ 
        // log(result.toString());
        showToast(profileData.message.toString());
        profileData = ProfileModel.fromJson(result);  
        GetProfileApi(naviagtion: false).then((value) {
 Get.back();
        });
        // update();
       
        }
        showLoader(false);
        update();
      }
      showLoader(false);
  // } catch (e) {
  //   log("catch");
  //   log(e.toString());
  //   showToastError(e.toString(), );  
  //   showLoader(false);
  //   }
  } else {    
    
    showToastError('No Internet'.tr);
    showLoader(false);
  }
});
  }
// Get Notification Status Api
Future<bool> SetNotificationApi({required bool notification}) async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
showLoader(true);
    try {                                
      log(ApiUrls.notificationSet);    
      var result = await ApiHandler().PostApi(apiName: ApiUrls.notificationSet, data: {
        'notification': notification ? "1": "2"
      }, ); 
      profileData = ProfileModel.fromJson(result); 

      if(result != null){       
      showLoader(false);         
      update();        
      return true;
      }
      else{
        showLoader(false);
        showToastError(profileData.message.toString());
        return false;
      }
      
  } catch (e) {
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

void deleteUserAccountApi() {
    checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
    showLoader(true);
    try {                                
      log(ApiUrls.profile);    
      var result = await ApiHandler().GetApi(apiName: ApiUrls.deleteAccount);         
      if(result != null){       
      showLoader(false);         
      update();         
       showToast(result['message']);   
      removeValue(LocalStorage.TOKEN);
      removeValue(LocalStorage.REMERBERME);
      Get.offAllNamed(AppRoutes.loginScreen);  
      return true;
      }
      else{
        showToastError(result['message']);
        return false;
      }      
  } catch (e) {
    log("catch");
    log(e.toString());
    showToastError(e.toString(),);  
    showLoader(false);
    return false;
    }
  } else {    
    showToastError('No Internet'.tr);
    showLoader(false);
    return false;
  }
});    
}





// Change Password
  final changePasswordFormKey = GlobalKey<FormState>();
   TextEditingController currentPasswordCtrl = TextEditingController();
  TextEditingController forgetPasswordCtrl = TextEditingController();
  TextEditingController forgetConfPasswordCtrl = TextEditingController();
  bool currentobscureText1 = true;
  bool forgetobscureText1 = true;
  bool forgetobscureText2 = true;

  currentOnPassSuffixTap(){
  currentobscureText1 = !currentobscureText1;
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


// Api Calling
Future<void> changePasswordApi() async{
      checkInternetConnectivity().then((isConnected) async {    
    showLoader(true);
    if (isConnected) {   
    try {                      
      var map = <String, dynamic>{};
      map['current_password'] = currentPasswordCtrl.text.trim();      
      map['new_password'] =  forgetConfPasswordCtrl.text.trim();
      log(ApiUrls.changePassword);
      log(map.toString());
      var result = await ApiHandler().PostApi(apiName: ApiUrls.changePassword, data: map);     
      if(result != null){    
        showLoader(false);  
        // var res =  ForgetPasswordModel.fromJson(result);
        if(result["status"] == 200){            
           showToast(result["message"]);   
           Get.back();
              // Get.offAllNamed(AppRoutes.loginScreen);
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
  // In App Purchase Code Block
  
   // Private constructor
// InAppP
  StreamSubscription<List<PurchaseDetails>>? subscription;

// Buy Premium Api 
Future<void> BuyPremiumApi({required String orderId,
required String status,
required String transactionDate,
  required String transitionId,
  required String productId,
  required String paymentMethod,
  required String amount,x
  }) async{
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
    showLoader(true);          
      var map = <String, dynamic>{};     
      map['orderId'] = orderId;
      map['status'] = status;
      map['transaction_date'] =  transactionDate;
      map['transition_id'] = transitionId;
      map['product_id'] = productId;
      map['paymentMethod'] =  paymentMethod;
      map['amount'] = amount;
      log(ApiUrls.buyPlan);
      log(map.toString());
      var result =  await ApiHandler().PostApi(apiName: ApiUrls.buyPlan, data: map,);   
      if(result != null){
        if(result['status'] ==  "200"){ 
        // log(result.toString());
        showToast(result['massage']);
         GetProfileApi(naviagtion: false).then((value) {
        Get.back();
      });

//         profileData = ProfileModel.fromJson(result);  
//         GetProfileApi(naviagtion: false).then((value) {
//  Get.back();
//         });
        // update();
       
        }
        showLoader(false);
        update();
      }
      showLoader(false); 
  } else {    
    
    showToastError('No Internet'.tr);
    showLoader(false);
  }
});
  }
// 

}