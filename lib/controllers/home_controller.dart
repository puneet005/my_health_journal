import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_health_journal/resources/app_assets.dart';

class HomeController extends GetxController {
  int listofCatagoryIndex = 0;
  List<Map<String, dynamic>> listofCatagory = [{
  'name':  "Symptoms", 
  'item': ["Toothache", "Fever", "Dizziness", "Headache"]
  }, {
   'name':  "Medications",
   'item': ["Report", "Medications", "Dizziness", "Headache"]
  }, {
   'name':   "Procedures",
   'item': ["Procedures", "OT", "Dizziness", "Headache"]
  }, {
   'name':   "Labs and Scans",
    'item': ["Test", "Collection", "Dizziness", "Headache"]
  }];
  List<Map<String, dynamic>> patientList = [
    {
      'name'  : "Tom Johnson",
      'about':  "Myself",
      'img':  AppAssets.patient1,
      'select': false,

    },
       {
      'name'  : "Maria Jobs",
      'about':  "Spouse",
      'img':  AppAssets.patient2,
      'select': false,
      
    },
     {
      'name'  : "Tom Johnson",
      'about':  "Myself",
      'img':  AppAssets.patient1,
      'select': false,

    },
     {
      'name'  : "Maria Jobs",
      'about':  "Spouse",
      'img':  AppAssets.patient2,
      'select': false,
      
    }
  ];


  // Doctor Visit Input Data
  TextEditingController dateofVisit = TextEditingController();  
  TextEditingController questionsforProvider = TextEditingController();
  TextEditingController providerComments = TextEditingController();
  TextEditingController notes = TextEditingController();

  late File image;
  final _picker = ImagePicker();
  late String memberImgPath = "";
  late String healthDocumentPath = "";
  // late String healthDocumentImageName = "";
  late String idProofPath = "";
   late String symptomDocPath = "";
    late String doctorVisitDocPath = "";
    // Add Medication
     late String medicationType = "";
    late String medicationTime = "";
    bool medicationNotify = false;
     late String medicationDocPath = "";


    //  Add Procedures

      late String proceduresDocPath = "";
      TextEditingController commentText = TextEditingController();
      List commentList = [];
      


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
}