import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/widget/patient_card.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';

class PatientView extends StatefulWidget {

  const PatientView({super.key});

  @override
  State<PatientView> createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   title: Row(
      //     children: [
      //       addRegularTxt("Choose Patient")
      //     ],
      //   ),
      // ),
      body: 
        ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            addHeight(50),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.sp,),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment,
                children: [
                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.addSymptoms);
                    },
                    child: addHeadingTxtMedium("Choose Patient", fontSize: 20.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-semibold" )),
                    Spacer(),
                  //  Container(
                  //   width: 45.h,
                  //   height: 45.h,
                  //   decoration: BoxDecoration(
                  //     color: AppColors.whiteColor,
                  //     borderRadius: BorderRadius.circular(15),
                  //     border: Border.all(
                  //       color: AppColors.blackColor3.withOpacity(0.1)
                  //     ),
                  //   ),
                  
                  //   child: InkWell(
                  //     onTap: (){
                  //       Get.toNamed(AppRoutes.setting);
                  //     },
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Center(
                  //         child:  SvgPicture.asset(AppAssets.settingIcon),
                  //       ),
                  //     ),
                  //   ),
                  //  ),
                  //  addWidth(10),
                  //   InkWell(
                  //     onTap: (){
                  //       Get.toNamed(AppRoutes.notification);
                  //     },
                  //     child: SvgPicture.asset(AppAssets.notificationIcon)),
                  //  addWidth(10),
                  // IconButton(onPressed: (){
                  //   Get.toNamed(AppRoutes.shareScreen);
                  // }, icon: Icon(Icons.share)),
                  // addWidth(10),
                ],
              ),
            ),
            addHeight(20),
            ListView(         
              shrinkWrap: true,
              children: List.generate(controller.patientList.length, (index) => PatientCard(data:  controller.patientList[index],)),
            ), 
             Padding(
   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  child:   CustomButton(
    height: 50,
    width: Get.width / 2,
    text: "Add new patient", onPressed: (){
      Get.toNamed(AppRoutes.addNewMember);
    }),
),

          ],
        
      )
        
      
    );
  }
}


