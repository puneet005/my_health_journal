import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';
class AddSymptoms extends StatefulWidget {
  const AddSymptoms({super.key});

  @override
  State<AddSymptoms> createState() => _AddSymptomsState();
}

class _AddSymptomsState extends State<AddSymptoms> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body:  GetBuilder<HomeController>(
        // init: MyController(),
        // initState: (_) {},
        builder: (ctrl) {
          return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                
                image: DecorationImage(image: AssetImage(AppAssets.bgImg),
                fit: BoxFit.fill
                )
              ),
              child:   ListView(
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  addHeight(30),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.sp,),
                    child: InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.bottomNav);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: SvgPicture.asset(AppAssets.backArrowIcon)),
                          addHeadingTxtMedium("Symptoms", fontSize: 15.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-medium" ),
                          InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: SvgPicture.asset(AppAssets.notificationIcon)),
                                     ],
                                  ),
                    ),
            ),
            addHeight(20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(                 
                  // height: 170.h,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                           decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          
                                          color: AppColors.dotBorderColor
                                        )
                                        ),
                          child: Padding(
                                          padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 8.h
                                          ),
                            child: Column(
                              children: [
                                const TextField(                              
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    border: InputBorder.none
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                       decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                              border: Border.all(
                                                color: AppColors.orangeColor3
                                              )
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                            addWidth(10),
                            SvgPicture.asset(AppAssets.bottomNav3, color: AppColors.orangeColor3, height: 14.h,),
                            addWidth(10),
                            addRegularTxt("Wed, 10 April 2024", color: AppColors.orangeColor3, fontSize: 13.sp), 
                            addWidth(10),
                            addBoldTxt("|",color:  AppColors.blackColor2),
                            addWidth(10),
                            Icon(Icons.access_time, color: AppColors.orangeColor3,
                                        
                            size: 16.h,)
                            ,addWidth(10),
                            addRegularTxt("04:00 PM", color: AppColors.orangeColor3, fontSize: 13.sp), 
                            addWidth(10),
                                                ],
                                              ),
                                            ),
                                      
                                    )
                                  ],
                                )
                                            
                              ],
                            ),
                          ),
                        ),
                      ),
                       Positioned(
                          top: -4,
                          left: 14,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor.withOpacity(0.8)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: addRegularTxt("Add New Comments", color: AppColors.blackColor2, fontSize: 13.sp),
                            ),
                          ),
                        )
                      
                    ],
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 14.h,
                  vertical: 8

                ),
                child: Row(
                  children: [
                    addBoldTxt("Add Photo:", fontSize: 16.sp),
                  ],
                ),
              ),
                Padding(
   padding: const EdgeInsets.all(8.0),
   child: InkWell(
    onTap: (){
        _addPictureSheet(context);
    },
     child: DottedBorder(
        color: AppColors.dotBorderColor,
        strokeWidth: 1,
        dashPattern: [3,5],
        borderType: BorderType.RRect,
        radius: Radius.circular(20),
                      // width: 120.h,
                      // height: 90.h,
                      child: Container(
                        decoration: BoxDecoration(
   color: AppColors.whiteColor,
   borderRadius: BorderRadius.circular(20)
                        ),
                        
                        height: 100.h,
                        // width: 120.h,
                        child: Center(
                          child: ctrl.symptomDocPath == "" ?  Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               SvgPicture.asset(AppAssets.uploadIcon),
                               addHeight(10),
                               addHeadingTxtMedium("Upload Photo/Documents", fontSize: 12.sp,  color: AppColors.greyColor2, fontFamily: "Montserrat-medium" ),
                        
                            ],
                          ): Container(
                            decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(image: FileImage(File(ctrl.symptomDocPath)), fit: BoxFit.fill)
                            ),
                          ),
                        ),
                      ),
                    ),
   ),
 ),
 addHeight(20),
 Padding(
   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  child:   CustomButton(
    height: 50,
    width: Get.width / 2,
    text: "Continue", onPressed: (){}),
),
//  addHeight(10),
 Padding(
   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  child:   CustomButton(
    btnColor: AppColors.orangeColor,
    height: 50,
    width: Get.width / 2,
    text: "Save and Share", onPressed: (){}),
),
addHeight(20),
                ]));})
            );
  }

  _addPictureSheet(BuildContext context ) {
  String? imgPath;
   final controller = Get.find<HomeController>();
   showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title:  Text('Add Picture'.tr, style: TextStyle(
          fontWeight: FontWeight.w700,
        ),),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel'.tr,
            // style: HeadingCustom(color: Colors.blue),
          ),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.of(context).pop();
              final res = await controller.getImage();
              if(res != null){
              // imgPath = res.path;
                                                // controller.memberImgPath  = res.path;
                                                 
                                                  controller.symptomDocPath = res.path;
                                                
                                                controller.update();                                                
              }             
            },
            child: addBoldTxt(
              'Choose Form Gallery'.tr,
              fontSize: 18
              // style: HeadingCustom(color: Colors.blue),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.of(context).pop();
               final res = await controller.getImageToCamera();
                                              if(res != null){
                                              controller.symptomDocPath = res.path;
                                                
                                                controller.update();                                                  
                                              }        
            },
            child: addBoldTxt('Take a Picture'.tr,
            fontSize: 18
                // style: HeadingCustom(color: Colors.blue)
                ),
          ),
        ],
      ),
    );

    return  imgPath ?? "";
  }
}