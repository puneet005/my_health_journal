import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/signUp_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';

import '../../common-widgets/custom_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final controller = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body:  GetBuilder<SignUpController>(builder: (ctrl)  {

          return Container(
             width: double.infinity,
                height: deviceHeight,
                   decoration: BoxDecoration(            
              image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
              fit: BoxFit.fill
              )
            ),
            child: SingleChildScrollView(
              // physics: BouncingScrollPhysics(),
                child: Form(
                  key: controller.signinKey,
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      addHeight(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppAssets.appLogo)
                        ],
                      ),
                      addHeight(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          addHeadingTxtMedium("Sign Up",fontSize: 28, fontWeight: FontWeight.bold, fontFamily: "Montserrat-semibold" )
                        ],
                      ),
                      addHeight(20),
                       CustomTextField(
                            controller: controller.fNameCtrl,
                            // obscureText: controller.obscureText,                          
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
                          addHeight(20),
                           CustomTextField(
                            controller: controller.emailCtrl,
                                                   
                            labelText: "Email",
                            
                            
                  validator: (value){
                      if(value!.isEmpty){
                        return "Email is Requried*";
                      }
                        EmailValidator(errorText: 'Enter Valid Email*');
                             
                  
        
                            },                                                
                          ),
                          addHeight(20),
                       IntlPhoneField(
                            controller: controller.phoneCtrl,                 
                            // autovalidateMode: AutovalidateMode.always,
                            disableLengthCheck: true,
                            keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              LengthLimitingTextInputFormatter(15),
                            ],
                            validator: (val){
                                if(val!.number.length > 7 &&  val.number.length < 15){
                                    return null;
                                  }
                                  else{
                                      return 'Enter Valid Number*'.tr;
                                  }
                            },
                            flagsButtonPadding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            
                            decoration: InputDecoration(    
                              floatingLabelAlignment: FloatingLabelAlignment.start,                        
                              label: addRegularTxt('Mobile Number', color: AppColors.greyColor1),
                              floatingLabelStyle: TextStyle(                           
                              ),
                              isDense: false,
                              filled: true,  
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: AppColors.orangeColor
                                ),
        
                                  // gapPadding: 20
                                // borderSide: BorderSide.none,
                              ), 
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: AppColors.orangeColor
                                ),)
        ,
        
                                                                                 
                              focusColor: AppColors.orangeColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: AppColors.orangeColor
                                ),
                                  // gapPadding: 20
                                // borderSide: BorderSide.none,
                              ),   
                              enabledBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: AppColors.orangeColor
                                ),                          
                              ) ,                         
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: AppColors.orangeColor
                                ),                               
                              ),
                            ),
                            showDropdownIcon: true,
                            dropdownIcon: Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.blackColor2,), 
                            dropdownIconPosition: IconPosition.trailing,                          
                            showCountryFlag: true,                          
                            initialCountryCode:'US',
                            onCountryChanged: (country) {
                              log(country.dialCode);
                              log(country.code);  
                              // log()
                              controller.countryCode = country.dialCode;
                              controller.update();
                            },
                            onChanged: (phone)
                                           {
                            },
                             enabled: true,
                          ), 
                          addHeight(20),
                          CustomTextField(
                            controller: controller.passwordCtrl,
                            obscureText: controller.obscureText,                          
                            labelText: "Password",
                            // labelStyle: TextStyle(), 
                            suffixIcon: SvgPicture.asset(controller.obscureText ?  AppAssets.eyeOff: AppAssets.eyeOpen).marginAll(
                                14),
                            onTapSuffixIcon: controller.onPassSuffixTap,
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
                            controller: controller.passwordConfCtrl,
                            obscureText: controller.obscureText2,                          
                            labelText: "Confirm Password",
                            // labelStyle: TextStyle(), 
                            suffixIcon: SvgPicture.asset(controller.obscureText2 ?  AppAssets.eyeOff: AppAssets.eyeOpen).marginAll(
                                14),
                            onTapSuffixIcon: controller.onPassSuffixTap2,
                  validator: (value){
                               // ignore: unnecessary_null_comparison
                               if (value!.trim() == null || value.trim().isEmpty) {
                      return 'Password is Required*';
                    }
                    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$').hasMatch(value)) {
                      return 'Minimum 8 characters, at least 1 upper case, 1 lower case,1 number and 1 special character.'.tr;
                    }
                    else if(controller.passwordCtrl.text.trim() == controller.passwordConfCtrl.text.trim()){
                        return null;
                    }
        
                    return "Confirm Password Not Match";
                     // Return null if the password is valid.                                              
                            },                                                
                          ),
                     addHeight(20),
                          CustomButton(text: "Sign Up", onPressed: (){
                          if(controller.signinKey.currentState!.validate()){
                            controller.signUpApi();                        
                          }
                          }, 
                          width: Get.width /1.1,
                          height: 60.h,),
                                                  
                          // addHeight(20),
                          //     Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     SvgPicture.asset(AppAssets.loginLineL, color: AppColors.greyColor,),
                          //     addBoldTxt('or login with', fontSize: 14,
                          //         fontWeight: FontWeight.w500, color: AppColors.greyColor1),
        
                          //     SvgPicture.asset(AppAssets.loginLineR, color: 
                          //     AppColors.greyColor,)
                          //   ],
                          // ).marginOnly(bottom: 30),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     GestureDetector(
                          //       onTap: (){
                          //         // controller.signInWithGoogle().then((value) {
                          //         //   if(value != null){
                          //         //     log(value.toString());
                          //         //     controller.SocialLoginApi(
                          //         //       login_type: 'google', 
                          //         //       social_id: value.providerData[0].uid.toString(),
                          //         //       email: value.email);  
                          //         //   }
                          //         // });
                          //       },
                          //       child: Container(
                          //         height: 50.h,
                          //         width: 50.h,
                          //         padding: EdgeInsets.all(10),
                          //         decoration:  BoxDecoration(
                          //           border: Border.all(
                          //             color: AppColors.greyColor3
                          //           ),
                          //           color: AppColors.whiteColor,
                          //           shape: BoxShape.circle,
                                    
                          //         ),
                          //         child: SvgPicture.asset(AppAssets.googleIcon,),
                          //       ),
                          //     ),
                              
                          //     GestureDetector(
                          //       onTap: (){
                          //       //  controller.FacebookSignInRequest();
                          //       },
                          //       child: Container(
                          //         height: 50.h,
                          //         width: 50.h,
                          //         padding: EdgeInsets.all(10),
                          //         decoration:  BoxDecoration(
                          //            border: Border.all(
                          //             color: AppColors.greyColor3
                          //           ),
                          //           color: AppColors.whiteColor,
                          //           shape: BoxShape.circle,
                          //         ),
                          //         child: SvgPicture.asset(AppAssets.facebookIcon,),
                          //       ),
                          //     ),
                          //     if(Platform.isIOS)
                          //     InkWell(
                          //       onTap: (){
                          //         log("Apple Sign in");
                          //         // controller.loginWithApple();
                          //       },
                          //       child: Container(
        
                          //         height: 50.h,
                          //         width:50.h,
                          //         padding: EdgeInsets.all(10),
                          //         decoration:  BoxDecoration(
                          //            border: Border.all(
                          //             color: AppColors.greyColor3
                          //           ),
                          //           color: AppColors.whiteColor,
                          //           shape: BoxShape.circle,
                          //         ),
                          //         child: SvgPicture.asset(AppAssets.appleIcon,),
                          //       ),
                          //     ),
                          //   ],
                          // ),
        
                          addHeight(10),
                      
                    ],
                
                  ).marginSymmetric(horizontal: 20.sp),
                )),
          );}
        ));
    // bottomSheet: Container(
    //   width: deviceWidth,
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       addBoldTxt('Already have a account? ',fontSize: 13,color: AppColors.primaryColor,fontWeight: FontWeight.w500),
    //       GestureDetector(
    //           onTap: (){
    //             Get.toNamed(AppRoutes.loginScreen);
    //           },
    //           child: addBoldTxt('Sign In',fontSize: 14,color: AppColors.primaryColor,)),
    //     ],
    //   ).marginSymmetric(vertical: 6),
    // ),
  }
}
