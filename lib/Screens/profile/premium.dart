import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:my_health_journal/common-widgets/custom_bottom_navigation3.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/controllers/in_app_purch_controller.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

import '../../controllers/profile_controller.dart';
class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  final controller = Get.find<ProfileContorller>();
  final inAppCtrl = Get.find<InAppPurchaseController>();
//  StreamSubscription<List<PurchaseDetails>>? _subscription;
  @override
  void initState() {
inAppCtrl.initIAP();
    super.initState();
    
    //     final Stream purchaseUpdated =
    //     InAppPurchase.instance.purchaseStream;
    // _subscription = purchaseUpdated.listen((purchaseDetailsList) {
    //   _listenToPurchaseUpdated(purchaseDetailsList);
    // }, onDone: () {
    //   _subscription!.cancel();
    // }, onError: (error) {
    //   // handle error here.
    // }) as StreamSubscription<List<PurchaseDetails>>?;
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
       
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
          body:   GetBuilder<ProfileContorller>(
            // init: MyController(),
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
                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 16.h
                        ),
                        child: ListView(
                          children: [
                           addHeight(30),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if(controller.profileData.data != null)
                               Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.appColor.withOpacity(0.4),
                                        image: DecorationImage(image: controller.profileData.data!.profile == null ?  AssetImage(AppAssets.profileIcon) : NetworkImage("${ApiUrls.domain}${controller.profileData.data!.profile!}") as ImageProvider, 
                                        fit: BoxFit.fill
                                        )
                                      )
                                    ),
                              // Container(
                              //   child:   controller.profileData.data!.profile != null ? Image.network("${ApiUrls.domain}${controller.profileData.data!.profile!}") : Image.asset(AppAssets.profileIcon, height: 50.h,),
                              // ),
                              addWidth(20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addBoldTxt(controller.profileData.data!.name ?? "", fontSize: 16),
                                  addBoldTxt("Full access subscription", fontSize: 12, color: AppColors.greyColor5),
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
                            Get.back();
                            // Get.toNamed(AppRoutes.);
                          },
                          child:  Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Center(
                              child:  SvgPicture.asset(AppAssets.cancelIcon),
                            ),
                          ),
                        ),
                       ),
                       
                        
                            ],
                           ),
                           addHeight(20),
                            addBoldTxt("Choose a plan", fontSize:  25, ),
                            addHeight(5),
                            addBoldTxt("Monthly or yearly? It's your call", fontSize: 12, color: AppColors.greyColor5),
                            addHeight(20),
                          //  Row(children: [
                           
                          //  ],),
                           Container(
                            decoration: BoxDecoration(
                              color:  AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: AppColors.orangeColor,
                                width: 2
                              )
                            ),
                            child: 
                            InkWell(
                              onTap: (){
                                // Get.toNamed(AppRoutes.premium);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    addLightTxt("Premium User Plan", fontSize: 15),
                                    addHeight(8),
                                    addBoldTxt("\$11.00", fontSize: 24)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          addHeight(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            SvgPicture.asset(AppAssets.acceptIcons),
                            addWidth(10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addBoldTxt("Access to add multiple patients"),
                                  addHeight(5),
                                  const Divider(
                                    thickness: 1.2,
                                    color: AppColors.borderColor,
                                  )
                                ],
                              ),
                            )
                          ],),
                           addHeight(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            SvgPicture.asset(AppAssets.acceptIcons),
                            addWidth(10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addBoldTxt("Ability to write comments"),
                                  addHeight(5),
                                  const Divider(
                                    thickness: 1.2,
                                    color: AppColors.borderColor,
                                  )
                                ],
                              ),
                            )
                          ],),
                           addHeight(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            SvgPicture.asset(AppAssets.acceptIcons),
                            addWidth(10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addBoldTxt("User activity notifications"),
                                  addHeight(5),
                                  const Divider(
                                    thickness: 1.2,
                                    color: AppColors.borderColor,
                                  )
                                ],
                              ),
                            )
                          ],),
                           addHeight(10),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //   SvgPicture.asset(AppAssets.acceptIcons),
                          //   addWidth(10),
                          //   Expanded(
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         addBoldTxt("Access to edit & delete patients"),
                          //         addHeight(5),
                          //         const Divider(
                          //           thickness: 1.2,
                          //           color: AppColors.borderColor,
                          //         )
                          //       ],
                          //     ),
                          //   )
                          // ],),
        addHeight(30),
                           Padding(
           padding: const EdgeInsets.symmetric(vertical: 10,),
          child:   CustomButton(
        btnColor: AppColors.appColor,
        height: 50,
        width: Get.width ,
        text: "Go to Payment", onPressed: (){
inAppCtrl.buyPlan(productId: "oneTime11");
        }),
        ),
        addHeight(20),
        
                          ])));})
                         ,bottomNavigationBar: const NavBar2(),),
      ],
    );
  }


  // Purchase Handle 
  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
  purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.status == PurchaseStatus.pending) {
      // _showPendingUI();
    } else {
      if (purchaseDetails.status == PurchaseStatus.error) {
        // _handleError(purchaseDetails.error!);
      } else if (purchaseDetails.status == PurchaseStatus.purchased ||
                 purchaseDetails.status == PurchaseStatus.restored) {
        // bool valid = await _verifyPurchase(purchaseDetails);
        // if (valid) {
        //   // _deliverProduct(purchaseDetails);
        // } else {
        //   // _handleInvalidPurchase(purchaseDetails);
        // }
      }
      if (purchaseDetails.pendingCompletePurchase) {
        await InAppPurchase.instance  
            .completePurchase(purchaseDetails);
      }
    }
  });
}
}