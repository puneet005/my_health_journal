import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/routers/app_routers.dart';

class NavBar2 extends StatefulWidget {
  const NavBar2({super.key});

  @override
  State<NavBar2> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar2> {
  final controller = Get.find<BottomBarController>();

  //  String token = getValue(LocalStorage.TOKEN);
  @override
  Widget build(BuildContext context) {
    return Container(

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
                              Future.delayed(Duration.zero, (){
                                Get.offAllNamed(AppRoutes.bottomNav);
                              });
                            },
                            child: 
                          
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
                               Future.delayed(Duration.zero, (){
                                Get.offAllNamed(AppRoutes.bottomNav);
                              });
                            },

                            child: 
                             SvgPicture.asset(
                                          AppAssets.settingIcon, height: 28.sp,
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
                               Future.delayed(Duration.zero, (){
                                Get.offAllNamed(AppRoutes.bottomNav);
                              });
                            },
                            child:  SvgPicture.asset(
                                          AppAssets.bottomNav3, height: 28.sp,
                                           color: controller.selectedIndex == 2 ? AppColors.whiteColor :   AppColors.whiteColor.withOpacity(0.6),
                                          width: 28.sp,
                                          // color: AppColors,
                                        ),                         
                          ),
                          InkWell(
                            onTap: () {
                              controller.selectedIndex = 3;
                              controller.update();
                               Future.delayed(Duration.zero, (){
                                Get.offAllNamed(AppRoutes.bottomNav);
                              });
                            },
                            child: 
                             SvgPicture.asset(
                                          AppAssets.notificationWithoutBG, height: 28.sp,
                                          width: 28.sp,
                                          color: controller.selectedIndex == 3 ? AppColors.whiteColor :   AppColors.whiteColor.withOpacity(0.6),
                                          // color: AppColors,
                                        ),    
                         
                          ),
                           InkWell(
                            onTap: () {
                               controller.selectedIndex = 4;
                              controller.update();
                               Future.delayed(Duration.zero, (){
                                Get.offAllNamed(AppRoutes.bottomNav);
                              });
                              // controller.selectedIndex = 4;
                              // controller.update();
                            },
                            child: 
                          
                                SvgPicture.asset(
                                    AppAssets.bottomNav4, height: 28.sp,
                                     color: controller.selectedIndex == 4 ? AppColors.whiteColor :   AppColors.whiteColor.withOpacity(0.6),
                                    width: 28.sp,
                                    // color: AppColors,
                                  ),
                          ),
                        ]
                      )
                    )
                  ),
                )
              )
            ).paddingOnly(bottom: 10.h);
    // });
  }
}