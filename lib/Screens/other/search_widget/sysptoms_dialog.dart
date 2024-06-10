import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/models/home/symphtom_list_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

SysptomsBottonSheetView(BuildContext context, SymphtomListModelData? data){
    return showModalBottomSheet<void>(         
            context: context,
             isScrollControlled: true,
            builder: (BuildContext context) {
              return  Padding(
                padding: const EdgeInsets.fromLTRB(10, 16, 10, 2),
                child: SizedBox(
                  height: data!.file != null ? Get.height/ 1.5 :  Get.height/ 2.2,
                  child: Center(
                    child: ListView(                     
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
                             addHeight(20),
                            if(data.file != null)
                            Container(
                              width: Get.width,
                              height: Get.height / 3,  
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: NetworkImage("${ApiUrls.domain}${data.file}"), fit: BoxFit.fill)
                              ),                          
                              // child: ,
                            
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
                                      addRegularTxt("Comment", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("${data.comment ?? ""}", fontSize: 16)
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
                                      addRegularTxt("Date and Time", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("${data.date ?? ""} ${data.time ?? ""}", fontSize: 16)
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