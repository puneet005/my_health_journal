
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/sign_up/forget_otp_screen.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/login_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      resizeToAvoidBottomInset: false,    
      // backgroundColor: AppColors.whiteColor,
      body: Container(
           width: double.infinity,
              height: deviceHeight,
                 decoration: BoxDecoration(            
            image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
            fit: BoxFit.fill
            )
          ),
        child: SingleChildScrollView(
          child: GetBuilder<LoginController>(builder: (loginCtrl) {
            return Container(
              height: deviceHeight,
              child: Form(
                key: controller.forgetKey,
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
                            addHeadingTxtMedium("Forget Password",fontSize: 28, fontWeight: FontWeight.bold, fontFamily: "Montserrat-semibold" )
                          ],
                        ),
                        // addHeight(20),
                        
                            addHeight(20),
                             CustomTextField(
                              controller: controller.forgetEmailCtrl,                                                     
                              labelText: "Email",
                              
                              
                    validator: (value){
                        if(value!.isEmpty){
                          return "Email is Requried*";
                        }
                          EmailValidator(errorText: 'Enter Valid Email*');
                               
                    
          
                              },                                                
                            ),
                    
                    addHeight(90.h),
                     CustomButton(text: "Countine", onPressed: (){
                          if(controller.forgetKey.currentState!.validate()){
                            controller.forgetPasswordApi();
                          }
                          }, 
                          width: Get.width /1.1,
                          height: 60.h,),
        //             Image.asset(AppAssets.splashLogo, height: MediaQuery
        //                 .of(context)
        //                 .size
        //                 .height * 0.20),
        //             addHeight(60.h),
              
        //             addRegularTxt('Forget Password',fontSize: 24,color: AppColors.primaryColor),
        //             addHeight(36.h),
        //             Stack(
        //               children: [
        //                 CustomTextField(                       
        //                   controller: loginCtrl.forgetemailCtrl,
        //                   suffixIcon: SvgPicture.asset(AppAssets.mailIcon).marginAll(14),                        
        //                       validator: (val){
        //                         if (val!.trim().isEmpty) {
        //   return 'Email is required*';
        // } 
        // // else if (!EmailValidator.validate(val)) {
        // //   return 'Please enter a valid email';
        // // }
        // return null;                           
        // }
        //                 ),
        //                 Positioned(
        //                     left: 12.sp,
        //                     top: 6.sp,
        //                     child: addBoldTxt('Email ID',height: 1.0,fontSize: 11,fontWeight: FontWeight.w500,color: AppColors.txtFieldLabelColor,)),
        //               ],
        //             ),
        //             // addHeight(15.h),
                   
        //             addHeight(60.h),
        //             CustomButton(
        //               height: 52.h,
        //                 width: deviceWidth,
        //                 text: 'Get Password',
        //                 fontWeight: FontWeight.w400,
        //                 onPressed: (){
        //                      if(controller.forgetKey.currentState!.validate()){                                    
        //                                 // controller.ForgetApi();
        //                     }
        //                 }),
                  
        //             // addRegularTxt('Forgot Password?',fontSize: 16,color: AppColors.primaryColor),
        //             Spacer(),
                   
        //             addHeight(20.h),
                  ],
                ),
              ),
            );
          }).marginSymmetric(horizontal: 20.sp),
        ),
      ),
      // bottomSheet: Container(
      //   width: deviceWidth,
      //   child: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       addBoldTxt('Don\'t have any account? ',fontSize: 13,color: AppColors.primaryColor,fontWeight: FontWeight.w500),
      //       GestureDetector(
      //           onTap: (){
      //             Get.toNamed(AppRoutes.signUpScreen);
      //           },
      //           child: addBoldTxt('Sign Up',fontSize: 14,color: AppColors.primaryColor,)),
      //     ],
      //   ).marginSymmetric(vertical: 6),
      // ),
    );
  }
}
