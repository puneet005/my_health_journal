import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';
class AddNewMember extends StatefulWidget {
  const AddNewMember({super.key});

  @override
  State<AddNewMember> createState() => _AddNewMemberState();
}

class _AddNewMemberState extends State<AddNewMember> {
  
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
                image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
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
                          addHeadingTxtMedium("Add New Family Member", fontSize: 15.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-medium" ),
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
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
              DottedBorder(
    color: AppColors.dotBorderColor,
    strokeWidth: 1,
    dashPattern: [3,5],
    borderType: BorderType.RRect,
    radius: Radius.circular(20),
                  // width: 120.h,
                  // height: 90.h,
                  child:  InkWell(
                    onTap: () async{
                      _addPictureSheet(context, 1);
                      // ctrl.memberImgPath = await _addPictureSheet(context);                        
                      // ctrl.update();
                      // log(ctrl.memberImgPath);
                    },
                    child: SizedBox(
                      height: 120.h,
                      width: 120.h,
                      child: Center(
                        child: ctrl.memberImgPath == "" ? SvgPicture.asset(AppAssets.addImgIcon): Image.file(File(ctrl.memberImgPath.toString()), fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                )
              ],
             ).paddingOnly(bottom: 10.h),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 addRegularTxt("Upload Family Member Image", color: AppColors.greyColor1),
               ],
             ).paddingOnly(bottom: 10.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                labelText: "Name",
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                labelText: "DOB",
              ),
            ), Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                labelText: "Relation",
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                labelText: "Health Insurance Information",
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: InkWell(
                onTap: (){
                    _addPictureSheet(context, 2);
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: DottedBorder(
                        color: AppColors.dotBorderColor,
                        strokeWidth: 1,
                        borderType: BorderType.RRect,
                        dashPattern: [3,5],
                        radius: Radius.circular(10),                    
                          child: SizedBox(
                            height: 50.h,
                            width: Get.width,
                            child: Center(
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 10.sp),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: ctrl.healthDocumentPath == "" ? addRegularTxt("Health Insurance documents", maxLines: 1, overflow: TextOverflow.ellipsis) : addRegularTxt(ctrl.healthDocumentPath.split("/").last, maxLines: 1, overflow: TextOverflow.ellipsis)),
                                    Spacer(),
                                    Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(AppAssets.cameraIcon)),
                                    
                                  ],
                                ),
                              ),
                            ))),
                    ),
                          // Positioned(
                          //   top: 0,
                          //   left: 8,
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       color: AppColors.whiteColor.withOpacity(0.2)
                          //     ),
                          //     child: addRegularTxt("Health Insurance documents", color: AppColors.blackColor3, fontSize: 13.sp),
                          //   ),
                          // )
                  ],
                ),
              )
            ),

 Padding(
   padding: const EdgeInsets.all(8.0),
   child: InkWell(
    onTap: (){
        _addPictureSheet(context, 3);
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
                        
                        height: 140.h,
                        // width: 120.h,
                        child: Center(
                          child: ctrl.idProofPath == "" ?  Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               SvgPicture.asset(AppAssets.idCardIcon),
                               addHeight(10),
                               addHeadingTxtMedium("Upload ID Proof", fontSize: 12.sp,  color: AppColors.greyColor1, fontFamily: "Montserrat-medium" ),
                        
                            ],
                          ): Container(
                            decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(image: FileImage(File(ctrl.idProofPath)), fit: BoxFit.fill)
                            ),
                          ),
                        ),
                      ),
                    ),
   ),
 ),

Padding(
   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  child:   CustomButton(
    height: 50,
    width: Get.width / 2,
    text: "Continue", onPressed: (){}),
),
addHeight(10)
          
                ]));}),
    );
  }  
}
String _addPictureSheet(BuildContext context, int number ) {
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
                                                 if(number == 1){
                                                 controller.memberImgPath = res.path;                                                                              
                                                }
                                                else if(number == 2){
                                                   controller.healthDocumentPath = res.path;
                                                }else{
                                                  controller.idProofPath = res.path;
                                                }  
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
                                                if(number == 1){
                                                 controller.memberImgPath = res.path;                                                                              
                                                }
                                                else if(number == 2){
                                                   controller.healthDocumentPath = res.path;
                                                }else{
                                                  controller.idProofPath = res.path;
                                                }                                                                                                       
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
