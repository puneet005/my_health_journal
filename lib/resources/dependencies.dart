import 'package:get/get.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/controllers/calendar_controller.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/controllers/login_controller.dart';
import 'package:my_health_journal/controllers/medical_summary_controller.dart';
import 'package:my_health_journal/controllers/profile_controller.dart';
import 'package:my_health_journal/controllers/signUp_controller.dart';
import 'package:my_health_journal/controllers/splash_controller.dart';



Future<void> init() async{
  Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
  Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
  // Get.lazyPut<PayRollFlowChartController>(() => PayRollFlowChartController(), fenix: true);
  Get.lazyPut<BottomBarController>(() => BottomBarController(), fenix: true);
  Get.put(HomeController());
  Get.put(MedicalSummaryController());
  Get.put(CalendarContorller()); 
  Get.put(ProfileContorller());
  // Get.put(CartController());
  // Get.lazyPut<DiscoverController>(() => DiscoverController(), fenix: true);
  // // Get.lazyPut<CartController>(() => CartController(), fenix: true);
  // Get.put(CategoryController());
  // Get.lazyPut<WebViewStackController>(() => WebViewStackController(), fenix: true);  
  // Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);

  // Get.lazyPut<ChooseCategoryController>(() => ChooseCategoryController(), fenix: true);
  // Get.lazyPut<RecruitingController>(() => RecruitingController(), fenix: true);
  // Get.lazyPut<YourItemsController>(() => YourItemsController(), fenix: true);
  
}
