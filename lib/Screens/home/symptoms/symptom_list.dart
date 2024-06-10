import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/Screens/widget/select_patient_card.dart';
import 'package:my_health_journal/common-widgets/custom_bottom_navigation3.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/models/home/symphtom_list_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:shimmer/shimmer.dart';

import '../../../resources/app_assets.dart';
import '../../../routers/app_routers.dart';

class SymptomsListUi extends StatefulWidget {
  const SymptomsListUi({super.key});

  @override
  State<SymptomsListUi> createState() => _SymptomsListUiState();
}

class _SymptomsListUiState extends State<SymptomsListUi> {
 final bottomCont = Get.find<BottomBarController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomCont.getSymptomsListApi();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      // init: MyController(),
      initState: (_) {},
      builder: (_) {
        return   Stack(       
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
              body: Container(                    
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
                          horizontal: 14.h, 
                          vertical: 8.h
                        ),
                        child: Column(
                          children: [
                            addHeight(50.h),
                            AppBar1(title: "Symptoms"),
                            addHeight(16.h),
                              SelectPatientCard(
                                route: AppRoutes.addSymptoms, 
                              ),
                               Expanded(child: 
                              bottomCont.getSymptomsListLoading ? 
                              ListView(
                                children: List.generate(5, (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: Get.width / 1.1,
                                    height: Get.height / 8,
                                    child: Shimmer.fromColors(
                                      baseColor: AppColors.bgColor.withOpacity(0.3),
                                      highlightColor: AppColors.appColor2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.appColor2,
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                      )
                                    ),
                                  ),
                                )),
                              ) : 
                              AnimationLimiter(
                             child:
                             ListView(
                              padding: EdgeInsets.zero,
                              children: List.generate(bottomCont.symptomsList!.length, (index) {
                                return  AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 500),
                                    child: SlideAnimation(
                                      verticalOffset: 50.0,
                                      child: FadeInAnimation(
                            child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  BottonSheetView(context,bottomCont.symptomsList![index] );
                                  // Get.to(ProviderDetails(data: bottomCont.providerListData[index]));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor, 
                                    borderRadius: BorderRadius.circular(20.h),
                                
                                  ),
                                  width: Get.width / 1.1,
                                  height: Get.height / 8,
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(
                                      horizontal: 10.h,                                
                                    ),
                                    child: Row(children: [
                                      bottomCont.symptomsList![index].file != null  ?
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage:  NetworkImage("${ApiUrls.domain}${bottomCont.symptomsList![index].file}"),
                                                              //  child:   , 
                                      ) : CircleAvatar(
                                        radius: 30,
                                        child:  SvgPicture.asset(AppAssets.symptomsIcon),
                                      ),
                                      addWidth(10.h),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [                                       
                                            addHeadingTxtMedium(bottomCont.symptomsList![index].comment ?? "", fontSize: 14, fontFamily: 'Montserrat-light', maxLines: 4, overflow: TextOverflow.ellipsis),
                                            // addHeadingTxtMedium(bottomCont.providerListData[index].phone ?? "", fontSize: 14, fontFamily: 'Montserrat-light', maxLines: 1, overflow: TextOverflow.ellipsis),                                    
                                          ],
                                        ),
                                      )
                                    ],),
                                  ),
                                ),
                              ),
                            ))
                                    )
            
                                );
                              }),
                             ),
                             
                             
                             
                      ),
                      ),
                          ])
              )),
              bottomNavigationBar: const NavBar2(),
              ),
          ],
        );
      
      },
    );
  }

  BottonSheetView(BuildContext context, SymphtomListModelData? data){
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
}