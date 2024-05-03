import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/Calendar/calendar.dart';
import 'package:my_health_journal/Screens/home/add_provider.dart';
import 'package:my_health_journal/Screens/home/patient_view.dart';
import 'package:my_health_journal/Screens/other/medical_summary.dart';
import 'package:my_health_journal/Screens/other/notification.dart';
import 'package:my_health_journal/Screens/profile/setting.dart';

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
}
