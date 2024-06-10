
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:my_health_journal/common-widgets/custom_loader.dart';
import 'package:my_health_journal/models/calender_model.dart';
import 'package:my_health_journal/models/patient_list_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/apis.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/utils.dart';

class CalendarContorller extends GetxController {


@override
  void onInit(){
    // Get called when controller is created
    super.onInit();
    selectedMember = null;
    update();

  }

 
Map<String, dynamic>? selectData;


// Add Provider
  late File image;
  final _picker = ImagePicker();
  late String patientReportInfoPath = "";

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

// Calendar
int visitTypeIndex = 0;
List visitType = ["Primary care", "Specialist", "Dentist", "Therapist"];

List<Map<String, dynamic>> patientList = [
    {
      'name'  : "Tom Johnson",
      'about':  "Myself",
      'img':  AppAssets.patient1,
      'visit': "Doctors Visits",
      'select': false,

    },
       {
      'name'  : "Maria Jobs",
      'about':  "Spouse",
      
      'img':  AppAssets.patient2,
       'visit': "Surgery",
      'select': false,
      
    },
     {
      'name'  : "Meto Wilson",
      'about':  "Father",
      'img':  AppAssets.patient1,
       'visit': "Routine Check-ups",
      'select': false,

    },
     {
      'name'  : "Maria Jobs",
      'about':  "Spouse",
      'img':  AppAssets.patient2,
       'visit': "Doctors Visits",
      'select': false,
      
    }
  ];



  // Calendar View List Data Vaibale and Api
// List<AppointmentListModelData>? appointmentList = [];
var currentDate = DateTime.now();
var showingDate = DateTime.now();
DateTime? targetDateTime = DateTime.now();
String currentMonth = DateFormat.yMMMM().format(DateTime.now());

// bool getappointmentListLoading = false;
List<String>? calendarDateOnly;
List<CalendarModelData>?  calendarData;
final EventList<Event> markedDateMap = EventList<Event>(events: {});
// List<CalendarModelDataMember> member  
Future GetCalendarEventApi() async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
    showLoader(true);
// getappointmentListLoading = true;

update();
    try {   
      var map = <String, dynamic>{};    
      map['month'] =showingDate.month.toString();
      map['year'] = showingDate.year.toString();             
      log(ApiUrls.calender);    
      log(map.toString());
      var result = await ApiHandler().PostApi(apiName: ApiUrls.calender, data:map, );
      // showLoader(false);
      // update();
      CalendarModel res =  CalendarModel.fromJson(result);
      if(res.status ==  200){
        calendarDateOnly = res.allDate;
        calendarData = res.data;
        for (var ele in res.allDate!) {
          markedDateMap.add(DateTime.parse(ele),  Event(
        date: DateTime.parse(ele),
        title: 'Event 1',
        icon: SizedBox()
      ),);
        }
        showLoader(false);
        update();
      }
      // if(res.status == 200){
      //   appointmentList =  res.data ?? [];
      //   getappointmentListLoading = false;
      //   update();
      // }              
  } catch (e) {
    log("catch");
    log(e.toString());showLoader(false);
      // getappointmentListLoading = false;

        update();
    showToastError(e.toString(), );  
    // showLoader(false);
  
    }
  } else {  
     showLoader(false);
        update();  
    showToastError('No Internet');
    // showLoader(false);
   
  }
});

}

PatientListMember? selectedMember;

Future GetSelectedMemberCalendarEventApi() async {  
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
    showLoader(true);
// getappointmentListLoading = true;

update();
    try {   
      var map = <String, dynamic>{};    
      map['month'] =showingDate.month.toString();
      map['year'] = showingDate.year.toString();  
      map['member_id'] = selectedMember!.id!.toString();      
      log(ApiUrls.memberData);    
      log(map.toString());
      markedDateMap.clear();
      var result = await ApiHandler().PostApi(apiName: ApiUrls.memberData, data:map, );
      // showLoader(false);
      // update();
      CalendarModel res =  CalendarModel.fromJson(result);
      if(res.status ==  200){
        calendarDateOnly = res.allDate;
        calendarData = res.data;
        for (var ele in res.allDate!) {
          markedDateMap.add(DateTime.parse(ele),  Event(
        date: DateTime.parse(ele),
        title: 'Event 1',
        icon: SizedBox()
      ),);
        }
        showLoader(false);
        update();

      }
      // if(res.status == 200){
      //   appointmentList =  res.data ?? [];
      //   getappointmentListLoading = false;
      //   update();
      // }              
  } catch (e) {
    log("catch");
    log(e.toString());showLoader(false);
      // getappointmentListLoading = false;

        update();
    showToastError(e.toString(), );  
    // showLoader(false);
  
    }
  } else {  
     showLoader(false);
        update();  
    showToastError('No Internet');
    // showLoader(false);
   
  }
});

}
}