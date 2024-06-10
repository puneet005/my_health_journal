// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_health_journal/Screens/home/add_new_member.dart';
import 'package:my_health_journal/Screens/home/pdf_view.dart';
import 'package:my_health_journal/common-widgets/custom_loader.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/models/add_history_model.dart';
import 'package:my_health_journal/models/add_medication_model.dart';
import 'package:my_health_journal/models/add_new_member.dart';
import 'package:my_health_journal/models/add_procedures_model.dart';
import 'package:my_health_journal/models/add_sympthom_model.dart';
import 'package:my_health_journal/models/add_test_scan_model.dart';
import 'package:my_health_journal/models/auth/profile_model.dart';
import 'package:my_health_journal/models/home/add_appointment.dart';
import 'package:my_health_journal/models/home/provider_view_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/apis.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/utils.dart';
import 'package:my_health_journal/routers/app_routers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  var bottomCtrl = Get.find<BottomBarController>();
  int listofCatagoryIndex = 0;
  List<Map<String, dynamic>> listofCatagory2 = [
    {
      'img': AppAssets.appointmentIcon,
      'name': "Appointment",
      'item': ["Toothache", "Fever", "Dizziness", "Headache"],
      'route': AppRoutes.appointmentListUi
    },
    {
      'img': AppAssets.symptomsIcon,
      'name': "Symptoms",
      'item': ["Report", "Medications", "Dizziness", "Headache"],
      'route': AppRoutes.symptomsListUi
    },

    {
      'img': AppAssets.medicationsIcon,
      'name': "Medications",
      'item': ["Report", "Medications", "Dizziness", "Headache"],
      'route': AppRoutes.medicationListUi
    },
    // {
    //   'img': AppAssets.eventsIcon,
    //  'name':   "Events",
    //  'item': ["Procedures", "OT", "Dizziness", "Headache"],
    //  'route': AppRoutes.addMedications

    // },
    {
      'img': AppAssets.parsonalHistoryIcon,
      'name': "Personal History",
      'item': ["Test", "Collection", "Dizziness", "Headache"],
      'route': AppRoutes.personalHistoryListUi,
    },
    {
      'img': AppAssets.proceduresIcon,
      'name': "Procedures",
      'item': ["Test", "Collection", "Dizziness", "Headache"],
      'route': AppRoutes.proceduesListUi,
    },
    {
      'img': AppAssets.labsScansIcon,
      'name': "Tests and Scans",
      'item': ["Test", "Collection", "Dizziness", "Headache"],
      'route': AppRoutes.testScansListUi,
    },
    {
      'img': AppAssets.familyHistoryIcon,
      'name': "Family History",
      'item': ["Test", "Collection", "Dizziness", "Headache"],
      'route': AppRoutes.familylHistoryListUi
    },
    {
      'img': AppAssets.providersIcon,
      'name': "Providers",
      'item': ["Test", "Collection", "Dizziness", "Headache"],
      'route': AppRoutes.providerView,
    },
    //   {
    //   'img': AppAssets.calendar2Icon,
    //   'name':   "Calendar",
    //   'item': ["Test", "Collection", "Dizziness", "Headache"],
    //   'route':  AppRoutes.addProvider,

    // },
  ];

  List<Map<String, dynamic>> patientList = [
    {
      'name': "Tom Johnson",
      'about': "Myself",
      'img': AppAssets.patient1,
      'select': false,
    },
    {
      'name': "Maria Jobs",
      'about': "Spouse",
      'img': AppAssets.patient2,
      'select': false,
    },
    {
      'name': "Tom Johnson",
      'about': "Myself",
      'img': AppAssets.patient1,
      'select': false,
    },
    {
      'name': "Maria Jobs",
      'about': "Spouse",
      'img': AppAssets.patient2,
      'select': false,
    }
  ];

// Add New Family Member
  final memberForm = GlobalKey<FormState>();
  TextEditingController memberName = TextEditingController();
  TextEditingController memberDOB = TextEditingController();
  TextEditingController memberRaletion = TextEditingController();
  TextEditingController memberHealthInfo = TextEditingController();
  late String memberImgPath = "";
  late String healthDocumentPath = "";
  late String idProofPath = "";

  // Add Appointmet Variable
  final appointmentForm = GlobalKey<FormState>();
  ProviderViewModelData? appointmentProvider;
  TextEditingController appointmentDOV = TextEditingController();
  TextEditingController appointmentQuestion = TextEditingController();
  TextEditingController appointmentComment = TextEditingController();
  TextEditingController appointmentNotes = TextEditingController();
  String? appointmentDate, appointmentVisitTime;
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
  TextEditingController medicationDateTimeCont = TextEditingController();
  TextEditingController medicationComment = TextEditingController();
  bool prescriptionType = false;
  bool overTheCounterType = false;
  late String medicationType = "";
  late String medicationTime = "";
  bool medicationNotify = false;
  String? medicationDosageFormValue;
  TextEditingController medicationDosageFormCustomValue = TextEditingController();
  late String medicationDocPath = "";

  //  --> error  variable
  bool medicationError = false;

// Add Personal History OR Add Personal History
  final familyHistoryForm = GlobalKey<FormState>();
//  TextEditingController familyHistoryComment = TextEditingController();
  final personalHistoryForm = GlobalKey<FormState>();
  TextEditingController historyComment = TextEditingController();

  // Add Procedures
  final proceduresForm = GlobalKey<FormState>();
  final proceduresAddCommentForm = GlobalKey<FormState>();
   ProviderViewModelData? proceduresProvider;
  TextEditingController proceduresAddComment = TextEditingController();
  TextEditingController proceduresType = TextEditingController();
  // TextEditingController proceduresProvider = TextEditingController();
  TextEditingController proceduresDate = TextEditingController();
  String? procedursData, procedursVisitTime;
  TextEditingController proceduresComment = TextEditingController();
  
  late String proceduresDocPath = "";
   //  --> error  variable
  bool procedurestError = false;
  // bool proceduresPhoto = false;
  List<Map<String, dynamic>> proceduresMainCommitList = [];
  // List<CommentData> procedurescommitList = [];

  // Add Test And Scans Variable
  final testScanForm = GlobalKey<FormState>();
  final testScanAddCommentForm = GlobalKey<FormState>();
  ProviderViewModelData? testScanProvider;
  TextEditingController testScanAddComment = TextEditingController();
  TextEditingController testScanName = TextEditingController();
  // TextEditingController testScanProvider = TextEditingController();
  TextEditingController testScanDate = TextEditingController();  
  TextEditingController testScanComment = TextEditingController();
  late String testScanDocPath = "";
  List<Map<String, dynamic>> testScanCommitList = [];
  String? scanData, scanVisitTime;
   bool testScanError = false;

  // Add Provider Variable
  final providerForm = GlobalKey<FormState>();
  TextEditingController providerName = TextEditingController();
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
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
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
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      return pickedFile;
    } else {
      print('No image selected.');
      return null;
    }
  }

  // Add New Member Api
  Future<void> AddNewMemberApi() async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        // try {
        var map = <String, dynamic>{};
        var filesmap = <String, dynamic>{};
        map['name'] = memberName.text.trim();
        map['dob'] = memberDOB.text.trim();
        map['relation'] = memberRaletion.text.trim();
        map['health_insurance_information'] = memberHealthInfo.text.trim();
        // map['dob'] = memberDOB.text.trim();
        if (memberImgPath != "") {
          filesmap['profile'] = memberImgPath;
        }
        if (healthDocumentPath != "") {
          filesmap['health_insurance_document'] = healthDocumentPath;
        }
        if (idProofPath != "") {
          filesmap['id_proof'] = idProofPath;
        }
        log(ApiUrls.addNewMember);
        log(map.toString());
        var result = await ApiHandler().PostMultipartApi(
            apiName: ApiUrls.addNewMember, data: map, files: filesmap);
        if (result != null) {
          AddNewMemberModel res = AddNewMemberModel.fromJson(result);
          if (res.status == 200) {
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
          update();
        }
        showLoader(false);

        // } catch (e) {
        //   log("catch");
        //   log(e.toString());
        //   showToastError(e.toString(), );
        //   showLoader(false);
        //   }
      } else {
        showToastError('No Internet');
        showLoader(false);
      }
    });
  }

// Add Appointment API
  Future<void> AddAppointmentApi() async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        // try {
        var map = <String, dynamic>{};
        var filesmap = <String, dynamic>{};
        map['member_id'] = bottomCtrl.selectedPatient.id;
        map['provider_id'] = appointmentProvider!.id;
        map['visit_date'] = appointmentDate;
        map['visit_time'] = appointmentVisitTime;
        map['question_for_provider'] = appointmentQuestion.text.trim();
        map['provider_comment'] = appointmentComment.text.trim();
        map['note'] = appointmentNotes.text.trim();
        if (appointmentPhoto != "") {
          filesmap['photo'] = appointmentPhoto;
        }
        log(ApiUrls.addAppointment);
        log(map.toString());
        var result = await ApiHandler().PostMultipartApi(
            apiName: ApiUrls.addAppointment, data: map, files: filesmap);
        if (result != null) {
          log(jsonEncode(result));
          AddAppointmentModel res = AddAppointmentModel.fromJson(result);

          // AddNewMemberModel res  = AddNewMemberModel.fromJson(result);
          if (res.status == 200) {
            showToast(res.message.toString());
            appointmentProvider = null;
            appointmentDOV.clear();
            appointmentComment.clear();
            appointmentQuestion.clear();
            appointmentNotes.clear();
            appointmentPhoto = "";
            appointmentDate = null;
            appointmentVisitTime = null;
            // healthDocumentPath = "";
            // idProofPath = "";
            bottomCtrl.getAppointmentListApi();
            update();
            Get.back();
            // }
            // showLoader(false);
            // update();
          } else {
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
        showToastError('No Internet');
        showLoader(false);
      }
    });
  }

  // Add Sympthoms API

  Future<void> AddSymptomsApi(String data, String time) async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        // try {
        var map = <String, dynamic>{};
        var filesmap = <String, dynamic>{};
        map['member_id'] = bottomCtrl.selectedPatient.id;
        map['date'] = data;
        map['time'] = time;
        map['comment'] = symptomComment.text.trim();
        if (symptomDocPath != "") {
          filesmap['file'] = symptomDocPath;
        }
        log(ApiUrls.addSymptoms);
        log(map.toString());
        var result = await ApiHandler().PostMultipartApi(
            apiName: ApiUrls.addSymptoms, data: map, files: filesmap);
        if (result != null) {
          log(jsonEncode(result));

          AddSympthomModel res = AddSympthomModel.fromJson(result);
          if (res.status == 200) {
            showToast(res.message.toString());
            symptomComment.clear();
            symptomDocPath = "";
            bottomCtrl.getSymptomsListApi();
            //     // Get.find<BottomBarController>().patientListApi();
            update();
            Get.back();
            // }
            // showLoader(false);
            // update();
          }
        } else {
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

// Add New Medicatgion API
  Future<void> AddMedicationApi() async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        var map = <String, dynamic>{};
        var filesmap = <String, dynamic>{};
        map['member_id'] = bottomCtrl.selectedPatient.id;
        map['name'] = medicationName.text.trim();
        map['dosage'] = medicationDosage.text.trim();
        map['dosage_form'] = medicationDosageFormValue == "Custom" ?  medicationDosageFormCustomValue.text.trim() : medicationDosageFormValue;
        map['start_date'] = medicationstartingDateCont.text.trim();
        map['end_date'] = medicationEndingDateCont.text.trim();
        map['date_and_time'] = medicationDateTimeCont.text.trim();
        map['nitify_for_medication'] = medicationNotify ? 1 : 0;
        map['comment'] = medicationComment.text.trim();
        map['prescription'] = prescriptionType ? "True" : "False";
        map['over_the_counter'] = overTheCounterType ? "True" : "False";
        map['administration_option'] = medicationTime;
        if (medicationDocPath != "") {
          filesmap['file'] = medicationDocPath;
        }
        log(ApiUrls.addMedication);
        log(map.toString());
        var result = await ApiHandler().PostMultipartApi(
            apiName: ApiUrls.addMedication, data: map, files: filesmap);
        if (result != null) {
          log(jsonEncode(result));
          AddMedicationModel res = AddMedicationModel.fromJson(result);
          if (res.status == 200) {
            showToast(res.message.toString());
            medicationName.clear();
            medicationDosage.clear();
             medicationDosageFormCustomValue.clear();
            medicationDosageFormValue = null;
            medicationstartingDateCont.clear();
            medicationEndingDateCont.clear();
            medicationDateTimeCont.clear();
            medicationNotify = false;
            medicationComment.clear();
            prescriptionType = false;
            overTheCounterType = false;
            medicationTime = "";
            medicationDocPath = "";
            bottomCtrl.getMedicationListApi();
            update();
            Get.back();
          } else {
            showToast(res.message.toString());
          }
          showLoader(false);
        }
      } else {
        showToastError('No Internet');
        showLoader(false);
      }
    });
  }

  // Add Procedures Api
  Future<void> AddProceduresApi() async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          var map = <String, dynamic>{};
          var filesmap = <String, dynamic>{};
          map['member_id'] = bottomCtrl.selectedPatient.id;
          map['type'] = proceduresType.text.trim();
          map['provider'] = proceduresProvider!.id.toString();
          map['date_of_procedure'] = procedursData;
          map['visit_time'] = procedursVisitTime;
          map['add_comment'] = jsonEncode(proceduresMainCommitList);
          if (proceduresDocPath != "") {
            filesmap['file'] = proceduresDocPath;
          }
          log(ApiUrls.addProcedures);
          log(map.toString());
          var result = await ApiHandler().PostMultipartApi(
              apiName: ApiUrls.addProcedures, data: map, files: filesmap);
          if (result != null) {
            log(jsonEncode(result));

            //  procedurescommitList.clear();
            AddProceduresModel res = AddProceduresModel.fromJson(result);
            if (res.status == 200) {
              showToast(res.message.toString());
              proceduresProvider = null;
              proceduresType.clear();

              proceduresDate.clear();
              procedursVisitTime = null;
              procedursData =  null;
              proceduresDocPath = "";
              proceduresMainCommitList.clear();

              bottomCtrl.getProceduresListApi();
              update();
              Get.back();
            } else {
              showToast(res.message.toString());
            }
            showLoader(false);
          }
        } catch (e) {
          showToastError(e.toString());
          showLoader(false);
        }
      } else {
        showToastError('No Internet');
        showLoader(false);
      }
    });
  }

  // Add Lab tests Api
  Future<void> AddTestScanApi() async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        var map = <String, dynamic>{};
        var filesmap = <String, dynamic>{};
        map['member_id'] = bottomCtrl.selectedPatient.id;
        map['name'] = testScanName.text.trim();
        map['provider'] = testScanProvider!.id.toString();
        map['scan_test'] = scanData!;
        map['visit_time'] = scanVisitTime!;
        map['add_comment'] = jsonEncode(testScanCommitList);
        if (testScanDocPath != "") {
          filesmap['file'] = testScanDocPath;
        }
        log(ApiUrls.addTestAndScan);
        log(map.toString());
        var result = await ApiHandler().PostMultipartApi(
            apiName: ApiUrls.addTestAndScan, data: map, files: filesmap);
        if (result != null) {
          AddTestScanModel res = AddTestScanModel.fromJson(result);
          if (res.status == 200) {
            showToast(res.message.toString());
            testScanName.clear();
            testScanProvider = null;
            testScanDate.clear();
            scanVisitTime = null;
            scanData = null;
            testScanCommitList.clear();
            testScanDocPath = "";
            bottomCtrl.getTestScanListApi();
            update();
            Get.back();
          } else {
            showToast(res.message.toString());
          }
          showLoader(false);
        }
      } else {
        showToastError('No Internet'.tr);
        showLoader(false);
      }
    });
  }
  // Add Personal And Family History Api
  Future<void> AddBothHistoryApi(bool familyHistory) async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        var map = <String, dynamic>{};
        map['member_id'] = bottomCtrl.selectedPatient.id;
        map['comment'] = historyComment.text.trim();
        map['type'] = familyHistory ? 2 : 1;
        log(ApiUrls.addHistory);
        log(map.toString());
        var result = await ApiHandler()
            .PostApi(apiName: ApiUrls.addHistory, data: map);
            
        if (result != null) {
           
          AddHistoryModel res = AddHistoryModel.fromJson(result);
          showToast(res.message.toString());
          historyComment.clear();
            bottomCtrl.getBothHistoryListApi(familyHistory);
            update();
            Get.back();

          // log(jsonEncode(result));
          
          showLoader(false);
        }
      } else {
        showToastError('No Internet'.tr);
        showLoader(false);
      }
    });
  }

// Add Provider API
  Future<void> AddProviderApi() async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        // try {
        var map = <String, dynamic>{};
        var filesmap = <String, dynamic>{};
        map['name'] = providerName.text.trim();
        map['specialization'] = providerSpecicalization.text.trim();
        map['web_url'] = providerWebUrl.text.trim();
        map['ac_number'] = providerAccount.text.trim();
        map['phone'] = providerPhone.text.trim();
        map['visit_date'] = providerDateOfVisit.text.trim();
        if (patientReportInfoPath != "") {
          filesmap['report_info'] = patientReportInfoPath;
        }

        log(ApiUrls.addProvider);
        log(map.toString());
        var result = await ApiHandler().PostMultipartApi(
            apiName: ApiUrls.addProvider, data: map, files: filesmap);
        if (result != null) {
          // AddNewMemberModel res  = AddNewMemberModel.fromJson(result);
          if (result['status'] == 200) {
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
// Full Medical Summary Api And Variable
Future<void> FullMedicalSummaryApi() async{
  checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
         showLoader(true);
        var map = <String, dynamic>{};
        map['member_id'] = bottomCtrl.selectedPatient.id;        
        log(ApiUrls.generateInvoice);
        log(map.toString());
        var result = await ApiHandler()
            .PostApi(apiName: ApiUrls.generateInvoice, data: map);
        showLoader(false);
        if (result != null) {                              
          DownloadPdfAndView(result['data']['download_url']);          
        }                
      }else{

      }
  });
}
 var downloadpercent = 0.0.obs;
bool startDownload = false;
Future DownloadPdfAndView(String url) async{
  await Permission.storage.request();  
  Directory directory = Directory("");
    
    if (Platform.isAndroid) {
      directory = (await getExternalStorageDirectory())!;
    } else {
      directory = (await getApplicationDocumentsDirectory());
    }
    String _localPath = directory.path + Platform.pathSeparator + 'Download/';
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
        savedDir.create();
    }
      try {
             startDownload = true;
            downloadpercent.value = 0.0;
             update();    
                  String pdfName =
                      savedDir.path + url.split("/").last;
                  Dio dio = Dio();
                  DownloadingUi(true);
                  await dio.download(url, pdfName,
                      onReceiveProgress: (receivedBytes, totalBytes) {                          
                         downloadpercent.value = double.parse(
                              ((receivedBytes / totalBytes) * 100)
                                  .toStringAsFixed(0));                          
                          update();                     
                        if (receivedBytes == totalBytes) {

                           DownloadingUi(false);
                           Get.to(PdfViewUi(path: pdfName,));
                           startDownload = true;
                           update();                           
                        }
                      });
                } catch (e) {
                  print('catch catch catch');
                  print(e);
                }
   log(Permission.storage.request().toString());

}
// Update Api Part
  // Procedures Add comment Api
  Future<void> ProceduresAddCommentApi(String date, String proceduresID) async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {
          var map = <String, dynamic>{};
          // var filesmap = <String, dynamic>{};     
          map['member_id'] = bottomCtrl.selectedPatient.id;     
          // map['procedures_id'] = .
          map['procedures_id'] = proceduresID;
          map['time'] = date;
          map['title'] =  proceduresAddComment.text.trim();          
          log(ApiUrls.addProceduresComment);
          log(map.toString());
          var result = await ApiHandler().PostApi(
              apiName: ApiUrls.addProceduresComment, data: map,);
          if (result != null) {
            log(jsonEncode(result));

            //  procedurescommitList.clear();
            AddProceduresModel res = AddProceduresModel.fromJson(result);
            if (res.status == 200) {
              showToast(res.message.toString());   
              proceduresAddComment.clear() ;         
              bottomCtrl.getProceduresListApi();
              update();
              Get.back();
              Get.back();
            } else {
              showToastError(res.message.toString());
            }
            showLoader(false);
          }
        } catch (e) {
          showToastError(e.toString());
          showLoader(false);
        }
      } else {
        showToastError('No Internet');
        showLoader(false);
      }
    });
  }

  

  // Test And Scans Add comment Api
  Future<void> TestScanAddCommentApi(String date, String testID) async {
    checkInternetConnectivity().then((isConnected) async {
      if (isConnected) {
        showLoader(true);
        try {      
          var map = <String, dynamic>{};
          // var filesmap = <String, dynamic>{};     
          map['member_id'] = bottomCtrl.selectedPatient.id;     
          // map['procedures_id'] = .
          map['testscan_id'] = testID;
          map['time'] = date;
          map['title'] =  testScanAddComment.text.trim(); 
          log(ApiUrls.addTestAndScanComment);
          log(map.toString());
          var result = await ApiHandler().PostApi(
              apiName: ApiUrls.addTestAndScanComment, data: map,);
          if (result != null) {
            log(jsonEncode(result));            
            AddTestScanModel res = AddTestScanModel.fromJson(result);
            if (res.status == 200) {
              showToast(res.message.toString());   
              testScanAddComment.clear() ;         
              bottomCtrl.getTestScanListApi();
              update();
              Get.back();
              Get.back();
            } else {
              showToastError(res.message.toString());
            }
            showLoader(false);
          }
        } catch (e) {
          showToastError(e.toString());
          showLoader(false);
        }
      } else {
        showToastError('No Internet');
        showLoader(false);
      }
    });
  }
  


  // Download Ui And Code
  DownloadingUi(bool val) {
    if(val){
    Get.dialog(
        barrierDismissible: false,
        WillPopScope(
          onWillPop: () async {
            // Return false to prevent the dialog from closing on back button press
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Obx(() => Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                           SizedBox(
                            width: 80.0,
                    height: 80.0,
                             child: CircularProgressIndicator(
                                                       strokeWidth : 3.0,
                                                       backgroundColor: Colors.white,
                                                       color: AppColors.appColor, // Use your app color
                                                       value: downloadpercent.value / 100, // Progress should be between 0 and 1
                                                     ),
                           ),
                        Center(
                          child: Text(
                            '${downloadpercent.value.toStringAsFixed(1)}%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ));
    }
    else{
      Get.back();
    }
  }
 
  
}


