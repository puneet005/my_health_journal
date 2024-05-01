
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_health_journal/resources/app_assets.dart';

class CalendarContorller extends GetxController {

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
}