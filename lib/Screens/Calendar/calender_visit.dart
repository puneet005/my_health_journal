import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/common-widgets/base_image_network.dart';
import 'package:my_health_journal/common-widgets/custom_bottom_navigation3.dart';
import 'package:my_health_journal/controllers/calendar_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class DoctorVisit extends StatefulWidget {
  const DoctorVisit({super.key});

  @override
  State<DoctorVisit> createState() => _DoctorVisitState();
}

class _DoctorVisitState extends State<DoctorVisit> {
 final controller =  Get.find<CalendarContorller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   GetBuilder<CalendarContorller>(
        // init: MyController(),
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
                    child: ListView(
                      shrinkWrap: true,
                       physics: const NeverScrollableScrollPhysics(),
                      children: [
                     addHeight(30),
                      AppBar1(title: "Doctors Visit"),
                      addHeight(10),
                      Container(
                        height: 50.h,
                        child: ListView(
                          shrinkWrap: true,                         
                          scrollDirection: Axis.horizontal,
                          children: List.generate(controller.visitType.length, (index) => Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: InkWell(
                              onTap: (){
                                controller.visitTypeIndex = index;
                                controller.update();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: controller.visitTypeIndex == index ?  AppColors.orangeColor : Colors.transparent, 
                                  borderRadius: BorderRadius.circular( 20)
                            
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(
                                    horizontal: 12.sp,
                                    vertical: 4.sp
                                  ),
                                  child: Center(child: addBoldTxt(controller.visitType[index], fontSize: 14, color: controller.visitTypeIndex == index ? AppColors.whiteColor : AppColors.blackColor,)),
                                ),
                              ),
                            ),
                          )),
                        ),
                      ),
                      addHeight(10),
                      if(controller.visitTypeIndex  == 0)
                      ListView(
                        shrinkWrap: true,
                        children: List.generate(3, (index) => VisitCard()),
                      ),
                        if(controller.visitTypeIndex  == 1)
                      ListView(
                        shrinkWrap: true,
                        children: List.generate(2, (index) => VisitCard()),
                      ),
                        if(controller.visitTypeIndex  == 2)
                      ListView(
                        shrinkWrap: true,
                        children: List.generate(3, (index) => VisitCard()),
                      ),
                        if(controller.visitTypeIndex  == 3)
                      ListView(
                        shrinkWrap: true,
                        children: List.generate(2, (index) => VisitCard()),
                      )
                      ])),
                      
                      
    );}),
    bottomNavigationBar: NavBar2(),);
  }
  Widget VisitCard(){
    return Card(          
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp)
            ),
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 8.h
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [           
                BaseImageNetwork(
                                  fit: BoxFit.cover,
                                  borderRadius: 10,
                                  link:AppAssets.patient1,
                                  concatBaseUrl: true,
                                  isAssetImage: true,
                                  height: 60.h,
                                  width: 60.h,
                                  topMargin: 2,
                                  rightMargin: 2,
                                  leftMargin: 2,
                                  bottomMargin: 2,
                                  errorWidget: const Icon(Icons.error, size: 70),
                                ),
                                addWidth(10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [      
                                    Container(
                                       decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                              border: Border.all(
                                                color: AppColors.orangeColor3
                                              )
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                            addWidth(10),
                            SvgPicture.asset(AppAssets.bottomNav3, color: AppColors.orangeColor3, height: 12.h,),
                            addWidth(5),
                            addRegularTxt("Wed, 10 April 2024  - ", color: AppColors.orangeColor3, fontSize: 12.sp), 
                            addWidth(5),
                            // addBoldTxt("|",color:  AppColors.blackColor2),
                            // addWidth(10),
                            // Icon(Icons.access_time, color: AppColors.orangeColor3,
                                        
                            // size: 16.h,)
                            // addWidth(2),
                            addRegularTxt("04:00 PM", color: AppColors.orangeColor3, fontSize: 12.sp), 
                            addWidth(5),
                                                ],
                                              ),
                                            ),
                                      
                                    ) ,                         
                                  //   addHeadingTxtMedium(controller, fontSize: 14, color: AppColors.blackColor, fontFamily: "Montserrat-semibold"),
                                    addHeight(10),
                                    Row(
                                      children: [
                                        addBoldTxt("Doctor: ", fontSize: 12, color: AppColors.greyColor1 ),
                                        addBoldTxt("Merrill Kelvin", fontSize: 12, color: AppColors.blackColor )
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                              
                              
                                // Icon(Icons.menu)           
              ],
            ),
      
          ),
        );
  }


  
}

