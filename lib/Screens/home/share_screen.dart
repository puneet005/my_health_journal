import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_health_journal/Screens/widget/patient_card.dart';
import 'package:my_health_journal/common-widgets/base_image_network.dart';
import 'package:my_health_journal/common-widgets/custom_bottom_navigation3.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
   final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GetBuilder<HomeController>(
        // init: MyController(),
        // initState: (_) {},
        builder: (_) {
          return Container(
              width: double.infinity,
               height: Get.height,
              decoration: BoxDecoration(
                
                image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
                fit: BoxFit.fill
                )
              ),
              child:   Column(
              
                children: [
                  addHeight(50),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.sp,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: SvgPicture.asset(AppAssets.backArrowIcon)),
                        addHeadingTxtMedium("Share With Others", fontSize: 15.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-medium" ),
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: SvgPicture.asset(AppAssets.notificationIcon)),
                 ],
              ),
            ),
            addHeight(10),
            ListView(         
              shrinkWrap: true,
              children: List.generate(controller.patientList.length, (index) => 
              Padding(
      padding:  EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 4.h
          ),
      child: Card(

          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp)
          ),
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 6.h
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [           
              BaseImageNetwork(
                                fit: BoxFit.cover,
                                borderRadius: 10,
                                link: controller.patientList[index]['img'],
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
                                  // Spacer(),
                                  // addHeight(10),
                                  addHeadingTxtMedium(controller.patientList[index]['name'], fontSize: 14, color: AppColors.blackColor, fontFamily: "Montserrat-semibold"),
                                  addHeight(5),
                                  addRegularTxt(controller.patientList[index]['about'], fontSize: 12)
                                ],
                              ),
                              Spacer(),
                              Checkbox(
                                  activeColor: AppColors.orangeColor2,

                                   shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                                value: controller.patientList[index]['select'], onChanged: (val){
                                  controller.patientList[index]['select'] = val;
                                  controller.update();
                              }) 
                             
                              // Icon(Icons.menu)           
            ],
          ),
          

        ),
      ),
    )
              // PatientCard(data:  controller.patientList[index],)
              ),
            ),
            Spacer(),
             Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(image: AssetImage(AppAssets.bgImg2),fit: BoxFit.fitHeight)
        // ),
        // color: AppColors.appColor.withOpacity(0.1),
        height: 130.h,
        child: Column(
          // mainAxisAlignmen,
          children: [
            CustomButton(
              width: Get.width /1.2 ,
              height: Get.height /13,
              text: "Share", onPressed: (){}),
            addHeight(20),
             Container(
              child: 
               InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.addNewMember);
                },
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      SvgPicture.asset(AppAssets.addPersonIcon),
                      addWidth(10),
                      addRegularTxt("Invite New Member", color: AppColors.orangeColor2),
                  ],
                             ),
               ),

             ).paddingOnly(
              bottom: 30
             ),
            //  addHeight(0),
          

          ],
        ),
      ),
          ],
        
      )
      )  ; 
        },
      ),
      bottomNavigationBar: const NavBar2(),
      // bottomNavigationBar: Container(
      //   // decoration: BoxDecoration(
      //   //   image: DecorationImage(image: AssetImage(AppAssets.bgImg2),fit: BoxFit.fitHeight)
      //   // ),
      //   // color: AppColors.appColor.withOpacity(0.1),
      //   height: 110.h,
      //   child: Column(
      //     // mainAxisAlignmen,
      //     children: [
      //       CustomButton(
      //         width: Get.width /1.2 ,
      //         height: Get.height /13,
      //         text: "Share", onPressed: (){}),
      //       addHeight(20),
      //        Container(
      //         child: 
      //          InkWell(
      //           onTap: (){
      //             Get.toNamed(AppRoutes.addNewMember);
      //           },
      //            child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //                 SvgPicture.asset(AppAssets.addPersonIcon),
      //                 addWidth(10),
      //                 addRegularTxt("Invite New Member", color: AppColors.orangeColor2),
      //             ],
      //                        ),
      //          ),

      //        ),
      //        addHeight(10),
          

      //     ],
      //   ),
      // ),
    );
  }
}


// class PatientCard extends StatefulWidget {
//   Map data;
//    PatientCard({super.key, required this.data});

//   @override
//   State<PatientCard> createState() => _PatientCardState();
// }

// class _PatientCardState extends State<PatientCard> {
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }