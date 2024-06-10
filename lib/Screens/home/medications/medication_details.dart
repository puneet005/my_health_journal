import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/common-widgets/base_image_network.dart';
import 'package:my_health_journal/common-widgets/custom_bottom_navigation3.dart';
import 'package:my_health_journal/controllers/medical_summary_controller.dart';
import 'package:my_health_journal/models/home/medication_list_model.dart';
import 'package:my_health_journal/models/home/provider_view_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

// ignore: must_be_immutable
class MedicationDetailsView extends StatefulWidget {
  MedicationListModelData? data;
   MedicationDetailsView({super.key, required this.data});

  @override
  State<MedicationDetailsView> createState() => _MedicationDetailsViewState();
}

class _MedicationDetailsViewState extends State<MedicationDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MedicalSummaryController>(
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
                  child: Stack(                    
                    children: [
                      Container(
                        height: Get.height /2,
                        child: 
                      widget.data!.file != null ?
                      BaseImageNetwork(
                                  fit: BoxFit.cover,
                                  borderRadius: 10,
                                  link: "${ApiUrls.domain}${widget.data!.file}",
                                  concatBaseUrl: true,
                                  isAssetImage: false,
                                   height: Get.height /3,
                                  width: Get.width,
                                  topMargin: 2,
                                  rightMargin: 2,
                                  leftMargin: 2,
                                  bottomMargin: 2,
                                  errorWidget:SvgPicture.asset(AppAssets.medicationsIcon,  height: Get.height /3, width: Get.width, fit: BoxFit.fill,)
                                ):Center(child: SvgPicture.asset(AppAssets.medicationsIcon,  height: Get.height /3, width: Get.width, fit: BoxFit.fill,))
                    // Image.network("", height: Get.height /3, width: Get.width, fit: BoxFit.fill,):  ,
                      ),
                  //  addHeight(30),
                 Positioned(
                      top: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppBar1(title: "", notificationIcon: false,),
                      ),
                    ),
                    // addHeight(10),                    
                    Positioned(
                      bottom: 0,
                      child: Container(
                      width: Get.width,
                      height: Get.height /1.8,
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
                          addBoldTxt("${widget.data!.name ?? ""}", fontSize: 20, ).paddingOnly(
                              bottom: 6.h
                            ),

                            Row(
                              children: [
                               addRegularTxt("${widget.data!.dosage ?? ""}", color: AppColors.greyColor4, fontSize: 12),
                              //  addRegularTxt("120ml", color: AppColors.greyColor4, fontSize: 12)
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
                                      addBoldTxt("${widget.data!.dosageForm ?? ""}", fontSize: 16)
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
                                      addBoldTxt("${widget.data!.dosage ?? ""}", fontSize: 16)
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
                                      addRegularTxt("Start Date", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("${widget.data!.startDate ?? ""}", fontSize: 16)
                                    ],
                                  ),
                                ),
                                 Expanded(
                                  // width: Get.width/2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      addRegularTxt("End Date", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("${widget.data!.endDate ?? ""}", fontSize: 16)
                                    ],
                                  ),
                                )
                              ],
                            ).paddingOnly(
                              bottom: 10
                            ),
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
                                      addRegularTxt("Which Time", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("${widget.data!.administrationOption ?? ""}", fontSize: 16)
                                    ],
                                  ),
                                ),
                                 Expanded(
                                  // width: Get.width/2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      addRegularTxt("Prescription", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("${widget.data!.prescription ?? ""}", fontSize: 16)
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
                            if(widget.data!.custom != null)
                            addBoldTxt("Custom", fontSize: 16).paddingOnly(
                              bottom: 5
                            ),
                              if(widget.data!.custom != null)
                             addRegularTxt("${widget.data!.custom }", color: AppColors.greyColor4, fontSize: 13).paddingOnly(bottom: 6).paddingOnly(
                              bottom: 10.h
                             ),

                              if(widget.data!.comment != null)
                            addBoldTxt("Comment", fontSize: 16).paddingOnly(
                              bottom: 5
                            ),
                              if(widget.data!.comment != null)
                             addRegularTxt("${widget.data!.comment }", color: AppColors.greyColor4, fontSize: 13).paddingOnly(bottom: 6).paddingOnly(
                              bottom: 10.h
                             ),
                      
                          ],
                        ),
                      ),
                                          ),
                    )
                    ]));})
      
    ,bottomNavigationBar: const NavBar2(),);
  }

  
}