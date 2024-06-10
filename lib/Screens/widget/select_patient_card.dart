// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class SelectPatientCard extends StatefulWidget {
  String route;
  SelectPatientCard({super.key, required this.route});

  @override
  State<SelectPatientCard> createState() => _SelectPatientCardState();
}

class _SelectPatientCardState extends State<SelectPatientCard> {
  final bottomCont = Get.find<BottomBarController>();
  @override
  Widget build(BuildContext context) {
    return  Card(          
                          elevation: 2.0,
                          color: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp)
                                ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(
                                  horizontal: 12.h,
                                  vertical: 6.h
                                ),          
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: AppColors.appColor.withOpacity(0.1),
                                  child: CircleAvatar(
                                    radius: 32,
                                    backgroundColor: AppColors.appColor.withOpacity(0.1),
                                    child: Container(
                                      width: 50.h,
                                      height: 50.h,
                                      decoration:  BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(image: bottomCont.selectedPatient.profile !=  null  ? NetworkImage("${ApiUrls.domain}${bottomCont.selectedPatient.profile}") :  AssetImage(AppAssets.patient1) as ImageProvider,
                                        fit: BoxFit.cover
                                         )
                                      ),
                                      // child: Image.asset(, height: 50.h,),
                                    ),
                                  ),
                                ),
                                addWidth(20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    addBoldTxt(bottomCont.selectedPatient.name ?? "", fontSize: 16),
                                    addBoldTxt(bottomCont.selectedPatient.relation ?? "", fontSize: 12, color: AppColors.greyColor5),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                                width: 45.h,
                                                height: 45.h,
                                                 decoration: BoxDecoration(
                                                   color: AppColors.whiteColor,
                                                   borderRadius: BorderRadius.circular(15),
                                                   border: Border.all(
                              color: AppColors.blackColor3.withOpacity(0.1)
                                                   ),
                                                 ),
                                               
                                                 child: InkWell(
                                                   onTap: (){
                                                    Get.toNamed(widget.route);
                              // Get.back(); 
                              // Get.toNamed(AppRoutes.);
                                                   },
                                                   child:  Padding(
                              padding:  const EdgeInsets.all(8.0),
                              child: Center(
                                child:  SvgPicture.asset(AppAssets.addIcon),
                              ),
                                                   ),
                                                 ),
                                                ),
                                               ],
                                             ),
                           ),);
  }
}