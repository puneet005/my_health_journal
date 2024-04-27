import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/home/patient_view.dart';

class BottomBarController extends GetxController {
//  final GlobalKey<ScaffoldState> key = GlobalKey();
// for app drawer
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    // const  Discover(),
    const PatientView(),
    const PatientView(),
    const PatientView(),
    const PatientView(),
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
