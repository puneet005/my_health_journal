import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/Calendar/calendar.dart';
import 'package:my_health_journal/Screens/home/patient_view.dart';
import 'package:my_health_journal/Screens/other/global_search.dart';
import 'package:my_health_journal/Screens/other/notification.dart';
import 'package:my_health_journal/Screens/profile/setting.dart';
import 'package:my_health_journal/common-widgets/custom_loader.dart';
import 'package:my_health_journal/models/home/appointment_list_model.dart';
import 'package:my_health_journal/models/home/get_history_model.dart';
import 'package:my_health_journal/models/home/get_test_scan_model.dart';
import 'package:my_health_journal/models/home/medication_list_model.dart';
import 'package:my_health_journal/models/home/procedures_list_model.dart';
import 'package:my_health_journal/models/home/provider_view_model.dart';
import 'package:my_health_journal/models/home/symphtom_list_model.dart';
import 'package:my_health_journal/models/notification_model.dart';
import 'package:my_health_journal/models/seach_model.dart';
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
    const GlobalSearch(),
    // const MedicalSummary(),
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
    showToastError('No Internet');
    showLoader(false);
    return false;
  }
});
  return true;
}
// Reorder List 
Future setPetientIndex(String memberId, String index) async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
  // showLoader(true);
update();
    try {     
      var map = <String, dynamic>{};
      map['member_id'] = memberId;
      map['order'] = index;     
                            
      log(ApiUrls.setOrder);
      log(map.toString());    
      var result = await ApiHandler().PostApi(apiName: ApiUrls.setOrder,data: map );
      log(result.toString());
      // showLoader(false);
      // AppointmentListModel res =  AppointmentListModel.fromJson(result);
      // if(res.status == 200){
      //   appointmentList =  res.data ?? [];
      //   getappointmentListLoading = false;
      //   update();
      // }              
  } catch (e) {
    log("catch");
    log(e.toString());
      // showLoader(false);

        update();
    showToastError(e.toString(), );  
    // showLoader(false);
  
    }
  } else {  
      // showLoader(false);
        update();  
    showToastError('No Internet');
    // showLoader(false);
   
  }
});

}


// Appointment View List Data Vaibale and Api
List<AppointmentListModelData>? appointmentList = [];
bool getappointmentListLoading = false;
Future getAppointmentListApi() async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
getappointmentListLoading = true;
update();
    try {                                
      log(ApiUrls.getAppointment);    
      var result = await ApiHandler().PostApi(apiName: ApiUrls.getAppointment, data: {
        'member_id': selectedPatient.id!.toString(),
      }, );
      AppointmentListModel res =  AppointmentListModel.fromJson(result);
      if(res.status == 200){
        appointmentList =  res.data ?? [];
        getappointmentListLoading = false;
        update();
      }              
  } catch (e) {
    log("catch");
    log(e.toString());
      getappointmentListLoading = false;

        update();
    showToastError(e.toString(), );  
    // showLoader(false);
  
    }
  } else {  
      getappointmentListLoading = false;
        update();  
    showToastError('No Internet');
    // showLoader(false);
   
  }
});

}

// Symptoms View List Data Vaibale and Api
List<SymphtomListModelData>? symptomsList = [];
bool getSymptomsListLoading = false;
Future getSymptomsListApi() async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
getSymptomsListLoading = true;
update();
    try {                                
      log(ApiUrls.getSymptoms);    
      var result = await ApiHandler().PostApi(apiName: ApiUrls.getSymptoms, data: {
        'member_id': selectedPatient.id!.toString(),
      },) ;
      SymphtomListModel res =  SymphtomListModel.fromJson(result);
      if(res.status == 200){
        symptomsList =  res.data ?? [];
        getSymptomsListLoading = false;
        update();
      }              
  } catch (e) {
    log("catch");
    log(e.toString());
      getSymptomsListLoading = false;

        update();
    showToastError(e.toString(), );  
    // showLoader(false);
  
    }
  } else {  
      getSymptomsListLoading = false;
        update();  
    showToastError('No Internet');
    // showLoader(false);
   
  }
});

}


// Medication View List Data Variable and Api
List<MedicationListModelData>? medicationList = [];
bool medicationListLoading = false;
Future getMedicationListApi() async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
medicationListLoading = true;
update();
    try {                                
      log(ApiUrls.getMedication);    
      var result = await ApiHandler().PostApi(apiName: ApiUrls.getMedication,  data: {
        'member_id': selectedPatient.id!.toString(),
      },);
      MedicationListModel res =  MedicationListModel.fromJson(result);
      if(res.status == 200){
        medicationList =  res.data ?? [];
        medicationListLoading = false;

        update();
      }              
  } catch (e) {
    log("catch");
    log(e.toString());
      medicationListLoading = false;

        update();
    showToastError(e.toString(), );  
    // showLoader(false);
    }
  } else {  
      medicationListLoading = false;
      update();  
      showToastError('No Internet');
    // showLoader(false);   
  }
});

}

// List<AppointmentListModelData>? appointmentList = [];
// bool getappointmentListLoading = false;
// Future getAppointmentListApi() async {  
//   checkInternetConnectivity().then((isConnected) async {
//   if (isConnected) {
// getappointmentListLoading = true;
// update();
//     try {                                
//       log(ApiUrls.getAppointment);    
//       var result = await ApiHandler().GetApi(apiName: ApiUrls.getAppointment);
//       AppointmentListModel res =  AppointmentListModel.fromJson(result);
//       if(res.status == 200){
//         appointmentList =  res.data ?? [];
//         getappointmentListLoading = false;
//         update();
//       }              
//   } catch (e) {
//     log("catch");
//     log(e.toString());
//       getappointmentListLoading = false;

//         update();
//     showToastError(e.toString(), );  
//     // showLoader(false);
  
//     }
//   } else {  
//       getappointmentListLoading = false;
//         update();  
//     showToastError('No Internet');
//     // showLoader(false);
//   }
// });
// }

// Procedures View List Data Vaibale and Api
List<ProceduresListModelData>? proceduresList = [];
bool getProceduresListLoading = false;
Future getProceduresListApi() async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
getProceduresListLoading = true;
update();
    try {                                
      log(ApiUrls.getProcedures);    
      var result = await ApiHandler().PostApi(apiName: ApiUrls.getProcedures,  data: {
        'member_id': selectedPatient.id!.toString(),
      },);
      ProceduresListModel res =  ProceduresListModel.fromJson(result);
      if(res.status == 200){
        proceduresList =  res.data ?? [];
        getProceduresListLoading = false;
        update();
      }              
  } catch (e) {
    log("catch");
    log(e.toString());
      getProceduresListLoading = false;

        update();
    showToastError(e.toString(), );  
    // showLoader(false);
  
    }
  } else {  
      getProceduresListLoading = false;
        update();  
    showToastError('No Internet');
    // showLoader(false);
  }
});
}

// Lab And Scans View List Data Vaibale and Api
List<GetTestScanModelData>? testScanList = [];
bool gettestScanListLoading = false;
Future getTestScanListApi() async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
gettestScanListLoading = true;
update();
    try {                                
      log(ApiUrls.getTestAndScan);    
      var result = await ApiHandler().PostApi(apiName: ApiUrls.getTestAndScan,  data: {
        'member_id': selectedPatient.id!.toString(),
      },);
      GetTestScanModel res =  GetTestScanModel.fromJson(result);
      if(res.status == 200){
        testScanList =  res.data ?? [];
        gettestScanListLoading = false;
        update();
      }              
  } catch (e) {
    log("catch");
    log(e.toString());
      gettestScanListLoading = false;

        update();
    showToastError(e.toString(), );  
    // showLoader(false);
  
    }
  } else {  
      gettestScanListLoading = false;
        update();  
    showToastError('No Internet');
    // showLoader(false);
   
  }
});

}

// Personal OR Family History View List Data Vaibale and Api
List<GetHistoryModelData>? personalHistoryList = [];
List<GetHistoryModelData>? familyHistoryList = [];
bool getHistoryListLoading = false;
Future getBothHistoryListApi(bool familyHistory) async {  
   checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        getHistoryListLoading = true;
        var map = <String, dynamic>{};       
        map['type'] = familyHistory ? 2 : 1;
        log(ApiUrls.getHistory);
        log(map.toString());
        var result = await ApiHandler()
            .PostApi(apiName: ApiUrls.getHistory, data: map);            
        if (result != null) {           
          GetHistoryModel res = GetHistoryModel.fromJson(result);
          if(familyHistory){
            familyHistoryList = res.data;
          }
          else{
            personalHistoryList = res.data;
          }    
          getHistoryListLoading = false;
           update();
        }        
      } else {
        getHistoryListLoading = false;
         update();
        showToastError('No Internet'.tr);
        showLoader(false);
      }
    });
}

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
    showToastError('No Internet');
    // showLoader(false);
   
  }
});

}

// Notificatio Api and Variable

List<NotificationModelData>? notificationListData;
bool getnotificationListLoading = false;
Future getNotificationListApi() async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
getnotificationListLoading = true;
update();
    try {                                
      log(ApiUrls.notifications);    
      var result = await ApiHandler().GetApi(apiName: ApiUrls.notifications);
      NotificationModel res =  NotificationModel.fromJson(result);
      if(res.status == 200){
        notificationListData =  res.data ?? [];
        getnotificationListLoading = false;

        update();
      }              
  } catch (e) {
    log("catch");
    log(e.toString());
      getnotificationListLoading = false;

        update();
    showToastError(e.toString(), );  
    // showLoader(false);
  
    }
  } else {  
      getnotificationListLoading = false;
        update();  
    showToastError('No Internet');
    // showLoader(false);
   
  }
});
}


// Global Search Api And Variable
TextEditingController searchName = TextEditingController();
bool searchLoading = false;
SeachModelData? searchList;
Future<void> SearchApi() async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        searchLoading = true;
          update();
        // showLoader(true);
        // try {
        var map = <String, dynamic>{};      
        map['search'] = searchName.text.trim();   
       
        log(ApiUrls.search);
        log(map.toString());
        var result = await ApiHandler().PostApi(
            apiName: ApiUrls.search, data: map,);
            if (result != null) {
          SeachModel res =  SeachModel.fromJson(result);
          if(res.data != null){
            searchList = res.data;
             update();
          }
          if(res.data == null){
            searchList = null;
             update();
          }
          searchLoading = false;       
          update();
        }       
      } else {
        searchLoading = false;
        update();
        showToastError('No Internet');       
      }
    });
  }
}
