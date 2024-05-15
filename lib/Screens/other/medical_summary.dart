import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';

import '../../controllers/medical_summary_controller.dart';
class MedicalSummary extends StatefulWidget {
  const MedicalSummary({super.key});

  @override
  State<MedicalSummary> createState() => _MedicalSummaryState();
}

class _MedicalSummaryState extends State<MedicalSummary> {
    final controller = Get.find<MedicalSummaryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
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
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // InkWell(
                          //   onTap: (){
                          //     Get.back();
                          //   },
                          //   child: SvgPicture.asset(AppAssets.backArrowIcon)),
                            addHeadingTxtMedium("Medical Summary", fontSize: 15.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-medium" ),                                                 
                            // addWidth(40),
                            ],
                                  ),
                    ),
            ),
            // AppBar1(title: ""),
            addHeight(30),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 6.h
              ),
              child: Row(children: [
                addBoldTxt("Medical Reports:", fontSize: 16)
              ],),
            ),
            ListView(
              shrinkWrap: true,
              children: List.generate(controller.medicalList.length, (index) => SummaryCard(controller.medicalList[index]))
            )
      
          ],
        ),
      ),

    ));
  }

  Widget SummaryCard( var data){
    return Padding(
      padding:  EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 4.h
          ),
      child: InkWell(
        onTap: (){
          Get.toNamed(AppRoutes.medications);
          // Get.toNamed(AppRoutes.patientDetails);
        },
        child: Card(
          
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp)
            ),
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 10.h
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [           
                SvgPicture.asset(AppAssets.medicalSummaryIcon),
                                addWidth(20),
                                addBoldTxt(data['name'], ),                                                               
                                Spacer(),
                                InkWell(
                                  onTap: (){
                                    data['visible'] = ! data['visible'];
                                    setState(() {
                                      
                                    });
                                  },
                                  child: SvgPicture.asset( data['visible'] ? AppAssets.eyeOpen : AppAssets.eyeOff)),
                              
                     
              ],
            ),
      
          ),
        ),
      ),
    );
  }

}