import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/widget/patient_card.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/models/patient_list_model.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';

class PatientView extends StatefulWidget {
  const PatientView({super.key});

  @override
  State<PatientView> createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  final controller = Get.find<HomeController>();
  final bottomCont = Get.find<BottomBarController>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GetBuilder<BottomBarController>(
        initState: (_) {},
        builder: (_) {
          return Column(
            children: [
              addHeight(50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.addSymptoms);
                      },
                      child: addHeadingTxtMedium(
                        "Choose Patient",
                        fontSize: 20.sp,
                        color: AppColors.blackColor,
                        fontFamily: "Montserrat-semibold",
                      ),
                    ),
                    Spacer(),
                    // Additional buttons can be added here if needed
                  ],
                ),
              ),
              addHeight(20),
              bottomCont.patientList!.isEmpty
                  ? Container(
                      height: Get.height / 1.8,
                      child: Center(
                        child: addBoldTxt("Currently No One Added !!"),
                      ),
                    )
                  :  Container(
                      height: Get.height - 250.h,
                    child: AnimationLimiter(
                        child: ReorderableListView(
                          
                          shrinkWrap: true,
                          proxyDecorator: proxyDecorator,
                          onReorder: (int oldIndex, int newIndex) {
                            setState(() {
                              if (oldIndex < newIndex) {
                                newIndex -= 1;
                              }
                              PatientListMember item =
                                  bottomCont.patientList!.removeAt(oldIndex);
                              bottomCont.patientList!.insert(newIndex, item);
                            });
                          },
                          children: List.generate(
                            bottomCont.patientList!.length,
                            (index) {
                              return Container(
                                      key: ValueKey(bottomCont.patientList![index].id),
                                      color: Colors.transparent,
                                child: AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: PatientCard(
                                          data: bottomCont.patientList![index],
                                        ),
                                      // child: ListTile(
                                      //  key: ValueKey(bottomCont.patientList![index].id),
                                      //   title: 
                                      // ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                  ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: CustomButton(
                  height: 50,
                  width: Get.width / 1.2,
                  text: "Add new patient",
                  onPressed: () {
                    Get.toNamed(AppRoutes.addNewMember);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(0, 6, animValue)!;
          return Material(
            elevation: elevation,
            color: Colors.transparent,
            shadowColor:Colors.transparent,
            child: child,
          );
        },
        child: child,
      );
    }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:my_health_journal/Screens/widget/patient_card.dart';
// import 'package:my_health_journal/common-widgets/custom_button.dart';
// import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
// import 'package:my_health_journal/controllers/home_controller.dart';
// import 'package:my_health_journal/models/patient_list_model.dart';
// import 'package:my_health_journal/resources/app_assets.dart';
// import 'package:my_health_journal/resources/app_color.dart';
// import 'package:my_health_journal/resources/text_utility.dart';
// import 'package:my_health_journal/routers/app_routers.dart';

// class PatientView extends StatefulWidget {

//   const PatientView({super.key});

//   @override
//   State<PatientView> createState() => _PatientViewState();
// }

// class _PatientViewState extends State<PatientView> {
//   final controller = Get.find<HomeController>();
//   final bottomCont = Get.find<BottomBarController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body:
//         GetBuilder<BottomBarController>(
//           // init: MyController(),
//           initState: (_) {},
//           builder: (_) {
//             return Column(
//                   // physics: const NeverScrollableScrollPhysics(),
//                   // shrinkWrap: true,
//                   children: [
//                     addHeight(50),
//                     Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: 8.sp,),
//                       child: Row(
//                         // mainAxisAlignment: MainAxisAlignment,
//                         children: [
//                           InkWell(
//                             onTap: (){
//                               Get.toNamed(AppRoutes.addSymptoms);
//                             },
//                             child: addHeadingTxtMedium("Choose Patient", fontSize: 20.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-semibold" )),
//                             Spacer(),
//                           //  Container(
//                           //   width: 45.h,
//                           //   height: 45.h,
//                           //   decoration: BoxDecoration(
//                           //     color: AppColors.whiteColor,
//                           //     borderRadius: BorderRadius.circular( 15),
//                           //     border: Border.all(
//                           //       color: AppColors.blackColor3.withOpacity(0.1)
//                           //     ),
//                           //   ),
//                           //   child: InkWell(
//                           //     onTap: (){
//                           //       Get.toNamed(AppRoutes.setting);
//                   //     },
//                   //     child: Padding(
//                   //       padding: const EdgeInsets.all(8.0),
//                   //       child: Center(
//                   //         child:  SvgPicture.asset(AppAssets.settingIcon),
//                   //       ),
//                   //     ),
//                   //   ),
//                   //  ),
//                   //  addWidth(10),
//                   //   InkWell(
//                   //     onTap: (){
//                   //       Get.toNamed(AppRoutes.notification);
//                   //     },
//                   //     child: SvgPicture.asset(AppAssets.notificationIcon)),
//                   //  addWidth(10),
//                   // IconButton(onPressed: (){
//                   //   Get.toNamed(AppRoutes.shareScreen);
//                   // }, icon: Icon(Icons.share)),
//                   // addWidth(10),
//                 ],
//               ),
//             ),
//             addHeight(20),
//           bottomCont.patientList!.isEmpty ? Container(
//             height: Get.height / 1.8,
//             child: Center(
//             child: addBoldTxt("Currently No One Added !!"),
//             ),
//           ): 
//         AnimationLimiter(
//       child:  ReorderableListView(
//               shrinkWrap: true,
//               onReorder: (int oldIndex, int newIndex) {
//         setState(() {
//           if (oldIndex < newIndex) {
//             newIndex -= 1;
//           }
//         PatientListMember item = bottomCont.patientList!.removeAt(oldIndex);
//           bottomCont.patientList!.insert(newIndex, item);
//         });},
//               children: List.generate(bottomCont.patientList!.length, (index) {
            
//           return AnimationConfiguration.staggeredList(
//             position: index,
//             duration: const Duration(milliseconds: 500),
//             child: SlideAnimation(
//               verticalOffset: 50.0,
//               child: FadeInAnimation(
//                 child: ListTile(
//                   key: Key('$index'),
//                   title: PatientCard(data:  bottomCont.patientList![index],),
//                 )
//               ),
//             ),
//           );
//         },
//       ),
//     ),
//         ),
//           Spacer(),
//           Padding(
//   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//   child:   CustomButton(
//     height: 50,
//     width: Get.width / 1.2,
//     text: "Add new patient", onPressed: (){
//       Get.toNamed(AppRoutes.addNewMember);
//     }),
// ),
//       ],
//       ); 
//           },
//         )
//     );
//   }
// }


