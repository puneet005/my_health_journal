
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
   final controller = Get.find<BottomBarController>();

  //  String token = getValue(LocalStorage.TOKEN);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(builder: (controller) {
      // if()
      return Stack(
       
        children: [
            Container(
              
         width: double.infinity,
                height: Get.height,
                   decoration: BoxDecoration(  
                    color: AppColors.bgColor,          
              image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
              fit: BoxFit.fill
              )
            ),),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: controller.widgetOptions.elementAt(controller.selectedIndex),
            bottomNavigationBar: Container(

              // width: Get.width - 40,
              height: Get.height / 10,
              color: Colors.transparent,
              child: Center(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 14.sp, vertical: 4.h),
                  child: Container(
                    height: Get.height, 
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.sp),
                        color: AppColors.bottomNavColor),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.selectedIndex = 0;
                              controller.update();
                            },
                            child: 
                            // controller.selectedIndex == 0
                            //     ? IntrinsicHeight(
                            //         child: Row(
                            //           children: [
                            //             SvgPicture.asset(
                            //               AppAssets.bottomNav0, height: 28.sp,
                                          
                            //               width: 28.sp,
                            //               // color: AppColors,
                            //             ),
                                       
                            //           ],
                            //         ),
                            //       )
                                // : 
                                SvgPicture.asset(
                                    AppAssets.bottomNav0, height: 28.sp,
                                     color: controller.selectedIndex == 0 ? AppColors.whiteColor :   AppColors.whiteColor.withOpacity(0.6),
                                    width: 28.sp,
                                    // color: AppColors,
                                  ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.selectedIndex = 1;
                              controller.update();
                            },

                            child: 
                             SvgPicture.asset(
                                          AppAssets.bottomNav4, height: 28.sp,
                                          color: controller.selectedIndex == 1 ? AppColors.whiteColor :   AppColors.whiteColor.withOpacity(0.6),
                                          width: 28.sp,
                                          // color: AppColors,
                                        ),
                            // controller.selectedIndex == 1
                                // ? IntrinsicHeight(
                                //     child: Row(
                                //       children: [
                                //         SvgPicture.asset(
                                //           AppAssets.bottomNav4, height: 28.sp,
                                //           color: controller.selectedIndex == 1 ? AppColors.whiteColor :   AppColors.whiteColor.withOpacity(0.6),
                                //           width: 28.sp,
                                //           // color: AppColors,
                                //         ),
                                       
                                //       ],
                                //     ),
                                //   )
                                // : SvgPicture.asset(
                                //     AppAssets.bottomNav1, height: 28.sp, width: 28.sp,
                                //     // color: AppColors,
                                //   ),
                          ),
                          InkWell(
                            onTap: () {
                              // if(controller.selectedIndex != 2){
                              //   final yourItemController = Get.find<YourItemsController>();
                              //   yourItemController.selectedTabIndex = 0;
                              //   yourItemController.controller.animateTo(0);
                              // }
                              controller.selectedIndex = 2;
                              controller.update();
                            },
                            child:  SvgPicture.asset(
                                          AppAssets.bottomNav3, height: 28.sp,
                                           color: controller.selectedIndex == 2 ? AppColors.whiteColor :   AppColors.whiteColor.withOpacity(0.6),
                                          width: 28.sp,
                                          // color: AppColors,
                                        ),
                            // controller.selectedIndex == 2
                            //     ? IntrinsicHeight(
                            //         child: Row(
                            //           children: [
                            //             SvgPicture.asset(
                            //               AppAssets.bottomNav3, height: 28.sp,
                            //                color: controller.selectedIndex == 2 ? AppColors.whiteColor :   AppColors.whiteColor.withOpacity(0.6),
                            //               width: 28.sp,
                            //               // color: AppColors,
                            //             ),
                                       
                                        
                            //           ],
                            //         ),
                            //       )
                            //     : SvgPicture.asset(
                            //         AppAssets.bottomNav3, height: 28.sp,
                            //         width: 28.sp,
                            //         // color: AppColors,
                            //       ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.selectedIndex = 3;
                              controller.update();
                            },
                            child: 
                             SvgPicture.asset(
                                          AppAssets.bottomNav2, height: 28.sp,
                                          width: 28.sp,
                                          color: controller.selectedIndex == 3 ? AppColors.whiteColor :   AppColors.whiteColor.withOpacity(0.6),
                                          // color: AppColors,
                                        ),    
                            // controller.selectedIndex == 3
                            //     ? IntrinsicHeight(
                            //         child: Row(
                            //           children: [
                            //             SvgPicture.asset(
                            //               AppAssets.bottomNav2, height: 28.sp,
                            //               width: 28.sp,
                            //               // color: AppColors,
                            //             ),                                
                            //             // VerticalDivider(
                            //             //   // indent: 2,
                            //             //   // endIndent: 1,
                            //             //   // thickness: 0.9,
                            //             //   width: 5,
                            //             //   color: AppColors.whiteColor,
                            //             // )
                            //           ],
                            //         ),
                            //       )
                            //     : SvgPicture.asset(
                            //         AppAssets.bottomNav2, height: 28.sp, width: 28.sp,
                            //         // color: AppColors,
                            //       )
                          )
                        ]
                      )
                    )
                  ),
                )
              )
            ).paddingOnly(bottom: 10.h)
          ),
        ],
      );
    });
  }
}