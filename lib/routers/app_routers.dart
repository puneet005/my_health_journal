
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/Calendar/calender_visit.dart';
import 'package:my_health_journal/Screens/home/appointmant/add_doctors_visit.dart';
import 'package:my_health_journal/Screens/home/family_history/add_family_history.dart';
import 'package:my_health_journal/Screens/home/medications/add_medications.dart';
import 'package:my_health_journal/Screens/home/add_new_member.dart';
import 'package:my_health_journal/Screens/home/personal_history/add_personal_history.dart';
import 'package:my_health_journal/Screens/home/procedures/add_procedures.dart';
import 'package:my_health_journal/Screens/home/provider/add_provider.dart';
import 'package:my_health_journal/Screens/home/symptoms/add_symptoms.dart';
import 'package:my_health_journal/Screens/home/labs_scans/add_test_scan.dart';
import 'package:my_health_journal/Screens/home/patient_details.dart';
import 'package:my_health_journal/Screens/home/provider/provider_view.dart';
import 'package:my_health_journal/Screens/home/share_screen.dart';
import 'package:my_health_journal/Screens/other/medical_summary.dart';
import 'package:my_health_journal/Screens/other/medications.dart';
import 'package:my_health_journal/Screens/other/medications_details.dart';
import 'package:my_health_journal/Screens/other/notification.dart';
import 'package:my_health_journal/Screens/profile/edit_profile.dart';
import 'package:my_health_journal/Screens/profile/premium.dart';
import 'package:my_health_journal/Screens/profile/setting.dart';
import 'package:my_health_journal/Screens/sign_up/login.dart';
import 'package:my_health_journal/Screens/sign_up/sign_up.dart';
import 'package:my_health_journal/Screens/splash_screen.dart';
import 'package:my_health_journal/common-widgets/custom_bottom_navigation2.dart';


class AppRoutes {

  static String splashScreen = '/splashScreen';
  static String loginScreen = '/loginScreen';
  static String signUpScreen = '/signUpScreen';
  // static String payrollFlowChartScreen = '/payrollFlowChartScreen';
  static String bottomNav = '/bottomNavScreen';
  static String shareScreen ='/ShareScreen';
  static String addNewMember ='/addNewMember';
  static String addSymptoms ='/AddSymptoms';
  static String patientDetails = '/PatientDetails';
  static String addDoctorsVisit = '/AddDoctorsVisit';
  static String addMedications = '/AddMedications';
  static String addProcedures = '/AddProcedures';
  
  static String addTestScan = '/AddTestScan';
  static String medicalSummary = '/MedicalSummary';
  static String doctorVisit = '/DoctorVisit';
  static String addProvider = '/AddProvider';
  static String medications = '/Medications';
  static String medicationDetails = '/medicationDetails';
  static String setting = '/setting';
  static String premium = '/Premium';
  static String notification = '/Notification';
  //    
  static String editProfile = '/EditProfile';
  
  
  static String providerView = '/ProviderView';
  static String addPersonalHistory = '/AddPersonalHistory';
  static String addFamilyHistory = '/AddFamilyHistory';
  // static String providerView = '/ProviderView';
  // static String providerView = '/ProviderView';



  


  static final getRoute = [

    // Splash
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
    ),
    // Login
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const Login(),
    ),
    // SignUp
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => const SignUp(),
    ),
    // payrollFlowChartScreen
    // GetPage(
    //   name: AppRoutes.payrollFlowChartScreen,
    //   page: () => const PayrollFlowChart(),
    // ),

    GetPage(
    name: AppRoutes.bottomNav, 
    page: () => NavBar(),
    ),
    GetPage(
    name: AppRoutes.shareScreen, 
    page: () => const ShareScreen(),
    ),
    GetPage(
    name: AppRoutes.addNewMember, 
    page: () => const AddNewMember(),
    ),
     GetPage(
    name: AppRoutes.addSymptoms, 
    page: () => const AddSymptoms(),
    ),

    // // RecruitingScreen
    GetPage(
      name: AppRoutes.patientDetails,
      page: () => const PatientDetails(),
    ),
    // // RecruitingScreen
    GetPage(
      name: AppRoutes.addDoctorsVisit,
      page: () => const AddDoctorsVisit(),
    ),
    GetPage(
      name: AppRoutes.addMedications,
      page: () => const AddMedications(),
    ),
    GetPage(
      name: AppRoutes.addProcedures,
      page: () => const AddProcedures(),
    ),
    GetPage(
      name: AppRoutes.addTestScan,
      page: () => const AddTestScan(),
    ),
    GetPage(
      name: AppRoutes.medicalSummary,
      page: () => const MedicalSummary(),
    ),
    GetPage(
      name: AppRoutes.doctorVisit,
      page: () => const DoctorVisit(),
    ),
    GetPage(
      name: AppRoutes.addProvider,
      page: () => const AddProvider(),
    ),
    GetPage(
      name: AppRoutes.medications,
      page: () => const Medications(),
    ),
      GetPage(
      name: AppRoutes.medicationDetails,
      page: () => const MedicationDetails(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => const Setting(),
    ),
    GetPage(
      name: AppRoutes.premium,
      page: () => const Premium(),
    ),
      GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationScreen(),
    ),
     GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfile(),
    ),


     GetPage(
      name: AppRoutes.providerView,
      page: () => const ProviderView(),
    ),
     GetPage(
      name: AppRoutes.addPersonalHistory,
      page: () => const AddPersonalHistory(),
    ),
    GetPage(
      name: AppRoutes.addFamilyHistory,
      page: () => const AddFamilyHistory(),
    ),
    //  GetPage(
    //   name: AppRoutes.editProfile,
    //   page: () => const EditProfile(),
    // ),
    //  GetPage(
    //   name: AppRoutes.editProfile,
    //   page: () => const EditProfile(),
    // ),
  ];
}
