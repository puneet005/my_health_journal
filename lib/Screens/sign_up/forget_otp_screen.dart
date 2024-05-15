
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/sign_up/reset_password.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/login_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
// import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class ForgetOTP extends StatefulWidget {
  const ForgetOTP({super.key});

  @override
  State<ForgetOTP> createState() => _ForgetOTPState();
}

class _ForgetOTPState extends State<ForgetOTP> {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      resizeToAvoidBottomInset: false,    
      // backgroundColor: AppColors.whiteColor,
      body: Container(
           width: double.infinity,
              height: Get.height,
                 decoration: BoxDecoration(            
            image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
            fit: BoxFit.fill
            )
          ),
        child: SingleChildScrollView(
          child: GetBuilder<LoginController>(builder: (loginCtrl) {
            return Container(
              height: Get.height,
              child: Form(
                key: controller.forgetOTPKey,
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
                            addHeadingTxtMedium("Forget OTP ",fontSize: 28, fontWeight: FontWeight.bold, fontFamily: "Montserrat-semibold" )
                          ],
                        ),
                        // addHeight(20),
                        addHeight(20),
                             CustomTextField(
                              controller: controller.forgetOtpCtrl,                                     
                              labelText: "OTP",
                               inputFormatters: [
        LengthLimitingTextInputFormatter(6),
      ],
                              
                              
                    validator: (value){
                        if(value!.isEmpty){
                          return "OTP is Requried*";
                        }
                        if(value.length < 4 ){
                                return "OTP Not Valid*";
                        }
                        return null;
                        // if()
                          // EmailValidator(errorText: 'Enter Valid Email*');
                               
                    
          
                              },   
                                                                           
                            ),
                    
                    addHeight(90.h),
                     CustomButton(text: "Verify", onPressed: (){
                            Get.to(const ResetPassword());
                            // controller.verifyForgetPasswordApi();
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