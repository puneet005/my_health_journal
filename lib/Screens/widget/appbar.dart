import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';


// ignore: must_be_immutable
class AppBar1 extends StatelessWidget {
  String title;
  bool notificationIcon;
   AppBar1({super.key, required this.title, this.notificationIcon = false});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.sp,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: SvgPicture.asset(AppAssets.backArrowIcon)),
                        addHeadingTxtMedium(title, fontSize: 15.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-medium" ),
                        notificationIcon ? 
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: SvgPicture.asset(AppAssets.notificationIcon)): SizedBox(width: 45.h,),
                                   ],
                                ),
            );
  }
}