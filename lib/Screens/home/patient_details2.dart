import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/home/provider/provider_view.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';


class PatientDetails2 extends StatefulWidget {
  const PatientDetails2({super.key});

  @override
  State<PatientDetails2> createState() => _PatientDetails2State();
}

class _PatientDetails2State extends State<PatientDetails2> {
  final bottomCont = Get.find<BottomBarController>();
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
                        addHeight(30),
                      Card(          
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
                         ),),
                  addHeight(10),
                  AnimationLimiter(
                
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2, 
                      childAspectRatio: 2,
                      mainAxisSpacing: 1,
                    
                      // 
                      children: List.generate(ctrl.listofCatagory2.length, (index) {
              return  AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 500),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                                  onTap: (){
                                    // Get.to(ProviderView());
                                    Get.toNamed(ctrl.listofCatagory2[index]['route']);
                                  },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor, 
                                borderRadius: BorderRadius.circular(12.h)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(
                                      vertical: 6.h,
                                      horizontal: 8.h
                                    ),
                                    child: Row(
                                      children: [                                  
                                        addHeadingTxtMedium(ctrl.listofCatagory2[index]['name'], fontSize: 14),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(AppAssets.bottomLeftCicleImg),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                          right: 12.h,
                                          // bottom: 4.h
                                        ),
                                        child: SvgPicture.asset(ctrl.listofCatagory2[index]['img']),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )                 
                      )
                      );}
                      )
                  ),),
                    // Spacer(),
                    addHeight(20),
                    CustomButton(
                      width: Get.width,
                      height: 60,
                      text: "Full Medical Summary", onPressed: (){}),
                      //  Spacer(),
                          addHeight(30),                                
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