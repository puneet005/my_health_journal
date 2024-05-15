import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/controllers/medical_summary_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';

class Medications extends StatefulWidget {
  const Medications({super.key});

  @override
  State<Medications> createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
  final controller = Get.find<MedicalSummaryController>();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body:   GetBuilder<MedicalSummaryController>(
        // init: MyController(),
        initState: (_) {},
        builder: (ctrl) {
          return Container(                    
               width: double.infinity,
                      height: Get.height,
                         decoration: const BoxDecoration(  
                          color: AppColors.bgColor,          
                    image: DecorationImage(image: AssetImage(AppAssets.bgImg2, 
                    
                    ),
                    fit: BoxFit.fill,
                    // colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.color)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                      addHeight(30),
                      AppBar1(title: "Medications"),
                      addHeight(20),
  //                     GridView.count(
  //                   childAspectRatio :1,
  //                   crossAxisSpacing: 0,
  //                   mainAxisSpacing: 9,
  // // primary: false,
  // padding: EdgeInsets.zero,
  // crossAxisCount:  2,
  // shrinkWrap: true,
  // children: List.generate(4, (index) => Container(
  //   height: 300.h,
  //   decoration: BoxDecoration(
  //     color: AppColors.appColor,
  //     image: DecorationImage(image: AssetImage(AppAssets.medicalCardPngBG), fit: BoxFit.cover)
  //   ),
  Container(
    height: Get.height/ 1.5,
    child: GridView.count(
        childAspectRatio: 1,
        // crossAxisSpacing: 0,
        mainAxisSpacing: 10,
        padding: EdgeInsets.zero,
        
        crossAxisCount: 2,
        shrinkWrap: true,
  
        children: List.generate(controller.medicationList.length, (index) => InkWell(
          onTap: (){
            Get.toNamed(AppRoutes.medicationDetails);
          },
          child: Stack(
            alignment: Alignment.topCenter,
            children: [        
              Container(
                 width: double.infinity, 
                height: 350,
                // color: AppColors.,
                //          // Assuming 300 is the desired height
                //         // decoration: BoxDecoration(
                //         //   color: AppColors.appColor,
                //         //   image: DecorationImage(
                
                //         //     image: AssetImage(AppAssets.medicalCardPngBG,),
                //         //     fit: BoxFit.fill, // Ensures the image fills the entire container
                //         //   ),
                //         // ),
                child: Padding(
                  padding:  EdgeInsets.only(
                    top: 16.h
                  ),
                  child:  SvgPicture.asset(AppAssets.medicalCardBG,width: double.infinity,  height: 280.h, fit: BoxFit.none,                               
                  )                       
                )
                //
              ),
              Positioned(
                top:-2,
                // left: Get.width / 6.6,
                // right: 0,
                child: Image.asset(controller.medicationList[index]['img'])),
          
                Positioned(
                top:0,
                left:0,
                right: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Spacer(
                      flex: 2,
                    ),
                    addBoldTxt(controller.medicationList[index]['name'], fontSize: 15),
                    Divider(
                      indent: 50,
                      endIndent: 50,
                    ),
                    // addHeight(10),
                    addLightTxt("Who is taking?", fontSize: 11, color: AppColors.blackColor.withOpacity(0.7)),
                    // addHeight(10),
          
                   addHeadingTxtMedium(
                    controller.medicationList[index]['take'].length < 2 ?  "${controller.medicationList[index]['take'][0]}" : "${controller.medicationList[index]['take'][0]} +${controller.medicationList[index]['take'].length-1}", 
                    fontSize: 12.h
          
                    ),
                    Spacer(
                      flex: 1,
                    )
          
                  // Row(children: [
                  //   Add
                  // ],)
                  ],
                ))
          
              
            ],
          ),
        ))),
  ),
      Padding(
   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  child:   CustomButton(
    height: 50,
    width: Get.width / 2,
    text: "Add New", onPressed: (){}),
),
                      ])));})
   );
  }

  
}


// class MyShape extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // TODO: implement paint
//     final paint = Paint();
//     final path = Path();
//     paint.style = PaintingStyle.stroke;
//     paint.strokeWidth = 0;
//     paint.color = Colors.white;
//     path.moveTo(0.00, size.height * 0.92);

//     path.quadraticBezierTo(
//       size.width * 0.00,
//       size.height * 0.006,
//       size.width * 0.006,
//       size.height * 0.06,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.03,
//       size.height * 0.006,
//       size.width * 0.09,
//       size.height * 0.006,
//     );

//     path.quadraticBezierTo(
//       size.width * 0.01,
//       size.height * 0.0,
//       size.width * 0.28,
//       size.height * 0.00,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.50,
//       size.height * 0.5,
//       size.width * 0.78,
//       size.height * 0.0,
//     );
   
//     // path.quadraticBezierTo(
//     //   size.width * 0.55,
//     //   size.height * 0.054,
//     //   size.width * 0.549,
//     //   size.height * 0.052,
//     // );
//     // path.quadraticBezierTo(
//     //   size.width * 0.57,
//     //   size.height * 0.035,
//     //   size.width * 0.57,
//     //   size.height * 0.00,
//     // );
//  path.arcTo(
//       Rect.fromCircle(center: Offset(size.width / 2, size.height * 0.0), radius: size.height * 0.23),
//       0,
//       pi,
//       false,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.852,
//       size.height * 0.002,
//       size.width * 0.9,
//       size.height * 0.001,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.982,
//       size.height * 0.0,
//       size.width * 0.9999,
//       size.height * 0.065,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.9999,
//       size.height * 0.96,
//       size.width * 0.9999,
//       size.height * 0.92,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.99,
//       size.height * 0.99,
//       size.width * 0.9,
//       size.height * 1,
//     );
//     path.quadraticBezierTo(
//       size.width * 0,
//       size.height * 1,
//       size.width * 0.9,
//       size.height * 1,
//     );
//     // path.lineTo(size.width  0.06, size.height  1);
//     path.quadraticBezierTo(
//       size.width * 0.0,
//       size.height * 1,
//       size.width * 0.1,
//       size.height * 1,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.03,
//       size.height * 1,
//       size.width * 0.006,
//       size.height * 0.95,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.00,
//       size.height * 0.94,
//       size.width * 0.001,
//       size.height * 0.915,
//     );
//     // path.lineTo(size.width  0.0, size.height  0.95);
//     // path.lineTo(size.width, size.height);
//     // path.lineTo(0, size.height);
//     // path.lineTo(0, size.height * 0.8);
//     canvas.drawPath(path, paint);
//     final paint1 = Paint();
//     paint1.style = PaintingStyle.fill;
//     paint1.color = Colors.grey;
//     canvas.drawPath(path, paint1);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return true;
//   }
// }