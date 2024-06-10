import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/Screens/widget/select_patient_card.dart';
import 'package:my_health_journal/common-widgets/custom_bottom_navigation3.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/models/home/appointment_list_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';
import 'package:shimmer/shimmer.dart';

class AppointmentListUi extends StatefulWidget {
  const AppointmentListUi({super.key});

  @override
  State<AppointmentListUi> createState() => _AppointmentListUiState();
}

class _AppointmentListUiState extends State<AppointmentListUi> {
  final bottomCont = Get.find<BottomBarController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomCont.getAppointmentListApi();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      // init: MyController(),
      initState: (_) {},
      builder: (_) {
        return  Stack(
       
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
                            AppBar1(title: "Appointment", notificationIcon: false,),
                            addHeight(16.h),                        
                               SelectPatientCard(route: AppRoutes.addDoctorsVisit),
                               Expanded(child: 
                              bottomCont.getappointmentListLoading ? 
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
                              children: List.generate(bottomCont.appointmentList!.length, (index) {
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
                                  BottonSheetView(context,bottomCont.appointmentList![index] );
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
                                      bottomCont.appointmentList![index].photo != null  ?
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage:  NetworkImage("${ApiUrls.domain}${bottomCont.appointmentList![index].photo}"),
                                                              //  child:   , 
                                      ) : CircleAvatar(
                                        radius: 30,
                                        child:  SvgPicture.asset(AppAssets.appointmentIcon),
                                      ),
                                      addWidth(10.h),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            if(bottomCont.appointmentList![index].getProvider != null)
                                            addRegularTxt(bottomCont.appointmentList![index].getProvider!.name ?? "", fontSize: 16.h),
                                            addHeadingTxtMedium(bottomCont.appointmentList![index].visitDate ?? "", fontSize: 14, fontFamily: 'Montserrat-light'),
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


  BottonSheetView(BuildContext context, AppointmentListModelData? data){
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
}