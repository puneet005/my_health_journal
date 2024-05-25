import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:my_health_journal/Screens/home/provider/provider_details_page.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/models/home/provider_view_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';
import 'package:shimmer/shimmer.dart';

class ProviderView extends StatefulWidget {
  const ProviderView({super.key});

  @override
  State<ProviderView> createState() => _ProviderViewState();
}

class _ProviderViewState extends State<ProviderView> {
  final bottomCont = Get.find<BottomBarController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomCont.getProviderListApi();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      // init: MyController(),
      initState: (_) {},
      builder: (_) {
        return  Scaffold(
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
                      horizontal: 14.h
                    ),
                    child: Column(
                      children: [
                        addHeight(30.h),
                        AppBar1(title: "Provider", notificationIcon: false,),
                        addHeight(16.h),
                        Card(          
                          elevation: 2.0,
                          color: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp)
                                ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(
                                  horizontal: 12.h,
                                  vertical: 6.h
                                ),          
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: AppColors.appColor.withOpacity(0.1),
                                  child: CircleAvatar(
                                    radius: 32,
                                    backgroundColor: AppColors.appColor.withOpacity(0.1),
                                    child: Container(
                                      width: 50.h,
                                      height: 50.h,
                                      decoration:  BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(image: bottomCont.selectedPatient.profile !=  null  ? NetworkImage("${ApiUrls.domain}${bottomCont.selectedPatient.profile}") :  AssetImage(AppAssets.patient1) as ImageProvider,
                                        fit: BoxFit.cover
                                         )
                                      ),
                                      // child: Image.asset(, height: 50.h,),
                                    ),
                                  ),
                                ),
                                addWidth(20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    addBoldTxt(bottomCont.selectedPatient.name ?? "", fontSize: 16),
                                    addBoldTxt(bottomCont.selectedPatient.relation ?? "", fontSize: 12, color: AppColors.greyColor5),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                                width: 45.h,
                                                height: 45.h,
                                                 decoration: BoxDecoration(
                                                   color: AppColors.whiteColor,
                                                   borderRadius: BorderRadius.circular(15),
                                                   border: Border.all(
                              color: AppColors.blackColor3.withOpacity(0.1)
                                                   ),
                                                 ),
                                               
                                                 child: InkWell(
                                                   onTap: (){
                                                    Get.toNamed(AppRoutes.addProvider);
                              // Get.back(); 
                              // Get.toNamed(AppRoutes.);
                                                   },
                                                   child:  Padding(
                              padding:  const EdgeInsets.all(8.0),
                              child: Center(
                                child:  SvgPicture.asset(AppAssets.addIcon),
                              ),
                                                   ),
                                                 ),
                                                ),
                                               ],
                                             ),
                           ),),
                           Expanded(child: 
                          bottomCont.getProviderListLoading ? 
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
                          children: List.generate(bottomCont.providerListData.length, (index) {
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
                              BottonSheetView(context,bottomCont.providerListData[index] );
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
                                  bottomCont.providerListData[index].reportInfo != null  ?
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage:  NetworkImage("${ApiUrls.domain}${bottomCont.providerListData[index].reportInfo}"),
                                                          //  child:   , 
                                  ) : CircleAvatar(
                                    radius: 30,
                                    child:  SvgPicture.asset(AppAssets.providersIcon),
                                  ),
                                  addWidth(10.h),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        addRegularTxt(bottomCont.providerListData[index].name ?? "", fontSize: 16.h),
                                        addHeadingTxtMedium(bottomCont.providerListData[index].specialization ?? "", fontSize: 14, fontFamily: 'Montserrat-light'),
                                        addHeadingTxtMedium(bottomCont.providerListData[index].phone ?? "", fontSize: 14, fontFamily: 'Montserrat-light', maxLines: 1, overflow: TextOverflow.ellipsis),
                                    
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
          )));
      },
    );
  }


BottonSheetView(BuildContext context, ProviderViewModelData? data){
    return showModalBottomSheet<void>(         
            context: context,
             isScrollControlled: true,
            builder: (BuildContext context) {
              return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: data!.reportInfo != null ? Get.height/ 1.4 :  Get.height/ 2.6,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            if(data!.reportInfo != null)
                            Container(
                              width: Get.width,
                              height: Get.height / 3,  
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: NetworkImage("${ApiUrls.domain}${data.reportInfo}"), fit: BoxFit.fill)
                              ),                          
                              // child: ,
                            
                            ),
                             addHeight(10),
                             Row(
                              children: [
                                
                               Expanded(
                                 flex: 4,
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     addBoldTxt("${data!.name ?? ""}", fontSize: 20, ).paddingOnly(
                                bottom: 6.h
                              ),
                               addRegularTxt("${data!.specialization ?? ""}", color: AppColors.greyColor4, fontSize: 12),
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
                                      addRegularTxt("Account", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("${data!.acNumber ?? ""}", fontSize: 16)
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
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      addRegularTxt("Date of Visit", color: AppColors.greyColor4, fontSize: 12).paddingOnly(bottom: 6),
                                      addBoldTxt("${data!.visitDate ?? ""}", fontSize: 16)
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
