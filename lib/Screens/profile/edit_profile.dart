import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/common-widgets/custom_bottom_navigation3.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/profile_controller.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  State<EditProfile> createState() => _EditProfileState();
}
class _EditProfileState extends State<EditProfile> {
  final controller = Get.find<ProfileContorller>();
@override
void initState() {
  super.initState();
  Future.delayed(Duration.zero, (){
  controller.fNameCtrl.text = controller.profileData.data!.name!;
  controller.update();
});
}
  @override
  Widget build(BuildContext context) {
      return Stack(
       
        children: [
            Container(              
         width: double.infinity,
                height: Get.height,
                   decoration: const BoxDecoration(  
                    color: AppColors.bgColor,          
              image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
              fit: BoxFit.fill
              )
            ),),
          Scaffold(
            backgroundColor: Colors.transparent,
          body:   GetBuilder<ProfileContorller>(       
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
                        child: Form(
                          key: controller.editProfileKey,
                          child: ListView(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: SvgPicture.asset(AppAssets.backArrowIcon)),
                                addHeadingTxtMedium("Edit Profile", fontSize: 15.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-medium" ),
                                SizedBox(width: 45.h,)
                                            
                                  ],
                                        ),
                          ),
                                    ),
                            addHeight(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Container(
                                width: Get.width /1.5,
                                height: Get.height / 3,
                                child: InkWell(
                                  onTap: (){
                                      _addPictureSheet(context);
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      controller.userImgPath != "" ?  Container(
                                        height: Get.height,
                                        width: Get.width / 1.7,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          // color: AppColors.blueColor,
                                          image: DecorationImage(image: FileImage(File(controller.userImgPath)), 
                                          fit: BoxFit.fill
                                          )
                                        )
                                      ): 
                                      Container(
                                        height: Get.height,
                                        width: Get.width / 1.7,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          // color: AppColors.blueColor,
                                          image: DecorationImage(image: controller.profileData.data!.profile == null ?  AssetImage(AppAssets.profileIcon) : NetworkImage("${ApiUrls.domain}${controller.profileData.data!.profile!}") as ImageProvider, 
                                          // image: DecorationImage(image: controller.profileData.data!.profile == null ?  AssetImage(AppAssets.profileIcon) : NetworkImage(controller.profileData.data!.profile!) as ImageProvider, 
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
                                          child:  Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.add, color: AppColors.whiteColor, size: 28.sp,),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],),
                            addHeight(20),
                             CustomTextField(
                                  controller: controller.fNameCtrl,                                       
                                  labelText: "Name",
                                  
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "Name is Requried*";
                                    }
                                    else if(value.length < 2){
                                       return "Enter valid name*";
                                    }
                                    return null;
                                  },                                                
                                ),
                              addHeight(40),
          
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomButton(
                                  height: 50.h,
                                  // width:  Get.width,
                                  text: "Save", onPressed: (){
                                  if(controller.editProfileKey.currentState!.validate()){
                                    controller.editProfileApi();
                                  }
                                }),
                              ),
                               addHeight(20),
                                Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomButton(
                                  btnColor: Colors.red,
                                  height: 50.h,
                                  // width:  Get.width,
                                  text: "Delete Account", onPressed: () async {
                                  // if(controller.editProfileKey.currentState!.validate()){
          
                                    // 
                                  // }
                                  // Dialog
                                   await showDialog(            
                context: context,            
                builder: (_) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: EdgeInsets.symmetric(
                      horizontal: 14.h
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10.h)
                      ),
                      height: Get.height/3,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              Container(
                                 decoration: BoxDecoration(
                          color: AppColors.appColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.h),
                          topRight: Radius.circular(10.h),
                        )
                      ),
                                height: 60,
                             
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  addBoldTxt('Delete Account', 
          
                                      
                                  color: AppColors.whiteColor,
                                  fontSize: 16,
          
                                  fontWeight: FontWeight.w600
                                  )
                                ],
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(
                                  horizontal: 20.h
                                ),
                                child: Container(
                                  //  height: Get.height/,
                                  //  color: Colors.amber,
                                   child: Center(
                                    child: addRegularTxt(
                                        'Are you sure you want to delete your account', textAlign: TextAlign.center, color: AppColors.blackColor1), 
                                   )
                                ),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomButton(
                                    width: Get.width / 4,
                                    btnColor: Colors.red,
                                    onPressed: (){
                                    
                                     Navigator.pop(_);
          
                                  }, text:  'No',  radius: 40, fontSize: 14,),
                                  CustomButton(
                                   width: Get.width / 4,
          
                                    text:                              
                                 'Yes', onPressed: (){
                                     Navigator.pop(_);
                                     Future.delayed(Duration.zero, (){
                                      controller.deleteUserAccountApi();                                                                    
                                     });
                                    //  Get.offAll(const TripCreatingDone());
                                    //  ConfirmPopUp(context);                                                                                                                                       
                                  }, radius: 40, fontSize: 14,),
                                  
                                ],
                              ),
                              SizedBox(height: 5,),
                          ],
                        ),
                      ),
                    ));
                }
              );
                                }),
                              ),
                              
                        
                            ]),
                        )));
                          }
                          )
                          ,bottomNavigationBar: const NavBar2(),),
        ],
      );
                      
                    
  }


   _addPictureSheet(BuildContext context ) {
  String? imgPath;
   final controller = Get.find<ProfileContorller>();
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
                                                 
                                                  controller.userImgPath = res.path;
                                                
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
                                              controller.userImgPath = res.path;                                                
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