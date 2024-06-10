import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/profile_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class ChangePassword extends StatefulWidget {

  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ChangePassword> {
  final controller = Get.find<ProfileContorller>();

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      resizeToAvoidBottomInset: false,    
      // backgroundColor: AppColors.whiteColor,
      body: Container(
           width: double.infinity,
              height: Get.height,
                 decoration: const BoxDecoration(            
            image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
            fit: BoxFit.fill
            )
          ),
        child: SingleChildScrollView(
          child: GetBuilder<ProfileContorller>(builder: (loginCtrl) {
            return Container(
              height: Get.height,
              child: Form(
                key: controller.changePasswordFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [      
                     addHeight(70),
                     Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: SvgPicture.asset(AppAssets.backArrowIcon)),
                                // addHeadingTxtMedium("Edit Profile", fontSize: 15.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-medium" ),
                                SizedBox(width: 45.h,)
                                            
                                  ],
                                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppAssets.appLogo)
                          ],
                        ),
                        addHeight(90.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            addHeadingTxtMedium("Change Password ",fontSize: 28, fontWeight: FontWeight.bold, fontFamily: "Montserrat-semibold" )
                          ],
                        ),
                        // addHeight(20),
                         addHeight(20),
                             CustomTextField(
                            controller: controller.currentPasswordCtrl,
                            obscureText: controller.currentobscureText1,                          
                            labelText: "Current Password",
                            // labelStyle: TextStyle(), 
                            suffixIcon: SvgPicture.asset(controller.currentobscureText1 ?  AppAssets.eyeOff: AppAssets.eyeOpen).marginAll(
                                14),
                            onTapSuffixIcon: controller.currentOnPassSuffixTap,
                  validator: (value){
                               // ignore: unnecessary_null_comparison
                               if (value!.trim() == null || value.trim().isEmpty) {
                      return 'Password is Required*';
                    }
                    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$').hasMatch(value)) {
                      return 'Minimum 8 characters, at least 1 upper case, 1 lower case,1 number and 1 special character.'.tr;
                    }
                    return null; // Return null if the password is valid.
                  
                            
                            },                                                
                          ),
                        addHeight(20),
                             CustomTextField(
                            controller: controller.forgetPasswordCtrl,
                            obscureText: controller.forgetobscureText1,                          
                            labelText: "New Password",
                            // labelStyle: TextStyle(), 
                            suffixIcon: SvgPicture.asset(controller.forgetobscureText1 ?  AppAssets.eyeOff: AppAssets.eyeOpen).marginAll(
                                14),
                            onTapSuffixIcon: controller.forgetonPassSuffixTap,
                  validator: (value){
                               // ignore: unnecessary_null_comparison
                               if (value!.trim() == null || value.trim().isEmpty) {
                      return 'Password is Required*';
                    }
                    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$').hasMatch(value)) {
                      return 'Minimum 8 characters, at least 1 upper case, 1 lower case,1 number and 1 special character.'.tr;
                    }
                    return null; // Return null if the password is valid.
                  
                            
                            },                                                
                          ),
                          addHeight(20),
                           CustomTextField(
                            controller: controller.forgetConfPasswordCtrl,
                            obscureText: controller.forgetobscureText2,                          
                            labelText: "Confirm Password",
                            // labelStyle: TextStyle(), 
                            suffixIcon: SvgPicture.asset(controller.forgetobscureText2 ?  AppAssets.eyeOff: AppAssets.eyeOpen).marginAll(
                                14),
                            onTapSuffixIcon: controller.forgetonPassSuffixTap2,
                  validator: (value){
                               // ignore: unnecessary_null_comparison
                               if (value!.trim() == null || value.trim().isEmpty) {
                      return 'Password is Required*';
                    }
                    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$').hasMatch(value)) {
                      return 'Minimum 8 characters, at least 1 upper case, 1 lower case,1 number and 1 special character.'.tr;
                    }
                    else if(controller.forgetPasswordCtrl.text.trim() == controller.forgetConfPasswordCtrl.text.trim()){
                        return null;
                    }
        
                    return "Confirm Password Not Match";                                                      
                            },                                                
                          ),
                    
                    addHeight(90.h),
                     CustomButton(text: "Reset", onPressed: (){
                      if(controller.changePasswordFormKey.currentState!.validate()){
                            controller. changePasswordApi();
                          }
                          }, 
                          width: Get.width /1.1,
                          height: 60.h,),
        
                  ],
                ),
              ),
            );
          }).marginSymmetric(horizontal: 20.sp).paddingOnly(
                    bottom:  MediaQuery.of(context).viewInsets.bottom
            ),
        ),
      ),     
    );
  }
}