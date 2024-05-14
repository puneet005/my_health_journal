
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/login_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
// import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class ResetPassword extends StatefulWidget {

  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
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
          child: GetBuilder<LoginController>(builder: (loginCtrl) {
            return Container(
              height: Get.height,
              child: Form(
                key: controller.resetPasswordFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [      
                     addHeight(70),
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
                            addHeadingTxtMedium("Reset Password ",fontSize: 28, fontWeight: FontWeight.bold, fontFamily: "Montserrat-semibold" )
                          ],
                        ),
                        // addHeight(20),
                        addHeight(20),
                             CustomTextField(
                            controller: controller.forgetPasswordCtrl,
                            obscureText: controller.forgetobscureText1,                          
                            labelText: "Password",
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
                      if(controller.resetPasswordFormKey.currentState!.validate()){
                            controller. resetPasswordApi();
                          }
                          }, 
                          width: Get.width /1.1,
                          height: 60.h,),
        
                  ],
                ),
              ),
            );
          }).marginSymmetric(horizontal: 20.sp),
        ),
      ),     
    );
  }
}