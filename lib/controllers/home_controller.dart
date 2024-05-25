import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_health_journal/Screens/home/add_new_member.dart';
import 'package:my_health_journal/common-widgets/custom_loader.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/models/add_new_member.dart';
import 'package:my_health_journal/models/add_sympthom_model.dart';
import 'package:my_health_journal/models/auth/profile_model.dart';
import 'package:my_health_journal/models/home/add_appointment.dart';
import 'package:my_health_journal/models/home/provider_view_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/apis.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/utils.dart';
import 'package:my_health_journal/routers/app_routers.dart';



class HomeController extends GetxController {

  var bottomCtrl =  Get.find<BottomBarController>();
  int listofCatagoryIndex = 0;
  // List<Map<String, dynamic>> listofCatagory = [{
  // 'name':  "Symptoms", 
  // 'item': ["Toothache", "Fever", "Dizziness", "Headache"]
  // }, {
  //  'name':  "Medications",
  //  'item': ["Report", "Medications", "Dizziness", "Headache"]
  // }, {
  //  'name':   "Procedures",
  //  'item': ["Procedures", "OT", "Dizziness", "Headache"]
  // }, {
  //  'name':   "Labs and Scans",
  //   'item': ["Test", "Collection", "Dizziness", "Headache"]
  // },
  // ];
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

// Add New Family Member
  final memberForm = GlobalKey<FormState>();
  TextEditingController  memberName = TextEditingController();
  TextEditingController memberDOB = TextEditingController();
  TextEditingController memberRaletion = TextEditingController();
  TextEditingController memberHealthInfo = TextEditingController();
  late String memberImgPath = "";
  late String healthDocumentPath = "";
  late String idProofPath = "";

  // Add Appointmet Variable
  final appointmentForm = GlobalKey<FormState>();
  ProviderViewModelData? appointmentProvider;
  TextEditingController  appointmentDOV = TextEditingController();
  TextEditingController appointmentQuestion = TextEditingController();
  TextEditingController appointmentComment = TextEditingController();
  TextEditingController appointmentNotes = TextEditingController();
  late String appointmentPhoto = "";
  // Add Symptoms
  final symptomsForm = GlobalKey<FormState>();
  TextEditingController symptomComment = TextEditingController();
  late String symptomDocPath = "";

  //  --> error  variable
   bool appointmentError = false;
  

  // Add Medication
  final medicationForm = GlobalKey<FormState>();  
  TextEditingController medicationName = TextEditingController();
  TextEditingController medicationDosage = TextEditingController();
  TextEditingController medicationstartingDateCont = TextEditingController();
  TextEditingController medicationEndingDateCont = TextEditingController();
  TextEditingController medicationComment = TextEditingController();  
  bool  prescriptionType = false;
  bool  overTheCounterType = false;
  late String medicationType = "";
  late String medicationTime = "";
  bool medicationNotify = false;
  String? selectedValue;
  late String medicationDocPath = "";

// Add Personal History
 final personalHistoryForm = GlobalKey<FormState>();
 TextEditingController personalHistoryComment = TextEditingController();


 // Add Procedures
  final proceduresForm = GlobalKey<FormState>();  
  TextEditingController proceduresType = TextEditingController();
  TextEditingController proceduresProvider = TextEditingController();
  TextEditingController proceduresDate = TextEditingController();
  TextEditingController proceduresComment = TextEditingController();
  // TextEditingController medicationComment = TextEditingController();  
  late String proceduresDocPath = "";
  // bool proceduresPhoto = false;
  List<CommentData> procedurescommitList = [];


  // Add Test And Scans Variable
  final testScanForm = GlobalKey<FormState>();  
  TextEditingController testScanName = TextEditingController();
  TextEditingController testScanProvider = TextEditingController();
  TextEditingController testScanDate = TextEditingController();
  TextEditingController testScanComment = TextEditingController();
  late String testScanDocPath = "";
  List<CommentData> testScanCommitList = [];

  // Add Personal History
 final familyHistoryForm = GlobalKey<FormState>();
 TextEditingController familyHistoryComment = TextEditingController();

  // Add Provider Variable
  final providerForm = GlobalKey<FormState>();
  TextEditingController  providerName = TextEditingController();
  TextEditingController providerSpecicalization = TextEditingController();
  TextEditingController providerWebUrl = TextEditingController();
  TextEditingController providerPhone = TextEditingController();
  TextEditingController providerAccount = TextEditingController();
  TextEditingController providerDateOfVisit = TextEditingController();
  late String patientReportInfoPath = "";






  //  TextEditingController dateTimeCont = TextEditingController();
  // TextEditingController notes = TextEditingController()

  // Doctor Visit Input Data
  // TextEditingController dateofVisit = TextEditingController();
  // TextEditingController questionsforProvider = TextEditingController();
  // TextEditingController providerComments = TextEditingController();
  TextEditingController startingDateCont = TextEditingController();
  TextEditingController endingDateCont = TextEditingController();
   TextEditingController dateTimeCont = TextEditingController();
  // TextEditingController notes = TextEditingController();

  late File image;
  final _picker = ImagePicker();
 
  
    // late String doctorVisitDocPath = "";
    // Add Medication
   



    //  Add Procedures

      
      // TextEditingController commentText = TextEditingController();
      List commentList = [];
      
    // Add Test Scan
     
      // TextEditingController testScancommentText = TextEditingController();
      // List testScanCommentList = [];


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







   List<Map<String, dynamic>> listofCatagory2 = [{
  'img': AppAssets.appointmentIcon,
  'name':  "Appointment", 
  'item': ["Toothache", "Fever", "Dizziness", "Headache"],
  'route': AppRoutes.addDoctorsVisit
  },
    {
      'img': AppAssets.symptomsIcon,
   'name':  "Symptoms",
   'item': ["Report", "Medications", "Dizziness", "Headache"],
   'route': AppRoutes.addSymptoms
  }, 
  
   {
    'img': AppAssets.medicationsIcon,
   'name':  "Medications",
   'item': ["Report", "Medications", "Dizziness", "Headache"],
   'route': AppRoutes.addMedications

  }, 
  // {
  //   'img': AppAssets.eventsIcon,
  //  'name':   "Events",
  //  'item': ["Procedures", "OT", "Dizziness", "Headache"],
  //  'route': AppRoutes.addMedications
   
  // },
  {
    'img': AppAssets.parsonalHistoryIcon,
    'name':   "Personal History",
    'item': ["Test", "Collection", "Dizziness", "Headache"],
    'route': AppRoutes.addPersonalHistory, 


  },
   {
    'img': AppAssets.proceduresIcon,
    'name':   "Procedures",
    'item': ["Test", "Collection", "Dizziness", "Headache"],
     'route': AppRoutes.addProcedures


  },
  {
    'img': AppAssets.labsScansIcon,
   'name':   "Labs and Scans",
    'item': ["Test", "Collection", "Dizziness", "Headache"],
    'route': AppRoutes.addTestScan,
  },
  {
    'img': AppAssets.familyHistoryIcon,
   'name':   "Family History",
    'item': ["Test", "Collection", "Dizziness", "Headache"],
     'route': AppRoutes.addFamilyHistory
  },
  {
    'img': AppAssets.providersIcon,
    'name':   "Providers",
    'item': ["Test", "Collection", "Dizziness", "Headache"],
    'route':  AppRoutes.providerView,
  },
  //   {
  //   'img': AppAssets.calendar2Icon,
  //   'name':   "Calendar",
  //   'item': ["Test", "Collection", "Dizziness", "Headache"],
  //   'route':  AppRoutes.addProvider,

  // },
  ];


  // Add New Member Api
  Future<void> AddNewMemberApi() async{
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
    showLoader(true);
    // try {
      var map = <String, dynamic>{};
      var filesmap= <String, dynamic>{};
      map['name'] = memberName.text.trim();
      map['dob'] = memberDOB.text.trim();
      map['relation'] = memberRaletion.text.trim();
      map['health_insurance_information'] = memberHealthInfo.text.trim();
      // map['dob'] = memberDOB.text.trim();
      if( memberImgPath != ""){
        filesmap['profile'] = memberImgPath;
      }
      if(healthDocumentPath != ""){
        filesmap['health_insurance_document'] = healthDocumentPath;
      }
      if(idProofPath != ""){
        filesmap['id_proof'] = idProofPath;  
      }
      log(ApiUrls.addNewMember);
      log(map.toString());
      var result =  await ApiHandler().PostMultipartApi(apiName: ApiUrls.addNewMember, data: map, files: filesmap);   
      if(result != null){
        AddNewMemberModel res  = AddNewMemberModel.fromJson(result);
        if(res.status ==  200){
          showToast(res.message.toString());
            memberName.clear();
            memberDOB.clear();
            memberRaletion.clear();
            memberHealthInfo.clear();
            memberImgPath = "";
            healthDocumentPath = "";
            idProofPath = "";
            Get.find<BottomBarController>().patientListApi();
            update();
            Get.back();
        }
        showLoader(false);
        update();                   }
      showLoader(false);

  // } catch (e) {
  //   log("catch");
  //   log(e.toString());
  //   showToastError(e.toString(), );  
  //   showLoader(false);
  //   }
  } else {    
    
    showToastError('No Internet'.tr);
    showLoader(false);
  }
});
  }


// Add Appointment API
Future<void> AddAppointmentApi() async{
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
    showLoader(true);
    // try {
      var map = <String, dynamic>{};
      var filesmap= <String, dynamic>{};
      map['member_id'] = bottomCtrl.selectedPatient.id;
      map['provider_id'] = appointmentProvider!.id;
      map['visit_date'] = appointmentDOV.text.trim();
      map['question_for_provider'] = appointmentQuestion.text.trim();
      map['provider_comment'] = appointmentComment.text.trim();
      map['note'] = appointmentNotes.text.trim();
      if( appointmentPhoto != ""){
        filesmap['photo'] = appointmentPhoto;
      }     
      log(ApiUrls.addAppointment);
      log(map.toString());
      var result =  await ApiHandler().PostMultipartApi(apiName: ApiUrls.addAppointment, data: map, files: filesmap);   
      if(result != null){
          log(jsonEncode(result));
          AddAppointmentModel res = AddAppointmentModel.fromJson(result);

        // AddNewMemberModel res  = AddNewMemberModel.fromJson(result);
        if(res.status ==  200){
          showToast(res.message.toString());
            appointmentProvider = null;

            appointmentDOV.clear();
            appointmentComment.clear();
            appointmentQuestion.clear();
            appointmentNotes.clear();
            appointmentPhoto = "";
            // healthDocumentPath = "";
            // idProofPath = "";
            // Get.find<BottomBarController>().patientListApi();
            update();
            Get.back();
        // }
        // showLoader(false);
        // update();                  
        }
        else{
          log(jsonEncode(result));
        }
      showLoader(false);
      }

  // } catch (e) {
  //   log("catch");
  //   log(e.toString());
  //   showToastError(e.toString(), );  
  //   showLoader(false);
  //   }
  } else {    
    
    showToastError('No Internet'.tr);
    showLoader(false);
  }
});
  }

  // Add Sympthoms API
  // Add Appointment API
Future<void> AddSymptomsApi(String data, String time) async{
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
    showLoader(true);
    // try {
      var map = <String, dynamic>{};
      var filesmap= <String, dynamic>{};
      map['member_id'] = bottomCtrl.selectedPatient.id;
      map['date'] = data;
      map['time'] = time;      
      map['comment'] = symptomComment.text.trim();
      if( symptomDocPath!= ""){
        filesmap['file'] = symptomDocPath;
      }     
      log(ApiUrls.addSymptoms);
      log(map.toString());
      var result =  await ApiHandler().PostMultipartApi(apiName: ApiUrls.addSymptoms, data: map, files: filesmap);   
      if(result != null){
       log(jsonEncode(result));

        AddSympthomModel res  = AddSympthomModel.fromJson(result);
        if(res.status ==  200){
          showToast(res.message.toString());
            symptomComment.clear();
            symptomDocPath = "";
        //     // Get.find<BottomBarController>().patientListApi();
            update();
            Get.back();
        // }
        // showLoader(false);
        // update();   
        }               
        }
        else{
          log(jsonEncode(result));
        }
      showLoader(false);

  // } catch (e) {
  //   log("catch");
  //   log(e.toString());
  //   showToastError(e.toString(), );  
  //   showLoader(false);
  //   }
  } else {    
    
    showToastError('No Internet'.tr);
    showLoader(false);
  }
});
  }
// Add Provider API


  Future<void> AddProviderApi() async{
  checkInternetConnectivity().then((isConnected) async {
  if (isConnected) {
    showLoader(true);
    // try {
      var map = <String, dynamic>{};
      var filesmap= <String, dynamic>{};
      map['name'] = providerName.text.trim();
      map['specialization'] = providerSpecicalization.text.trim();
      map['web_url'] = providerWebUrl.text.trim();
      map['ac_number'] = providerAccount.text.trim();
      map['phone'] = providerPhone.text.trim();
      map['visit_date'] = providerDateOfVisit.text.trim();
      if( patientReportInfoPath != ""){
        filesmap['report_info'] =  patientReportInfoPath;
      }
      
      log(ApiUrls.addProvider);
      log(map.toString());
      var result =  await ApiHandler().PostMultipartApi(apiName: ApiUrls.addProvider, data: map, files: filesmap);   
      if(result != null){
        // AddNewMemberModel res  = AddNewMemberModel.fromJson(result);
        if(result['status'] ==  200){
          showToast(result['message'].toString());
            providerName.clear();
            providerSpecicalization.clear();
            providerWebUrl.clear();
            providerAccount.clear();
            providerPhone.clear();
            providerDateOfVisit.clear();
            patientReportInfoPath = "";
            Get.find<BottomBarController>().getProviderListApi();
          //  Get.back();
        }
          update();                   
        }
       Get.back();
      showLoader(false);
  } else {    
    
    showToastError('No Internet'.tr);
    showLoader(false);
  }
});
  }
}