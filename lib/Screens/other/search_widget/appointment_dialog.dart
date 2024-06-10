 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/models/home/appointment_list_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

AppointMantUIBottonSheetView(BuildContext context, AppointmentListModelData? data){
    return showModalBottomSheet<void>(         
            context: context,
             isScrollControlled: true,
            builder: (BuildContext context) {
              return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: data!.photo != null ? Get.height/ 1.2 :  Get.height/ 2.2,
                  child: Center(
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children:  <Widget>[
                            addHeight(10),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Container(
                              width: Get.width /5,
                              height: 6,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.greyColor1,                               
                              ),
                            ), 
                            ],
                           ),
                            addHeight(10),
                            if(data!.photo != null)
                            Container(
                              width: Get.width,
                              height: Get.height / 3,  
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: NetworkImage("${ApiUrls.domain}${data.photo}"), fit: BoxFit.fill)
                              ),                          
                              // child: ,
                            
                            ),
                             addHeight(10),
                             if(data.getProvider != null)
                             Row(
                              children: [                                
                               Expanded(
                                 flex: 4,
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     addBoldTxt("${data.getProvider!.name ?? ""}", fontSize: 20, ).paddingOnly(
                                bottom: 6.h
                              ),
                               addRegularTxt("${data.getProvider!.specialization ?? ""}", color: AppColors.greyColor4, fontSize: 12),
                                  ],
                                )),
                                
                               const Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children:  [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.appColor,
                                      child: Icon(Icons.call, color: AppColors.whiteColor, size: 30,),
                                    ),
                                     CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.appColor,
                                      child: Icon(Icons.language, color: AppColors.whiteColor, size: 30,),
                                    )
                                  ],
                                ))
                              ],
                             ),
                             const Divider(
                              thickness: 1.2,
                            ),
                            addHeight(5),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      addRegularTxt("Date of visit", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("${data.visitDate ?? ""}", fontSize: 16)
                                    ],
                                  ),
                                // Expanded(
                                //   // width: Get.width/2,
                                //   child: 
                                // ),
                                //  Expanded(
                                //   // width: Get.width/2,
                                //   child: Column(
                                //     mainAxisAlignment: MainAxisAlignment.start,
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       addRegularTxt("Dosage", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                //       addBoldTxt("10mg", fontSize: 16)
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                             addHeight(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               
                                Expanded(
                                  // width: Get.width/2,
                                  child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      addRegularTxt("Comment", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("${data.providerComment ?? ""}", fontSize: 16)
                                    ],
                                  ),
                                ),
                                //  Expanded(
                                //   // width: Get.width/2,
                                //   child: Column(
                                //     mainAxisAlignment: MainAxisAlignment.start,
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       addRegularTxt("Category", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                //       addBoldTxt("Acetaminophen Analgesic", fontSize: 16)
                                //     ],
                                //   ),
                                // )
                              ],
                            ).paddingOnly(
                              bottom: 10
                            ),
                             const Divider(
                              thickness: 1.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               
                                Expanded(
                                  // width: Get.width/2,
                                  child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      addRegularTxt("Question", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("${data.providerComment ?? ""}", fontSize: 16)
                                    ],
                                  ),
                                ),
                               
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
                                  child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      addRegularTxt("Note", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("${data.note ?? ""}", fontSize: 16)
                                    ],
                                  ),
                                ),
                               
                              ],
                            ).paddingOnly(
                              bottom: 10
                            ),
                              //    addBoldTxt("${data!.name ?? ""}", fontSize: 20, ).paddingOnly(
                              //   bottom: 6.h
                              // ),
                              //  addRegularTxt("${data!.specialization ?? ""}", color: AppColors.greyColor4, fontSize: 12),
                
                            
                        // Text('GeeksforGeeks'),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }