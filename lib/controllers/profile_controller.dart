import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_health_journal/common-widgets/custom_loader.dart';
import 'package:my_health_journal/models/profile_model.dart';
import 'package:my_health_journal/resources/apis.dart';
import 'package:my_health_journal/resources/utils.dart';
import 'package:my_health_journal/routers/app_routers.dart';

import '../resources/api_constant.dart';

class ProfileContorller extends GetxController {

  bool notification = false;
  ProfileModel profileData = ProfileModel();
  String? initialCountry;
  String? countryDialCode; 


  Future<bool> GetProfileApi({bool naviagtion = false}) async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
    // showLoader(true);
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

}