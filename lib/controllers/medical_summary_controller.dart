

import 'package:get/get.dart';

class MedicalSummaryController extends GetxController {

  List<Map<String, dynamic>> medicalList = [
    {
      'name': "Dermatology Test",
      'visible': true,
    },
    {
      'name': "Calcium Total, Serum",
      'visible': true,
    },
    {
      'name': "Thyroid Function Test",
      'visible': true,
    },
    {
      'name': "Thyroid Function Test",
      'visible': true,
    },
  ];

  List<Map<String, dynamic>> medicationList = [ 
    {
      'img' : "assets/images/medical1.png",
      'name': "Oxycodone",
      'take': ["Tom Johnson", "Maria Jobs"]
    },
     {
      'img' : "assets/images/medical2.png",
      'name': "Aspirin",
      'take': ["Maria Jobs"]
    },
     {
      'img' : "assets/images/medical3.png",
      'name': "Cymbalta",
      'take': ["Maria Jobs"]
    },
     {
      'img' : "assets/images/medical4.png",
      'name': "Codeine",
      'take': ["Maria Jobs"]
    }
  ];
}