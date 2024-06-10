// import 'dart:io';

// import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_health_journal/common-widgets/custom_bottom_navigation3.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
// import 'package:my_health_journal/routers/app_routers.dart';
class TestScansAddComment extends StatefulWidget {
  String testId;
   TestScansAddComment({super.key, required this.testId});

  @override
  State<TestScansAddComment> createState() => _TestScansAddCommentState();
}

class _TestScansAddCommentState extends State<TestScansAddComment> {
    DateTime date = DateTime.now();
    String? todayDate;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
   todayDate =  DateFormat('EEE, dd MMMM yyyy').format(date);

   setState(() {
     
   });

  }
  @override
  Widget build(BuildContext context) {
   return Stack(
       
        children: [
            Container(
              
         width: double.infinity,
                height: Get.height,
                   decoration: const BoxDecoration(  
                    color: AppColors.bgColor,          
              image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
              fit: BoxFit.fill
              )
            ),),
       Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,    
          body:  GetBuilder<HomeController>(  
            // init: MyController(),
            // initState: (_) {},
            builder: (ctrl) {
              return Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(                
                    image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
                    fit: BoxFit.fill
                    )
                  ),
                  child:   Form(
                    key: ctrl.testScanAddCommentForm,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          addHeight(30),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 8.sp,),
                            child: InkWell(
                              onTap: (){
                                // Get.toNamed(AppRoutes.bottomNav);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Get.back();
                                    },
                                    child: SvgPicture.asset(AppAssets.backArrowIcon)),
                                  addHeadingTxtMedium("Add Comment", fontSize: 15.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-medium" ),
                                  const SizedBox(width: 40,)
                                  // InkWell(
                                  //   onTap: (){
                                  //     Get.back();
                                  //   },
                                  //   child: SvgPicture.asset(AppAssets.notificationIcon)),
                                             ],
                                          ),
                            ),
                                  ),
                                  addHeight(20),
                                     
                      
                         Container(                 
                                              // height: 170.h,
                              child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Container(
                                   decoration: BoxDecoration(
                                    // color: AppColors.whiteColor,
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(
                                                  
                                                  color: AppColors.blackColor2
                                                )
                                                ),
                                  child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                vertical: 8.h,
                                horizontal: 8.h
                                                  ),
                                    child: Column(
                                      children: [
                                         TextField( 
                                          controller: ctrl.testScanAddComment,                       
                                          maxLines: 5,
                                          decoration: const InputDecoration(
                                            hintText: "Add New Comments",
                                            border: InputBorder.none
                                          ),
                                        ),
                                       Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
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
                                    SvgPicture.asset(AppAssets.bottomNav3, color: AppColors.orangeColor3, height: 14.h,),
                                    addWidth(10),
                                    addRegularTxt("${todayDate ?? ""}", color: AppColors.orangeColor3, fontSize: 13.sp), 
                                    addWidth(10),                           
                                                        ],
                                                      ),
                                                    ),                                      
                                            ), 
                                            addWidth(10),
                                            
                                          ],
                                        )
                            
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ])),
                       addHeight(20),
                       Padding(
                         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child:   CustomButton(
                          height: 50,
                          width: Get.width / 2,
                          text: "Save", onPressed: (){
                            if(ctrl.testScanAddCommentForm.currentState!.validate()){
                              ctrl.TestScanAddCommentApi(todayDate.toString(), widget.testId);
                      
                            }
                          }),
                      ),
                                     
                      addHeight(20),
                        ]),
                    ),
                  ));}),
                  bottomNavigationBar: const NavBar2(),
                ),
     ],
   );
  }

  
}