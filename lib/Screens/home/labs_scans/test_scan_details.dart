import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_health_journal/Screens/home/labs_scans/test_scan_add_comment.dart';
import 'package:my_health_journal/Screens/home/procedures/procedures_add_comment.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/common-widgets/base_image_network.dart';
import 'package:my_health_journal/common-widgets/custom_bottom_navigation3.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/controllers/medical_summary_controller.dart';
import 'package:my_health_journal/models/home/get_test_scan_model.dart';
// import 'package:my_health_journal/models/home/medication_list_model.dart'

// import 'package:my_health_journal/models/home/provider_view_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';


// ignore: must_be_immutable
class TestScansDetailsView extends StatefulWidget {
  GetTestScanModelData? data;
   TestScansDetailsView({super.key, required this.data});

  @override
  State<TestScansDetailsView> createState() => _TestScansDetailsViewState();
}

class _TestScansDetailsViewState extends State<TestScansDetailsView> {
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
                        width: Get.width,
                        height: Get.height /2.7,
                        child: 
                      widget.data!.file != null ?
                      BaseImageNetwork(
                                  fit: BoxFit.cover,
                                  borderRadius: 0,
                                  link: "${ApiUrls.domain}${widget.data!.file}",
                                  concatBaseUrl: true,
                                  isAssetImage: false,
                                   height: Get.height /2,
                                  width: Get.width,
                                  topMargin: 0,
                                  rightMargin: 0,
                                  leftMargin: 0,
                                  bottomMargin: 0,
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
                               addRegularTxt("${widget.data!.scanTest ?? ""}", color: AppColors.greyColor4, fontSize: 12),
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
                                      addRegularTxt("Provider", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("${widget.data!.provider ?? ""}", fontSize: 16)
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                             addHeight(10),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Expanded(
                            //       // width: Get.width/2,
                            //       child: Column(
                            //         mainAxisAlignment: MainAxisAlignment.start,
                            //         crossAxisAlignment: CrossAxisAlignment.start,
                            //         children: [
                            //           addRegularTxt("Start Date", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                            //           addBoldTxt("${widget.data!.startDate ?? ""}", fontSize: 16)
                            //         ],
                            //       ),
                            //     ),
                            //      Expanded(
                            //       // width: Get.width/2,
                            //       child: Column(
                            //         mainAxisAlignment: MainAxisAlignment.start,
                            //         crossAxisAlignment: CrossAxisAlignment.start,
                            //         children: [
                            //           addRegularTxt("End Date", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                            //           addBoldTxt("${widget.data!.endDate ?? ""}", fontSize: 16)
                            //         ],
                            //       ),
                            //     )
                            //   ],
                            // ).paddingOnly(
                            //   bottom: 10
                            // ),
                            
                             const Divider(
                              thickness: 1.2,
                            ),
                            addHeight(5),
                            widget.data!.comments != null ?
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               addBoldTxt("History", fontSize: 16).paddingOnly(
                              bottom: 5
                            ),
                         InkWell(
                          onTap: (){
                            Get.to(TestScansAddComment(testId: widget.data!.id.toString(),));
                          },
                           child: CircleAvatar(
                            radius: 15.h,
                            backgroundColor: AppColors.appColor,
                            child: Icon(Icons.add, color: AppColors.whiteColor,),),
                         )
                            ],
                           ): CustomButton(text: "Add Comment", onPressed: (){
                              Get.to(TestScansAddComment(testId: widget.data!.id.toString(),));

                            }),
                              if(widget.data!.comments != null)
                              ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: 
                              
                              List.generate(widget.data!.comments!.length, (index) => 
                              Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        
        decoration: BoxDecoration(
          color: AppColors.whiteColor, 
          borderRadius: BorderRadius.circular(10)
    
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if(widget.data!.comments![index].userDetails != null)
              Row(
                children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: widget.data!.comments![index].userDetails!.profile != null ?  
                   Image.network("${ApiUrls.domain}${widget.data!.comments![index].userDetails!.profile}",
                    fit: BoxFit.fill,
                     width: 60,
                   height: 60,
                  ):
                 Image.asset(AppAssets.profileIcon, width: 60,
                 height: 60,),
                ),
                  addWidth(10),
                 Expanded(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      addBoldTxt(widget.data!.comments![index].userDetails!.name.toString()),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // addHeadingTxtMedium("", fontSize: 12, color: AppColors.greyColor4, ),
                          // addWidth(10),
                          // addHeadingTxtMedium("|", fontSize: 16, color: AppColors.greyColor4,),
                          // addWidth(10),
                          addHeadingTxtMedium("${widget.data!.comments![index].time}", fontSize: 12, color: AppColors.greyColor4,)
                        ],
                      )
                    ],
                   ),
                 ), 
                //  IconButton(onPressed: (){
                //   if(widget.type == "lab"){
                //         controller.testScanCommitList.removeAt(widget.index);
                //   }
                //   else{
                //       controller.proceduresMainCommitList.removeAt(widget.index);
                //   }
                //   controller.update();
                //  }, icon: Icon(Icons.delete, color: AppColors.red,))
                ],
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text.rich(
                 TextSpan(
                   children: [
                     const TextSpan(text: 'Comment: ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,)),     
                     TextSpan(text: widget.data!.comments![index].title, style: const TextStyle(fontSize: 12,) ),
                   ],
                 ),
               ),
               )
        
            ],
          ),
        ),
      ),
    )
                              )),

                              
                      
                          ],
                        ),
                      ),
                                          ),
                    )
                    ]));}),
                    bottomNavigationBar: const NavBar2(),
      
    );
  }

  
}