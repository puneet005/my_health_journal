
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_health_journal/controllers/splash_controller.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';

import '../resources/app_assets.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(           
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          // mainAxisAlignment:  MainAxisAlignment.end,
          children: [
                Positioned(                  
                  bottom: 0,
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height /1.4,
                    child: SvgPicture.asset(AppAssets.splashBgImg, 
                    fit: BoxFit.fill,
                  ),
                  )),
                  Positioned(
                    top: Get.height / 9,
                    child: Container(child: Column(
                      children: [
                        SvgPicture.asset(AppAssets.splashlogo),
                        addHeight(20),
                        addHeadingTxtMedium("Everything you need to \nmanage your family's health \nhistory", textAlign: TextAlign.center, color: AppColors.appColor, fontSize: 20.sp, maxLines: 3, fontFamily: 'Montserrat-bold')
                      ],
                    ))),
                    Positioned(                  
                  bottom: 70,
                  right: -Get.height/8.7,
                  child:  Image.asset(AppAssets.splashImg, height: Get.height/2.4,),
                  // child: Container(
                  //    width: Get.width,
                  //   height: Get.height /1.4,
                  //   child: SvgPicture.asset(AppAssets.splashBgImg, 
                  //   fit: BoxFit.fill,
                  //  ),
                  // )
                  ),
                Positioned(
                    bottom: Get.width/2.8,
                    left: Get.width/3.9,                   
                    child: 
                  Container(
                      width: 120.h,
                    height: Get.height/6,
                    decoration: const BoxDecoration(
                      color: AppColors.orangeColor4,
                      shape: BoxShape.circle
                    ),
                  )),
                  Positioned(
                    right: Get.width/3,
                    bottom: Get.width/3,
                    left: Get.width/4.4,
                    // bottom: -10,
                    child: 
                  InkWell(
                    onTap: (){
                      Get.offAllNamed(AppRoutes.loginScreen);
                    },
                    child: Container(
                      width: 120,
                      height: Get.height/6,
                      decoration: const BoxDecoration(
                        color: AppColors.orangeColor,
                        shape: BoxShape.circle
                      ),
                      child: Center(child: 
                  
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          addHeadingTxtMedium("Start\nNow", textAlign: TextAlign.center, fontSize: 20.sp, fontFamily: 'Montserrat-bold', color: AppColors.whiteColor),
                          addHeight(5),
                          SvgPicture.asset(AppAssets.rightArrowIcon)
                  
                        ],
                      )),
                    ),
                  )),                  
          ],
        ),
      ),
    );
  }
}