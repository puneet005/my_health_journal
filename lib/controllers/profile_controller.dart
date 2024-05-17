import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
        update();          
        Get.back();
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

  void deleteUserAccountApi() {
    checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
    showLoader(true);
    try {                                
      log(ApiUrls.profile);    
      var result = await ApiHandler().GetApi(apiName: ApiUrls.deleteAccount); 
      // log(result.toString());
      // profileData = ProfileModel.fromJson(result);         
      if(result != null){       
      showLoader(false);         
      update();   
      // if(naviagtion)
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
  //  return true;
    
  }
}