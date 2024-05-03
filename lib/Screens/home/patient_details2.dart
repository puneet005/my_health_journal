import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class PatientDetails2 extends StatefulWidget {
  const PatientDetails2({super.key});

  @override
  State<PatientDetails2> createState() => _PatientDetails2State();
}

class _PatientDetails2State extends State<PatientDetails2> {
  @override
  Widget build(BuildContext context) {

   return Scaffold(
      body:   GetBuilder<HomeController>(
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
                    padding:  EdgeInsets.symmetric(
                      horizontal: 14.h
                    ),
                    child: ListView(
                      children:[
                        addHeight(40),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Image.asset(AppAssets.patient1, height: 50.h,),
                            ),
                            addWidth(20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                addBoldTxt("Tom Johnson", fontSize: 16),
                                addBoldTxt("Myself", fontSize: 12, color: AppColors.greyColor5),
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
                          Get.back();
                          // Get.toNamed(AppRoutes.);
                        },
                        child:  Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Center(
                            child:  SvgPicture.asset(AppAssets.cancelIcon),
                          ),
                        ),
                      ),
                     ),
                    ],
                  ),
                  addHeight(20),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2, 
                    childAspectRatio: 2,
                    mainAxisSpacing: 2,

                    // 
                    children: List.generate(ctrl.listofCatagory2.length, (index) => 
                   Padding(padding: EdgeInsets.all(4),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                           color:index == 0 || index == 3 || index == 4 || index == 7 || index == 8 ? AppColors.appColor.withOpacity(0.2) : AppColors.orangeColor.withOpacity(0.2),
                          //  image: DecorationImage(image: AssetImage(
                          //    ctrl.listofCatagory2[index]['img']
                          //  )),
                        ),                      
                        // height: 20.h,
                        child: Stack(
                          children: [
                             if(index % 2 == 0)
                            Positioned(
                              left: 10,
                              top: 0,
                              child: SvgPicture.asset(ctrl.listofCatagory2[index]['img'], height: 60, color: Colors.white.withOpacity(0.5),),
                              ),
                                if(index % 2 != 0)
                            Positioned(
                              right: 10,
                              bottom: 2,
                              child: SvgPicture.asset(ctrl.listofCatagory2[index]['img'], height: 60, color: Colors.white.withOpacity(0.7),),
                              ),
                            // if(index % 2 == 0)
                            // Positioned(
                            //   left: -10,
                            //   top: -14,
                            //   child: Container(
                            //   decoration: BoxDecoration(
                            //     shape: BoxShape.circle,
                            //      color: Colors.white,

                            //   ),
                             
                            //   width: 60,
                            //   height: 80,
                            //   child: Center(
                            //     // padding: const EdgeInsets.only(
                            //     //   left: 18,
                            //     //   top: 16,
                            //     //   right: 10,
                            //     // ),
                            //     child: Center(child: Image.asset(ctrl.listofCatagory2[index]['img'], height: 40,), ),
                            //   ),
                            // )),
                            // if(index % 2 != 0)
                            //  Positioned(
                            //   right: -10,
                            //   bottom: -14,
                            //   child: Container(
                            //   decoration: BoxDecoration(
                            //     shape: BoxShape.circle,
                            //      color: Colors.white,

                            //   ),
                             
                            //   // padding: const EdgeInsets.only(
                            //   //     right: 18,
                            //   //     bottom: 16,
                            //   //     left: 10,
                            //   //   ),
                            //   width: 60,
                            //   height: 80,
                            //   child: Center(child: Image.asset(ctrl.listofCatagory2[index]['img'], height: 40,), ),
                            // )),
                             if(index % 2 == 0)
                            Positioned(
                              left: 10,
                              bottom: 2,
                              child: addBoldTxt(ctrl.listofCatagory2[index]['name'], fontSize: 18.h, color: AppColors.blackColor1)                          ),
                            if(index % 2 != 0)
                            Positioned(
                              left: 10,
                              top: 2,
                              child: addBoldTxt(ctrl.listofCatagory2[index]['name'], fontSize: 18.h, color: AppColors.blackColor1)                          )
                          ],
                        )
                        // Center(child: ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(2.0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //        color:index == 0 || index == 3 || index == 4 || index == 7 || index == 8 ? AppColors.appColor.withOpacity(0.5) : AppColors.orangeColor,
                    //       // color: AppColors.orangeColor,
                    //       borderRadius: BorderRadius.circular(10)
                    //     ),
                    
                         
                    //       child: Stack(
                    //         clipBehavior: Clip.antiAliasWithSaveLayer,
                    //         children: [
                    //   Positioned(
                    //       left: -15,
                    //       bottom: 35,
                    //       child: Container(
                    //         color: Colors.transparent,
                    //         height: 80,
                    //         width: 90,
                    //         child: CustomPaint(
                    //   painter: MyPainter(),
                    //   // child: Center(
                    //   //   child:
                    
                    //   // )
                    //         ),
                    //       )),
                    //       Container(
                    //         height: Get.height,
                    //         child: 
                    //         Row(
                    //   children: [
                    //   Image.asset(ctrl.listofCatagory2[index]['img'], width: 50,),
                    //   addWidth(10),
                    //    Container(
                    //   // color: AppColors.appColor,
                    //   child:  addBoldTxt(ctrl.listofCatagory2[index]['name'], fontSize: 16.h, color: AppColors.whiteColor),
                      
                    //    )
                    //   ],
                    //         ),
                            
                    //       )
                     
                    //         ],
                    //       )),
                    // ),
                    
                    // Padding(
                    //   padding: const EdgeInsets.all(2.0),
                    //   child:  Container(
                    //     color: AppColors.bgColor,
                    //     child: 
                    //     Row(children: [
                    //       CircleAvatar(
                    //         backgroundColor: AppColors.orangeColor,
                    //         radius: 30.h,
                    //         child: Image.asset(AppAssets.patientDetails1),
                    //       ),
                    //       Expanded(
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             // borderRadius:  .
                    //              color: AppColors.blackColor1,
                    //           ),
                             
                    //         ),
                    //       )
                    //     ]),
                    //   ),
                      // child: Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20),
                      //      color:index == 0 || index == 3 || index == 4 || index == 7 || index == 8 ? AppColors.appColor.withOpacity(0.5) : AppColors.orangeColor,
                      //      image: DecorationImage(image: AssetImage(
                      //         AppAssets.patientDetails1
                      //      )),
                      //   ),                      
                      //   height: 20.h,
                      //   child: Center(child: addBoldTxt(ctrl.listofCatagory2[index]['name'], fontSize: 18.h, color: AppColors.whiteColor)),
                      // ),
                    // )
                    )),
                    Spacer(),
                    addHeight(20),
                    CustomButton(
                      width: Get.width,
                      height: 60,
                      text: "Full Medical Summary", onPressed: (){}),
                       Spacer(),
                                                          
                      ],
                    ),
                  ),
                  );})
                  );
  }
}


class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
   
    canvas.drawArc(
      
      Rect.fromCenter(
        center: Offset(size.height / 11, size.width / 1.3),
        height: size.height + 20,
        width: size.width + 40,
      ),
      pi * 2,
      pi * 4,
      true,
      paint,
    );
  }
   @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/*
 canvas.drawArc( Rect.fromCenter(
        center: Offset(size.height / 11, size.width / 1.3),
        height: size.height + 20,
        width: size.width + 40,
      ), 
    pi * 2,
      pi * 4,
      true,
      paint,);
*/