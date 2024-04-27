import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class AddMedications extends StatefulWidget {
  const AddMedications({super.key});

  @override
  State<AddMedications> createState() => _AddMedicationsState();
}

class _AddMedicationsState extends State<AddMedications> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body:   GetBuilder<HomeController>(
        // init: MyController(),
        // initState: (_) {},
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
                    padding:  EdgeInsets.symmetric(
                      horizontal: 12.h,
                      vertical: 8.h
                    ),
                    child: ListView(
                      children: [
                     addHeight(30),
                      AppBar1(title: "Add New Medication"),
                      addHeight(20),
                      CustomTextField(
                        labelText:  "Name",

                      ),
                      addHeight(20),
                      CustomTextField(
                        labelText:  "Dosage",
                        
                      ),
                       addHeight(20),
                       Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Container(
                              child: Row(children: [
                                InkWell(
                                  onTap: (){
                                    log("Log");
                                    
                                     controller.medicationType = "Prescription";
                                    controller.update();
                                    log(controller.medicationType);
                                  },
                                  child:controller.medicationType == 'Prescription' ? SvgPicture.asset( AppAssets.circleBoxIcon):  SvgPicture.asset( AppAssets.circleBoxFilledIcon)),
                                addWidth(10),
                                addHeadingTxtMedium("Prescription",fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                              ]),
                            ),
                          ),
                          addWidth(20),
                           Container(
                            child: Row(children: [
                              InkWell(
                                onTap: (){
                                 controller.medicationType = "Over the Counter";
                                    controller.update();
                                     log(controller.medicationType);
                                },
                                child: controller.medicationType == "Over the Counter" ? SvgPicture.asset( AppAssets.circleBoxIcon):  SvgPicture.asset( AppAssets.circleBoxFilledIcon) ),
                              addWidth(10),
                              addHeadingTxtMedium("Over the Counter", fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                            ]),
                          ),
                        
                      
                        ],
                       ),
                         addHeight(20),
                          Row(
                            children: [
                              addRegularTxt("Administration Options:", fontSize: 12, color: AppColors.greyColor4)
                            ],
                          ),
                          addHeight(20),
                           Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Container(
                              child: Row(children: [
                                InkWell(
                                  onTap: (){
                                    log("Log");
                                    
                                     controller.medicationTime = "AM";
                                    controller.update();
                                  
                                  },
                                  child:controller.medicationTime == 'AM' ?  SvgPicture.asset( AppAssets.checkboxFilledIcon):  SvgPicture.asset( AppAssets.checkboxIcon)),
                                addWidth(10),
                                addHeadingTxtMedium("AM",fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                              ]),
                            ),
                          ),
                          addWidth(20),
                           Container(
                            child: Row(children: [
                              InkWell(
                                onTap: (){
                                 controller.medicationTime = "PM";
                                    controller.update();
                                    //  log(controller.medicationType);
                                },
                                child: controller.medicationTime == "PM" ? SvgPicture.asset( AppAssets.checkboxFilledIcon):  SvgPicture.asset( AppAssets.checkboxIcon) ),
                              addWidth(10),
                              addHeadingTxtMedium("PM", fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                            ]),
                          ),
                          addWidth(20),
                           Container(
                            child: Row(children: [
                              InkWell(
                                onTap: (){
                                 controller.medicationTime = "As Needed";
                                    controller.update();
                                    //  log(controller.medicationType);
                                },
                                child: controller.medicationTime == "As Needed" ? SvgPicture.asset( AppAssets.checkboxFilledIcon):  SvgPicture.asset( AppAssets.checkboxIcon) ),
                              addWidth(10),
                              addHeadingTxtMedium("As Needed", fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                            ]),
                          ),
                          
                        
                      
                        ],
                       ),
                         addHeight(20),
                      CustomTextField(
                        labelText:  "Custom",
                        
                      ),
                         addHeight(20),
                      CustomTextField(
                        labelText:  "Date and Time",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(AppAssets.calendarIcon),
                        ),
                        
                      ),
                      addHeight(20),
                      Row(children: [
                         InkWell(
                                onTap: (){
                                 controller.medicationNotify = !controller.medicationNotify;
                                    controller.update();
                                    //  log(controller.medicationType);
                                },
                                child: controller.medicationNotify ? SvgPicture.asset( AppAssets.checkboxFilledIcon):  SvgPicture.asset( AppAssets.checkboxIcon) ),
                                addWidth(10),
                        addHeadingTxtMedium("Notify for this Medication", fontFamily: "Montserrat", color: AppColors.blackColor, fontSize: 13, fontWeight: FontWeight.bold)
                      ],),

 addHeight(20),
                      Container(                 
                  // height: 170.h,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                           decoration: BoxDecoration(
                            color: AppColors.whiteColor,
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
                addHeight(20),
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
                              image: DecorationImage(image: FileImage(File(ctrl.medicationDocPath)), fit: BoxFit.fill)
                            ),
                          ),
                        ),
                      ),
                    ),
   ),
 ),
 addHeight(20),
 CustomButton(
    height: 50,
    width: Get.width / 2,
    text: "Save", onPressed: (){}),
    addHeight(40),

                      ])));
                      })
      
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
                                                 
                                                  controller.medicationDocPath = res.path;
                                                
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