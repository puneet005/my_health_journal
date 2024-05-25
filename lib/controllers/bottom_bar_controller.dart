import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/Calendar/calendar.dart';
import 'package:my_health_journal/Screens/home/provider/add_provider.dart';
import 'package:my_health_journal/Screens/home/patient_view.dart';
import 'package:my_health_journal/Screens/other/medical_summary.dart';
import 'package:my_health_journal/Screens/other/notification.dart';
import 'package:my_health_journal/Screens/profile/setting.dart';
import 'package:my_health_journal/common-widgets/custom_loader.dart';
import 'package:my_health_journal/models/home/provider_view_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/apis.dart';
import 'package:my_health_journal/resources/utils.dart';

import '../models/patient_list_model.dart';

class BottomBarController extends GetxController {
//  final GlobalKey<ScaffoldState> key = GlobalKey();
// for app drawer
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    // const  Discover(),
    const PatientView(),
    const Setting(),
    const CalendarScreen(),
    const NotificationScreen(),
    // const AddProvider(),
    const MedicalSummary(),
    //  const AddProvider(),
  ];

  void onItemTapped(int index) {
    // if(index == 4){
    //   key.currentState!.openEndDrawer();
    // }
    // else{
    selectedIndex = index;
    update();
    // }
  }

  setValue(int i) {
    selectedIndex = i;
    update();
  }

// @override
// void onInit() {
//   // TODO: implement onInit
//   super.onInit();
//   log('In bottombar controller');
//   log('In bottombar controllerEnd');
// }

List<PatientListMember>? patientList = [];
PatientListMember selectedPatient = PatientListMember();
Future<bool> patientListApi() async {
  checkInternetConnectivity().then((isConnected) async {
if (isConnected) {
    try {
      log(ApiUrls.dashboard);
      var result = await ApiHandler().GetApi(apiName: ApiUrls.dashboard);
      PatientList res = PatientList.fromJson(result);
      if(res != null){
        patientList = res.member;
      }
      showLoader(false);
      update();
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


// getProviderListApi(){

// }
// Provider View List Data Variable and Api
List<ProviderViewModelData> providerListData = [];
bool getProviderListLoading = false;
Future getProviderListApi() async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
getProviderListLoading = true;
update();
    try {                                
      log(ApiUrls.getProvider);    
      var result = await ApiHandler().GetApi(apiName: ApiUrls.getProvider);
      ProviderViewModel res =  ProviderViewModel.fromJson(result);
      if(res.status == 200){
        providerListData =  res.data ?? [];
        getProviderListLoading = false;

        update();
      }              
  } catch (e) {
    log("catch");
    log(e.toString());
      getProviderListLoading = false;

        update();
    showToastError(e.toString(), );  
    // showLoader(false);
  
    }
  } else {  
      getProviderListLoading = false;
        update();  
    showToastError('No Internet'.tr);
    // showLoader(false);
   
  }
});

}
}
