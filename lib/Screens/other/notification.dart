import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/controllers/profile_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
// import 'package:my_health_journal/routers/app_routers.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body:   GetBuilder<ProfileContorller>(
        // init: MyController(),
        initState: (_) {},
        builder: (ctrl) {
          return Container(                    
               width: double.infinity,
                      height: Get.height,
                         decoration: const BoxDecoration(  
                          color: AppColors.bgColor,          
                    image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
                    fit: BoxFit.fill
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      // shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      children: [
                     addHeight(10),
                    Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.sp,),
                    child: InkWell(
                      onTap: (){
                        Get.back();
                        // Get.toNamed(AppRoutes.bottomNav);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // InkWell(
                          //   onTap: (){
                          //     Get.back();
                          //   },
                          //   child: SvgPicture.asset(AppAssets.backArrowIcon)),
                            addHeadingTxtMedium("Notifications", fontSize: 15.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-medium" ),                                                 
                            // addWidth(40),
                            ],
                                  ),
                    ),
            ),
                      addHeight(20),
                      ListView(
                        shrinkWrap: true,
                         physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(10, (index) => NotificationCard()),
                      )
                      ])));}));
  }

  Widget NotificationCard(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                // width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.appColor2
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(AppAssets.notification, fit: BoxFit.cover,),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addRegularTxt("It is a long established fact that a reader will be distracted by the readable.", fontSize: 12,),
                  addHeight(5),
                  addRegularTxt("2 hours ago", color: AppColors.greyColor5, fontSize: 10)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}