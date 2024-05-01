import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({super.key});

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
 final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        // init: MyController(),
        initState: (_) {},
        builder: (ctrl) {
          return Container(
              height: Get.height,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(                
                      image: DecorationImage(image: AssetImage(AppAssets.patient3), 
                      fit: BoxFit.fill),      
                                             
                    ),
                    height: Get.height /2.3,
                    width: Get.width,
                    child: Container(
                      decoration: const BoxDecoration(
                         gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent, 
                 Colors.transparent, 
              //  AppColors.blackColor1,
               AppColors.blackColor1],
              ), 
                      ),
                      child: Column(children: [
                        addHeight(30),
                      
                                    Spacer(),
                                    
                                    // Spacer(),
                                    
                                    
                                    
                              //  Container(
                              //         height: Get.height / 2,
                              //         decoration: BoxDecoration(
                       
                              //           // color: AppColors.blackColor1.withOpacity(0.3)
                              //         ),
                              //         // child: ,
                              //        ),
                                // addHeight(30.h),
                                    // Container(
                                    //   height: Get.height/9,
                                    //   decoration: BoxDecoration(
                                    //     color: AppColors.blackColor1.withOpacity(0.5)
                                    //   ),
                                    // )
                                  ]),
                    ),
            ),
            
             Positioned(
              bottom: 0,
              child:       
              CustomPaint(
                  painter: MyShape(),
                  child:  Container(
                width: MediaQuery.of(context).size.width,
                height: Get.height/ 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        addHeight(30.h),
                        // Spacer(),
                          Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.h),
                          child: Row(
                            children: [
                             
                                InkWell(
                                      onTap: (){
                                        Get.back();
                                      },
                                   child: SvgPicture.asset(AppAssets.backArrowIcon)),
                                
                      ],
                                      ),
                                      
                                    ),
                                    // Spacer(),
                                   Container(
                                    // color: AppColors.appColor2,
                                    height: Get.height/ 3.5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Spacer(flex: 3,),
                                         Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                      addHeadingTxtMedium("Tom Johnson", fontSize: 22.sp, color: AppColors.whiteColor, fontFamily: "Montserrat-semibold")
                                    ],),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                      addHeadingTxtMedium("Myself", fontSize: 16.sp, color: AppColors.whiteColor, fontFamily: "Montserrat-light")
                                    ],),
                                    Spacer(), 
                                    addHeight(10),                                                                   
                                     GestureDetector(
                                      onTap: (){
                                        // Get.back();
                                        Get.toNamed(AppRoutes.addDoctorsVisit);
                                      },
                                       child: Container(
                                        width: Get.width / 2.6 ,
                                        height: 35.h,
                                        decoration: BoxDecoration(
                                                           borderRadius: BorderRadius.circular(15),
                                                           color:  AppColors.orangeColor,
                                                         
                                        ),
                                        child: 
                                        Row(
                                                           mainAxisAlignment: MainAxisAlignment.center,
                                                           children: [
                                                             Icon(Icons.add, color: AppColors.whiteColor), 
                                                             addHeadingTxtMedium("Look Up Health", 
                                                             fontSize: 13.sp,
                                                             color: AppColors.whiteColor,
                                                             fontWeight: FontWeight.bold,
                                                             fontFamily: "Montserrat"
                                                             )
                                                           ],
                                        ),
                                       ),
                                     ),
                                     
                                     Spacer(),
                                      ],
                                    ),
                                   ),

                           addHeight(30),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.h, vertical: 8.h ),
                            child: Container(
                              height: 50.h,
                              child: ListView(
                                scrollDirection: Axis.horizontal,                                
                                children: List.generate(ctrl.listofCatagory.length, (index) => Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                  child: InkWell(
                                    onTap: (){
                                      ctrl.listofCatagoryIndex = index;
                                      ctrl.update(); 
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(ctrl.listofCatagoryIndex == index ? 20 : 0) ,
                                        color: ctrl.listofCatagoryIndex == index ?   AppColors.appColor : AppColors.whiteColor,
                                      ),
                                      width: Get.width /3,
                                      height: 30,
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                        child: Center(child: addRegularTxt(ctrl.listofCatagory[index]['name'], color:  ctrl.listofCatagoryIndex == index ? AppColors.whiteColor: AppColors.blackColor, fontSize: 14.sp )),
                                      ),
                                    ),
                                  ),
                                )),
                              ),
                            ),
                          ),
                          Container(
                              height: Get.height/2.8,
                              child: ListView(
                                padding: EdgeInsets.zero,
                                children: List.generate(ctrl.listofCatagory[ctrl.listofCatagoryIndex]['item'].length, (index) => Padding(

                                    padding:  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 12
                                    ),
                                  child: Container(
                                    // height: 40.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.whiteColor,
                                       boxShadow: [
                      const BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                        offset: Offset(1.0, 1.0), // shadow direction: bottom right
                      )
                    ],                
                                    ),                                
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 14
                                      ),
                                      child: addRegularTxt(ctrl.listofCatagory[ctrl.listofCatagoryIndex]['item'][index]),
                                    ),
                                  ),
                                )),
                              ),
                              // color: AppColors.,
                          ), 
                          addHeight(10),
                          InkWell(
                            onTap: (){
                              if(ctrl.listofCatagoryIndex == 0)
                              Get.toNamed(AppRoutes.addSymptoms);
                              else if (ctrl.listofCatagoryIndex == 1)
                                Get.toNamed(AppRoutes.addMedications);
                              else if(ctrl.listofCatagoryIndex == 2)
                                Get.toNamed(AppRoutes.addProcedures);
                              else{
                                 Get.toNamed(AppRoutes.addTestScan);
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppAssets.addIcon),
                                addWidth(10),
                                addRegularTxt("Add ${ctrl.listofCatagory[ctrl.listofCatagoryIndex]['name']}", color: AppColors.orangeColor, fontSize: 14)
                              ],
                            ),
                          ),
                          addHeight(20.h),

                            
                      ],
                    ),
                  ),
                // ),
              ),
            ),
            // Positioned( 
            //   top: Get.height/ 2.8,
            //   left: 0,
            //   right: 0,
            //   // width:
            //   // bottom: 0,
            //   child: )
            // Positioned(
            // top: 230,
            // left: 100,
            // right: 100,
            //   child: Stack(
            //     children: [
            //       Container(
            //         width: 200,
            //         height: 50,
            //         decoration: BoxDecoration(
            //           color: Colors.transparent,
            //           borderRadius: BorderRadius.only(
            //             bottomLeft: Radius.circular(20),
            //                 bottomRight: Radius.circular(20),
                        
            //           )
            //         ),
            
            //         child: Column(
            //           children: [
            //               Row(
            //                 children: List.generate(10, (index) => Text("$index", )),
            //               )
            
            //           ],
            //         ),
            //       ),
            //       Container(
            //     width: 200,
            //     height: 40,
            //     margin: EdgeInsets.only(left: 10,right: 10,),
            //     decoration: BoxDecoration(
            //       color: Colors.red,
            //       borderRadius: BorderRadius.circular(15)
            //     ),
            
            //     child: Column(
            //       children: [
            //           Row(
            //             children: List.generate(10, (index) => Text("$index", )),
            //           )
            
            //       ],
            //     ),
            //   ),
            //     ],
            //   ),
            // )
           
          ],
        ),
      ) ; 
        },
      )  
    );
  }
}

class MyShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint();
    final path = Path();
    // paint.style = PaintingStyle.stroke;
    // paint.strokeWidth = 15;
    // paint.color = Colors.blueAccent;
    path.moveTo(0.0, size.height * 0.45);

    path.quadraticBezierTo(
      size.width * 0.00,
      size.height * 0.37,
      size.width * 0.12,
      size.height * 0.37,
    );

    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.37,
      size.width * 0.30,
      size.height * 0.37,
    );
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.40,
      size.width * 0.38,
      size.height * 0.40,
    );
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.40,
      size.width * 0.30,
      size.height * 0.40,
    );
    path.quadraticBezierTo(
      size.width * 0.65,
      size.height * 0.4,
      size.width * 0.62,
      size.height * 0.40,
    );
    path.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.4,
      size.width * 0.7,
      size.height * 0.37,
    );
// Right border
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.37,
      size.width * 0.8,
      size.height * 0.37,
    );
    path.quadraticBezierTo(
      size.width * 0.97,
      size.height * 0.37,
      size.width *  1,
      size.height * 0.43,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.6);
    canvas.drawPath(path, paint);
    final paint1 = Paint();
    paint1.style = PaintingStyle.fill;
    paint1.color = Colors.white;
    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }
}


// class CustomShape extends ShapeBorder {
//   @override
//   EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

//   @override
//   Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
//     return getOuterPath(rect);
//   }

//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     final double curveX = rect.width / 5.1;
//     Path rectPath = Path()
//       ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(30)));
//       Path curvePath = Path()
//   ..moveTo(rect.center.dx - curveX, rect.top)
//   ..lineTo(rect.center.dx + curveX, rect.top)
//   ..lineTo(rect.center.dx + curveX, rect.bottom - Get.height / 1.7)
//   ..lineTo(rect.center.dx - curveX, rect.bottom - Get.height / 1.7)
//   ..close();

// // Calculate the radius for bottom-left and bottom-right corners
// double bottomRadius = rect.width * 0.2; // 20% of the rectangle width for the radius

// // Add circular border radii for bottom-left and bottom-right corners


//     // Path curvePath = Path()
//     //   ..moveTo(rect.center.dx - curveX, rect.top)
   
//     //   ..lineTo(rect.center.dx + curveX, rect.top ) // add a line to complete the half rectangle
//     //   ..lineTo(rect.center.dx + curveX, rect.bottom - Get.height /1.7 ) // add lines to close the path
//     //   ..lineTo(rect.center.dx - curveX, rect.bottom - Get.height /1.7)
      
//     //   ..close();

//     return Path.combine(PathOperation.xor, rectPath, curvePath);
//   }

//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
//     canvas.drawPath(
//         getOuterPath(rect),
//         Paint()
//           ..color = Colors.red // Use whatever color you want here
//           ..style = PaintingStyle.stroke); // Change to .fill for a filled shape
//   }

//   @override
//   ShapeBorder scale(double t) => this;
// }


// class CustomShape extends ShapeBorder {
//   @override
//   EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

//   @override
//   Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
//     return getInnerPath(rect);
//   }

//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     final double curveX = rect.width / 4.1;
//     Path rectPath = Path()
//       ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(10)));
//       Path path = Path()
//   ..moveTo(rect.center.dx - curveX, rect.top)
//   ..quadraticBezierTo(
//     rect.topCenter.dx - 90,
//     rect.center.dy - curveX - 60, // middle curve control
//     rect.center.dx + curveX, // adjust this value to control the curve width
//     rect.top, // adjust this value to control the height of the half rectangle
//   )..lineTo(rect.center.dx + curveX, rect.top) // add a line to complete the half rectangle
//   ..lineTo(rect.center.dx + curveX, rect.bottom) // add lines to close the path
//   ..lineTo(rect.center.dx - curveX, rect.bottom)
//   ..close();

//     // Path curvePath = Path()
//     //   ..moveTo(rect.center.dx - curveX, rect.top)
//     //   ..
//     //   quadraticBezierTo(
//     //     rect.topCenter.dx - 90,
//     //     rect.center.dy - curveX - 60, //middle curve control
//     //     rect.bottomCenter.dx + curveX - 20,
//     //     rect.top,
//     //   );

//     return Path.combine(PathOperation.xor, rectPath, curvePath);
//   }

//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
//     canvas.drawPath(
//         getOuterPath(rect),
//         Paint()
//           ..color = AppColors.blackColor1
//           ..style = PaintingStyle.stroke);
//   }

//   @override
//   ShapeBorder scale(double t) => this;
// }