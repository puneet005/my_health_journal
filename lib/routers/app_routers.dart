
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/home/add_doctors_visit.dart';
import 'package:my_health_journal/Screens/home/add_medications.dart';
import 'package:my_health_journal/Screens/home/add_new_member.dart';
import 'package:my_health_journal/Screens/home/add_procedures.dart';
import 'package:my_health_journal/Screens/home/add_symptoms.dart';
import 'package:my_health_journal/Screens/home/patient_details.dart';
import 'package:my_health_journal/Screens/home/share_screen.dart';
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
  
  // static String paymentSuccessScreen = '/paymentSuccessScreen';
  // static String helpDeskScreen = '/helpDeskScreen';
  // static String detailScreen = '/DetailScreen';
  // static String planDetailsScreen = '/PlanDetailsScreen';
  // static String cmsPagesScreen = '/CMSPagesScreen';
  // static String subCategoryListScreen = '/SubCategoryListScreen';
  // static String webViewScreen = '/WebViewScreen';


  


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
    // GetPage(
    //   name: AppRoutes.subscriptionScreen,
    //   page: () => const SubscriptionScreen(),
    // ),
    // GetPage(
    //   name: AppRoutes.cmsPagesScreen,
    //   page: () => const CMSPagesScreen(),
    // ),
    // GetPage(
    //   name: AppRoutes.subCategoryListScreen,
    //   page: () => const SubCategoryListScreen(),
    // ),
    // GetPage(
    //   name: AppRoutes.helpDeskScreen,
    //   page: () => const HelpDeskScreen(),
    // ),
    // GetPage(
    //   name: AppRoutes.detailScreen,
    //   page: () => const DetailScreen(),
    // ),
    //   GetPage(
    //   name: AppRoutes.planDetailsScreen,
    //   page: () => const PlanDetailsScreen(),
    // ),
    // GetPage(
    //   name: AppRoutes.webViewScreen,
    //   page: () => const WebViewScreen(),
    // ),
  ];
}
