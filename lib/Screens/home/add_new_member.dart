import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_health_journal/Screens/home/appointmant/add_doctors_visit.dart';
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
      resizeToAvoidBottomInset: false,    
      body:  GetBuilder<HomeController>(
        // init: MyController(),
        // initState: (_) {},
        builder: (ctrl) {
          return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
                fit: BoxFit.fill
                )
              ),
              child:   Form(
                key: ctrl.memberForm,
                child: ListView(
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
                              child: SvgPicture.asset(AppAssets.notificationIcon)),],
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
                  controller: ctrl.memberName,
                  labelText: "Name",
                  validator: (val){
                    if(val!.isEmpty){
                      return "Name is Required*";
                    }
                    else if (val.length < 2){
                      return "Please enter valid name*";
                    }
                    return null;
                  },
                ),
                            ),
                            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  readOnly: true,
                  onTap: () async {
                  await showCupertinoModalPopup<void>(
                    context: context,
                    builder: (_) {
                      final size = MediaQuery.of(context).size;
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        height: size.height * 0.40,
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 0.28,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                // maximumYear: 1900,
                                initialDateTime: DateTime.now().subtract(Duration(days: 1)),
                                maximumDate: DateTime.now(),
                                 minuteInterval: 1,
                                 minimumYear: 1900,
                                 maximumYear: DateTime.now().year,
                                onDateTimeChanged: (value) {
                                  ctrl.memberDOB.text = DateFormat('dd/MM/yyyy').format(value);
                                  ctrl.update();
                                  
                                },
                              ),
                            ),
                            Padding(
                   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child:   CustomButton(
                    height: 50,
                    width: Get.width /1.1,
                    text: "Save", onPressed: (){
                          Navigator.pop(context);
                    }),
                ),
                
                          ],
                        ),                      
                      );
                    },
                  );
                    // _Calendarpop(context);
                  },
                  labelText: "DOB",
                  controller: ctrl.memberDOB,
                  validator: (val){
                    if(val!.isEmpty){
                      return "DOB is Required*";
                    }
                    // else if (val.length < 2){
                    //   return "Please enter valid name*";
                    // }
                    return null;
                  },
                  suffixIcon: Padding(
                        padding:  EdgeInsets.all(12.0.sp),
                        child: SvgPicture.asset(AppAssets.bottomNav3, color: AppColors.orangeColor,height: 20,),
                      ),
                ),
                            ), Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  labelText: "Relation",
                  controller: ctrl.memberRaletion,
                  validator: (val){
                  if(val!.isEmpty){
                      return "Relation is Required*";
                    }
                    else if (val.length < 2){
                      return "Please enter valid Relation*";
                    }
                    return null;
                  },

                ),
                            ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  controller: ctrl.memberHealthInfo,
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
                            //       color: AppColors.whiteColor,
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
                  //  color: AppColors.whiteColor,
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
                    text: "Continue", onPressed: (){
                      if(ctrl.memberForm.currentState!.validate()){
                        ctrl.AddNewMemberApi();
                      }
                    }),
                ),
                addHeight(10),
                  ]),
              ));}),
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
