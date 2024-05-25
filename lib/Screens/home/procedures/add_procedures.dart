import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/Screens/widget/comment_ui.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/controllers/profile_controller.dart';
import 'package:my_health_journal/models/auth/profile_model.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class AddProcedures extends StatefulWidget {
  const AddProcedures({super.key});

  @override
  State<AddProcedures> createState() => _AddProceduresState();
}

class _AddProceduresState extends State<AddProcedures> {
  DateTime date = DateTime.now();
  String? todayDate;
  final profile = Get.put(ProfileContorller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   todayDate =  DateFormat('EEE, dd MMMM yyyy').format(date);

   setState(() {
     
   });

  }
 final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      resizeToAvoidBottomInset: false,    
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
                    child: Form(
                      key: ctrl.proceduresForm,
                      child: ListView(
                        children: [
                       addHeight(30),
                        AppBar1(title: "Procedures"),
                        addHeight(20),
                        CustomTextField(
                          
                          labelText:  "Procedure Type",
                          controller: ctrl.proceduresType,
                            validator: (val){
                                    if(val!.isEmpty){
                                          return "Procedure Type is Required*";
                    }                    
                                        return null;
                                    },
                      
                        ),
                        addHeight(20),
                        CustomTextField(
                          labelText:  "Provider",
                            controller: ctrl.proceduresProvider,
                            validator: (val){
                                    if(val!.isEmpty){
                                          return "Provider Type is Required*";
                    }                    
                                        return null;
                                    },
                          
                        ),
                         addHeight(20),
                           
                        CustomTextField(
                          labelText:  "Date of Procedure",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(AppAssets.calendarIcon),
                          ),
                           controller: ctrl.proceduresDate,
                            validator: (val){
                                    if(val!.isEmpty){
                                          return "Provider Date is Required*";
      }                    
                                        return null;
                                    },
                                      
                                    
                          
                          
                        ),
                         addHeight(20),                                                                     
                        Container(                 
                                        // height: 170.h,
                        child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                             decoration: BoxDecoration(
                              // color: AppColors.whiteColor,
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                            
                                            color: AppColors.blackColor2
                                          )
                                          ),
                            child: Padding(
                                            padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 8.h
                                            ),
                              child: Column(
                                children: [
                                   TextField( 
                                    controller: controller.proceduresComment,                       
                                    maxLines: 5,
                                    decoration: const InputDecoration(
                                      hintText: "Add New Comments",
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
                              addRegularTxt("${todayDate ?? ""}", color: AppColors.orangeColor3, fontSize: 13.sp), 
                              addWidth(10),                           
                                                  ],
                                                ),
                                              ),                                      
                                      ), 
                                      addWidth(10),
                                      CustomButton(text: "Save", onPressed: (){
                                        controller.procedurescommitList.add(CommentData(
                                            title : controller.proceduresComment.text.trim(),
                                          time : todayDate!,
                                          user : profile.profileData.data
                                        ));
                                        // controller.procedurescommitList.add({
                                        //   'title': controller.proceduresComment.text.trim(),
                                        //   'time': todayDate!,
                                        //   'user' : profile.profileData.data
                                        // });
                                        controller.proceduresComment.clear();
                                        controller.update();
                                      }, height: 25, fontSize: 14.sp, width: 90.h,)
                                    ],
                                  )
                      
                                ],
                              ),
                            ),
                          ),
                        ),
                        //  Positioned(
                        //     top: -4,
                        //     left: 14,
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //         color: AppColors.whiteColor.withOpacity(0.8)
                        //       ),
                        //       child: Padding(
                        //         padding: const EdgeInsets.symmetric(horizontal: 6),
                        //         child: addRegularTxt("Add New Comments", color: AppColors.blackColor2, fontSize: 13.sp),
                        //       ),
                        //     ),
                        //   )
                        
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
                        //  color: AppColors.whiteColor,
                         borderRadius: BorderRadius.circular(20)
                          ),
                          
                          height: 100.h,
                          // width: 120.h,
                          child: Center(
                            child: ctrl.proceduresDocPath == "" ?  Column(
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
                                image: DecorationImage(image: FileImage(File(ctrl.proceduresDocPath)), fit: BoxFit.fill)
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
                          text: "Save and Share", onPressed: (){
                            if(controller.proceduresForm.currentState!.validate()){
                              
                            }
                          }),
                          addHeight(20),
                          if(controller.procedurescommitList.isNotEmpty)
                          Row(
                            children: [
                              addHeadingTxtMedium("History:", fontSize: 16, fontFamily: "Montserrat-medium")
                            ],
                          ),
                          if(controller.procedurescommitList.isNotEmpty)
                          ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: List.generate(controller.procedurescommitList.length, (index) => CommentUi(comment: controller.procedurescommitList[index]) ),
                          )
                      
                        ]),
                    )));
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
                                                 
                                                  controller.proceduresDocPath = res.path;
                                                
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
                                              controller.proceduresDocPath = res.path;
                                                
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