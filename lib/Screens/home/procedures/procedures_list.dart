import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// import 'package:my_health_journal/Screens/home/medications/medication_details.dart';
import 'package:my_health_journal/Screens/home/procedures/procedures_details.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/Screens/widget/select_patient_card.dart';
import 'package:my_health_journal/common-widgets/base_image_network.dart';
import 'package:my_health_journal/common-widgets/custom_bottom_navigation3.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';
import 'package:shimmer/shimmer.dart';

class ProceduresListUi extends StatefulWidget {
  const ProceduresListUi({super.key});

  @override
  State<ProceduresListUi> createState() => _ProceduresListUiState();
}

class _ProceduresListUiState extends State<ProceduresListUi> {
final bottomCont = Get.find<BottomBarController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomCont.getProceduresListApi();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
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
                          horizontal: 14.h
                        ),
                        child: Column(
                          children: [
                            addHeight(50.h),
                            AppBar1(title: "Procedures", notificationIcon: false,),
                            addHeight(16.h),
                            SelectPatientCard(route: AppRoutes.addProcedures),
                            Expanded(child: 
                              bottomCont.getProceduresListLoading ? 
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
                              children: List.generate(bottomCont.proceduresList!.length, (index) {
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
                                  // BottonSheetView(context,bottomCont.appointmentList![index] );
                                    Get.to(ProceduresDetailsView(data: bottomCont.proceduresList![index]));
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
                                      bottomCont.proceduresList![index].file != null  ?
                                      // CircleAvatar(
                                      //   radius: 30,
                                      //   backgroundImage:  NetworkImage("${ApiUrls.domain}${bottomCont.medicationList![index].file}"),
                                      //                         //  child:   , 
                                      // ) 
                                       BaseImageNetwork(
                                      fit: BoxFit.cover,
                                      borderRadius: 40,
                                      link: "${ApiUrls.domain}${bottomCont.proceduresList![index].file}",
                                      concatBaseUrl: true,
                                      isAssetImage: false,
                                      height: 60.h,
                                      width: 60.h,
                                      topMargin: 2,
                                      rightMargin: 2,
                                      leftMargin: 2,
                                      bottomMargin: 2,
                                      errorWidget: const Icon(Icons.error, size: 40),
                                    )
                                      : CircleAvatar(
                                        radius: 30,
                                        child:  SvgPicture.asset(AppAssets.proceduresIcon),
                                      ),
                                      addWidth(10.h),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // if(bottomCont.medicationList![index].getProvider != null)
                                            addRegularTxt("${bottomCont.proceduresList![index].type ?? ""}", fontSize: 16.h),
                                            addHeadingTxtMedium("${bottomCont.proceduresList![index].dateOfProcedure ?? ""}", fontSize: 14, fontFamily: 'Montserrat-light'),
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
}