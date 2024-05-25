// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:my_health_journal/Screens/widget/appbar.dart';
// import 'package:my_health_journal/controllers/medical_summary_controller.dart';
// import 'package:my_health_journal/models/home/provider_view_model.dart';
// import 'package:my_health_journal/resources/api_constant.dart';
// import 'package:my_health_journal/resources/app_assets.dart';
// import 'package:my_health_journal/resources/app_color.dart';
// import 'package:my_health_journal/resources/text_utility.dart';

// class ProviderDetails extends StatefulWidget {
//   ProviderViewModelData? data;
//    ProviderDetails({super.key, required this.data});

//   @override
//   State<ProviderDetails> createState() => _ProviderDetailsState();
// }

// class _ProviderDetailsState extends State<ProviderDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder<MedicalSummaryController>(
//         // init: MyController(),
//         initState: (_) {},
//         builder: (ctrl) {
//           return Container(                    
//                width: double.infinity,
//                       height: Get.height,
//                          decoration: const BoxDecoration(  
//                           color: AppColors.bgColor,          
//                     image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
//                     fit: BoxFit.fill
//                     )
//                   ),
//                   child: Stack(
//                     // shrinkWrap: true,
//                     // physics: NeverScrollableScrollPhysics(),
//                     children: [
//                       Container(
//  height: Get.height /2,
//                         child: 
//                       widget.data!.reportInfo != null ?
//                     Image.network("${ApiUrls.domain}${widget.data!.reportInfo}", height: Get.height /3, width: Get.width, fit: BoxFit.fill,): Center(child: SvgPicture.asset(AppAssets.providersIcon,  height: Get.height /3, width: Get.width, fit: BoxFit.fill,)) ,
//                       ),
//                   //  addHeight(30),
//                  Positioned(
//                       top: 30,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: AppBar1(title: "", notificationIcon: false,),
//                       ),
//                     ),
//                     // addHeight(10),                    
//                     Positioned(
//                       bottom: 0,
//                       child: Container(
//                       width: Get.width,
//                       height: Get.height /1.8,
//                       decoration: BoxDecoration(
//                         color: AppColors.whiteColor,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(30.h),
//                           topRight: Radius.circular(30.h)
//                         )
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 20.h,
//                           vertical: 10.h
//                         ),
//                         child: ListView(
//                           children: [
//                            Row(
//                             children: [
                              
//                              Expanded(
//                                flex: 4,
//                               child:  Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                    addBoldTxt("${widget.data!.name ?? ""}", fontSize: 20, ).paddingOnly(
//                               bottom: 6.h
//                             ),
//                              addRegularTxt("${widget.data!.specialization ?? ""}", color: AppColors.greyColor4, fontSize: 12),
//                                 ],
//                               )),
                              
//                              const Expanded(
//                                 flex: 2,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children:  [
//                                   CircleAvatar(
//                                     radius: 25,
//                                     backgroundColor: AppColors.appColor,
//                                     child: Icon(Icons.call, color: AppColors.whiteColor, size: 30,),
//                                   ),
//                                    CircleAvatar(
//                                     radius: 25,
//                                     backgroundColor: AppColors.appColor,
//                                     child: Icon(Icons.language, color: AppColors.whiteColor, size: 30,),
//                                   )
//                                 ],
//                               ))
//                             ],
//                            ),
//                            addHeight(20),
//                             // Row(
//                             //   children: [
                              
//                             //   //  addRegularTxt("120ml", color: AppColors.greyColor4, fontSize: 12)
//                             //   ],
//                             // ).paddingOnly(
//                             //   bottom: 6.h
//                             // ),
//                             const Divider(
//                               thickness: 1.2,
//                             ),
//                             addHeight(5),
//                             Row(
//                               // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       addRegularTxt("Account", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
//                                       addBoldTxt("${widget.data!.acNumber ?? ""}", fontSize: 16)
//                                     ],
//                                   ),
//                                 // Expanded(
//                                 //   // width: Get.width/2,
//                                 //   child: 
//                                 // ),
//                                 //  Expanded(
//                                 //   // width: Get.width/2,
//                                 //   child: Column(
//                                 //     mainAxisAlignment: MainAxisAlignment.start,
//                                 //     crossAxisAlignment: CrossAxisAlignment.start,
//                                 //     children: [
//                                 //       addRegularTxt("Dosage", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
//                                 //       addBoldTxt("10mg", fontSize: 16)
//                                 //     ],
//                                 //   ),
//                                 // )
//                               ],
//                             ),
//                              addHeight(20),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       addRegularTxt("Date of Visit", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
//                                       addBoldTxt("${widget.data!.visitDate ?? ""}", fontSize: 16)
//                                     ],
//                                   ),
//                                 // Expanded(
//                                 //   // width: Get.width/2,
//                                 //   child: 
//                                 // ),
//                                 //  Expanded(
//                                 //   // width: Get.width/2,
//                                 //   child: Column(
//                                 //     mainAxisAlignment: MainAxisAlignment.start,
//                                 //     crossAxisAlignment: CrossAxisAlignment.start,
//                                 //     children: [
//                                 //       addRegularTxt("Category", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
//                                 //       addBoldTxt("Acetaminophen Analgesic", fontSize: 16)
//                                 //     ],
//                                 //   ),
//                                 // )
//                               ],
//                             ).paddingOnly(
//                               bottom: 10
//                             ),
//                              const Divider(
//                               thickness: 1.2,
//                             ),
//                             // addHeight(5),
//                             // addBoldTxt("Description", fontSize: 16).paddingOnly(
//                             //   bottom: 5
//                             // ),
//                             //  addRegularTxt("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", color: AppColors.greyColor4, fontSize: 13).paddingOnly(bottom: 6).paddingOnly(
//                             //   bottom: 10.h
//                             //  ),
                      
                      
//                           ],
//                         ),
//                       ),
//                                           ),
//                     )
//                     ]));})
      
//     );
//   }

  
// }