import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/profile/change_password.dart';
// import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/controllers/profile_controller.dart';
import 'package:my_health_journal/controllers/signUp_controller.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';
class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  final controller = Get.find<ProfileContorller>();
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
                      children: [
                     addHeight(10),
                    Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.sp,),
                    child: InkWell(
                      onTap: (){
                        // Get.back();
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
                          addHeadingTxtMedium("Profile", fontSize: 15.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-medium" ),
                          // SizedBox(width: 45.h,)
                  //         Container(
                  //   width: 45.h,
                  //   height: 45.h,
                  //   decoration: BoxDecoration(
                  //     color: AppColors.whiteColor,
                  //     borderRadius: BorderRadius.circular(15),
                  //     border: Border.all(
                  //       color: AppColors.blackColor3.withOpacity(0.1)
                  //     ),
                  //   ),
                  
                  //   child: InkWell(
                  //     onTap: (){
                  //       Get.toNamed(AppRoutes.setting);
                  //     },
                  //     child:const  Padding(
                  //       padding:  EdgeInsets.all(8.0),
                  //       child: Center(
                  //         child:  Icon(Icons.mode_edit_outline),
                  //       ),
                  //     ),
                  //   ),
                  //  ),                       
                            ],
                                  ),
                    ),
            ),
                      addHeight(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      if(controller.profileData.data != null )
                        SizedBox(
                          width: Get.width /2.5,
                          height: Get.height / 5,
                          child: InkWell(
                            onTap: (){
                              Get.toNamed(AppRoutes.editProfile);
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: Get.height/3.2,
                                  width: Get.width / 2.8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.appColor.withOpacity(0.4),
                                    image: DecorationImage(image: controller.profileData.data!.profile == null ?  const AssetImage(AppAssets.profileIcon) : NetworkImage("${ApiUrls.domain}${controller.profileData.data!.profile!}") as ImageProvider, 
                                    fit: BoxFit.fill
                                    )
                                  )
                                ),
                          
                                // Image.asset(AppAssets.profile, fit: BoxFit.contain,),
                                Positioned(
                                  bottom: 0,
                                  right: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.orangeColor,
                                      border: Border.all(
                                        color: AppColors.whiteColor
                                      )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(AppAssets.pencilIcon, height: 15.h,),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],),
                      addHeight(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          addBoldTxt(controller.profileData.data!.name ?? "", fontSize: 18, )
                        ],
                      ), 
                      addHeight(10),
                      if(controller.profileData.data!.prime != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          addBoldTxt("Full access subscription", fontSize: 12, color: AppColors.greyColor5)
                        ], 
                      ), 

                      addHeight(10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: Get.width / 1.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.whiteColor
                          ),
                          child:  Padding(
                            padding:  EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 14.h
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              SvgPicture.asset(AppAssets.bellIcons),
                              addWidth(20),
                              addBoldTxt("Notifications", fontSize: 15, ),
                              const Spacer(),
                              CupertinoSwitch(
                                activeColor: AppColors.appColor,
                                value: ctrl.notification, 
                                onChanged: (val){
                                 ctrl.notification = val;
                                 ctrl.SetNotificationApi(notification: val);
                                 ctrl.update();
                              })
                            ]),
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.changePassword);
                          },
                          child: Container(
                            width: Get.width / 1.2,
                             height: 60.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.whiteColor
                            ),
                            child:  Padding(
                              padding:  EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 14.h
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                SvgPicture.asset(AppAssets.lockIcon),
                                addWidth(20),
                                addBoldTxt("Change Password", fontSize: 15, ),
                                const Spacer(),
                                
                              ]),
                            ),
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Get.find<SignUpController>().signOutApi();
                          },
                          child: Container(
                            width: Get.width / 1.2,
                            height: 60.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.whiteColor
                            ),
                            child:  Padding(
                              padding:  EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 14.h
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                SvgPicture.asset(AppAssets.logoutIcon),
                                addWidth(20),
                                addBoldTxt("Logout", fontSize: 15, ),
                        
                                const Spacer(),
                                
                              ]),
                            ),
                          ),
                        ),
                      ), 

                      addHeight(20),
                      if(controller.profileData.data!.prime == null)
                      Row(
                        children: [
                          addWidth(10),
                          addBoldTxt("Premium", fontSize: 15, fontWeight: FontWeight.bold)
                        ],
                      ),
                      addHeight(10),
                      if(controller.profileData.data!.prime == null)
                      Container(
                        decoration: BoxDecoration(
                          color:  AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.orangeColor,
                            width: 2
                          )
                        ),
                        child: 
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.premium);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                addLightTxt("Upgrade to Premium, for a one time fee", fontSize: 15),
                                addHeight(8),
                                addBoldTxt("\$11.00", fontSize: 24)
                              ],
                            ),
                          ),
                        ),
                      ),

                      addHeight(20),

                      

                     
                      ])));})
                      );
  }
}