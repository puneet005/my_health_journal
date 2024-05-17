import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/controllers/profile_controller.dart';
import 'package:my_health_journal/resources/local_storage.dart';
import 'package:my_health_journal/resources/utils.dart';
import 'package:my_health_journal/routers/app_routers.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends GetxController {
  // final controller =  Get.find<languageController>();

  @override
  void onInit() {
    super.onInit();
     if(Platform.isAndroid){
     _requestNotificationPermission();
    }
    Future.delayed(Duration.zero,() async { 
      bool remMe = getBoolValue(LocalStorage.REMERBERME);
      String token = getValue(LocalStorage.TOKEN);   
        
      if(token != "" && remMe == true){
        print(token);   
      //  debugPrint(token);
        final profile = Get.put(ProfileContorller());
        
        await profile.GetProfileApi(naviagtion: true);
      }
      else{
      log('else');  
     }
             
    });   
      
  }

  Future<void> _requestNotificationPermission() async {
    var status = await Permission.notification.request();
    if (status.isGranted) {
      // Permission is granted, handle notifications here
    } else if (status.isDenied) {
      // Permission is denied, show a message or request again
    } else if (status.isPermanentlyDenied) {
      // Permission is permanently denied, take the user to app settings
      openAppSettings();
    }
  } 
}