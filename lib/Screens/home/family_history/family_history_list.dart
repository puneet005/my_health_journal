import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/Screens/widget/select_patient_card.dart';
import 'package:my_health_journal/common-widgets/custom_bottom_navigation3.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';
import 'package:shimmer/shimmer.dart';

class FamilyHistoryListUi extends StatefulWidget {
  const FamilyHistoryListUi({super.key});

  @override
  State<FamilyHistoryListUi> createState() => _FamilyHistoryListUiState();
}

class _FamilyHistoryListUiState extends State<FamilyHistoryListUi> {
 final bottomCont = Get.find<BottomBarController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomCont.getBothHistoryListApi(true);
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
                          horizontal: 14.h
                        ),
                        child: Column(
                          children: [
                            addHeight(50.h),
                            AppBar1(title: "Family History", notificationIcon: false,),
                            addHeight(16.h),
                            SelectPatientCard(route: AppRoutes.addFamilyHistory),
                            Expanded(child: 
                              bottomCont.getHistoryListLoading ? 
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
                              children: List.generate(bottomCont.familyHistoryList!.length, (index) {
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
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [                                    
                                        addRegularTxt(bottomCont.familyHistoryList![index].comment ?? "", fontSize: 16.h),                                                                  
                                      ],
                                    ),
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