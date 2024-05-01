import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/controllers/medical_summary_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class MedicationDetails extends StatefulWidget {
  const MedicationDetails({super.key});

  @override
  State<MedicationDetails> createState() => _MedicalDetailsState();
}

class _MedicalDetailsState extends State<MedicationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MedicalSummaryController>(
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
                  child: Column(
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    children: [
                   addHeight(30),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppBar1(title: ""),
                    ),
                    addHeight(10),
                    Image.asset(AppAssets.medical5, height: Get.height /3),
                    Expanded(
                      child: Container(
                      // width: Get.width,
                      // height: Get.height /1,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.h),
                          topRight: Radius.circular(30.h)
                        )
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.h,
                          vertical: 10.h
                        ),
                        child: ListView(
                          children: [
                            addBoldTxt("Oxycodone", fontSize: 20, ).paddingOnly(
                              bottom: 6.h
                            ),

                            Row(
                              children: [
                               addRegularTxt("10mg/ml  |  ", color: AppColors.greyColor4, fontSize: 12),
                               addRegularTxt("120ml", color: AppColors.greyColor4, fontSize: 12)
                              ],
                            ).paddingOnly(
                              bottom: 6.h
                            ),
                            const Divider(
                              thickness: 1.2,
                            ),
                            addHeight(5),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  // width: Get.width/2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      addRegularTxt("Dosage Form", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("Oral Syringe", fontSize: 16)
                                    ],
                                  ),
                                ),
                                 Expanded(
                                  // width: Get.width/2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      addRegularTxt("Dosage", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("10mg", fontSize: 16)
                                    ],
                                  ),
                                )
                              ],
                            ),
                             addHeight(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  // width: Get.width/2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      addRegularTxt("Active Ubstrance", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("Hydrochloride", fontSize: 16)
                                    ],
                                  ),
                                ),
                                 Expanded(
                                  // width: Get.width/2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      addRegularTxt("Category", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("Acetaminophen Analgesic", fontSize: 16)
                                    ],
                                  ),
                                )
                              ],
                            ).paddingOnly(
                              bottom: 10
                            ),
                             const Divider(
                              thickness: 1.2,
                            ),
                            addHeight(5),
                            addBoldTxt("Description", fontSize: 16).paddingOnly(
                              bottom: 5
                            ),
                             addRegularTxt("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", color: AppColors.greyColor4, fontSize: 13).paddingOnly(bottom: 6).paddingOnly(
                              bottom: 10.h
                             ),


                          ],
                        ),
                      ),
                    )
                    )
                    ]));})
      
    );
  }
}