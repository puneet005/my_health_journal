import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:my_health_journal/common-widgets/custom_loader.dart';
import 'package:my_health_journal/controllers/profile_controller.dart';


class InAppPurchaseController extends GetxController {
  RxInt productIndex = 0.obs;

  final List<String> _kProductIds = <String>[
  "oneTime11",
  ];

  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<ProductDetails> _products = <ProductDetails>[];

  List<ProductDetails> get productsDetails => _products;

  final List<ProductDetails> _queryProduct = <ProductDetails>[];

  List<ProductDetails> get queryProduct => _queryProduct;
  

  void initIAP() {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;
    _subscription =
        purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      if (kDebugMode) {
        print('somen ${purchaseDetailsList.length}');
      }
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (Object error) {
      // handle error here.
      if (kDebugMode) {
        print("sdlsf");
      }
    });
    initStoreInfo();
  }

  @override
  onInit() {
    super.onInit();
    initIAP();
  }

  Future<void> initStoreInfo() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      _products = <ProductDetails>[];
      update();
      return;
    }

    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }

    final ProductDetailsResponse productDetailResponse =
        await _inAppPurchase.queryProductDetails(
            (_kProductIds)
                .toSet());

    if (kDebugMode) {
      print(
          'productDetailsResponse ${productDetailResponse.productDetails.length}');
    }
    if (productDetailResponse.error != null) {
      _products = productDetailResponse.productDetails;
      update();
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      _products = productDetailResponse.productDetails;
      update();
      return;
    }

    // final List<String> consumables = await ConsumableStore.load();

    _products = productDetailResponse.productDetails;
    log("${productDetailResponse.productDetails}");
    // _consumables = consumables;
    update();
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    isPlanShown.value = false;
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      log("purchaseDetails ${purchaseDetails.productID}");
      if (purchaseDetails.status == PurchaseStatus.pending) {
        showPendingUI();
      } else {
        if (kDebugMode) {
          print('purchaseDetails.status => ${purchaseDetails.status}');
        }
        if (purchaseDetails.status == PurchaseStatus.error ||
            purchaseDetails.status == PurchaseStatus.canceled) {
          if (kDebugMode) {
            print('handleError');
          }
          handleError();
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          final bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            log("purchaseDetails ${purchaseDetails.productID}");
            log("amount ${_products[0].price}");
            var data = {
              "productId": purchaseDetails.productID,
              "transactionId": purchaseDetails.purchaseID,
              "transactionDate": purchaseDetails.transactionDate,
              "status": purchaseDetails.status.name,
              
              "pendingCompletePurchase":
                  purchaseDetails.pendingCompletePurchase,
              "verificationData": {
                'localVerificationData':
                    purchaseDetails.verificationData.localVerificationData,
                'source': purchaseDetails.verificationData.source,
                'serverVerificationData':
                    purchaseDetails.verificationData.serverVerificationData,
              }
            };

            log("purchaseDetails data  $data");
            log("purchaseDetails status ${purchaseDetails.status}");
            log("purchaseDetails productID ${purchaseDetails.productID}");
            // log("purchaseDetails ${purchaseDetails.}");
            log("purchaseDetails verificationData ${purchaseDetails.verificationData}");
            String? transactionIdentifier;

            if (Platform.isIOS) {
              final transactions = await SKPaymentQueueWrapper().transactions();
              // ignore: avoid_function_literals_in_foreach_calls
              transactions.forEach((transaction) async {
                if (transaction.originalTransaction?.transactionIdentifier !=
                    null) {
                  transactionIdentifier =
                      transaction.originalTransaction?.transactionIdentifier;
                }
              });
            }
            Get.find<ProfileContorller>().BuyPremiumApi(
              orderId: purchaseDetails.productID, 
              status: purchaseDetails.status.name, 
              transactionDate: purchaseDetails.transactionDate!,               
              transitionId: purchaseDetails.purchaseID!.toString(), 
              productId: _kProductIds[0], 
              paymentMethod: Platform.isIOS ? "Apple": "Android", 
              amount: _products[0].price);
            // unawaited(deliverProduct(purchaseDetails));
            // call the backend api
            
            // unawaited(subscribeProduct(
            //     productIndex: productIndex.value,
            //     purchaseDetails: purchaseDetails,
            //     transactionIdentifier: transactionIdentifier));
          } else {
            _handleInvalidPurchase(purchaseDetails);
            return;
          }
        }
        if (Platform.isAndroid) {
          // if (!_kAutoConsume && purchaseDetails.productID == _kConsumableId) {
          //   final InAppPurchaseAndroidPlatformAddition androidAddition =
          //   _inAppPurchase.getPlatformAddition<
          //       InAppPurchaseAndroidPlatformAddition>();
          //   await androidAddition.consumePurchase(purchaseDetails);
          // }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    }
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    // IMPORTANT!! Always verify a purchase before delivering the product.
    // For the purpose of an example, we directly return true.
    return Future<bool>.value(true);
  }

  void _handleInvalidPurchase(PurchaseDetails purchaseDetails) {
    // handle invalid purchase here if  _verifyPurchase` failed.
  }

  Future<void> deliverProduct(PurchaseDetails purchaseDetails) async {
    // IMPORTANT!! Always verify purchase details before delivering the product.
    // if (purchaseDetails.productID == _kConsumableId) {
    //   // await ConsumableStore.save(purchaseDetails.purchaseID!);
    //   // final List<String> consumables = await ConsumableStore.load();
    //   setState(() {
    //     _purchasePending = false;
    //     // _consumables = consumables;
    //   });
    // } else {
    //   setState(() {
    //     _purchases.add(purchaseDetails);
    //     _purchasePending = false;
    //   });
    // }
  }
  // Future<void> subscribeProduct(
  //     {required int productIndex,
  //     required PurchaseDetails purchaseDetails,
  //     String? transactionIdentifier}) async {
  //   log("========================************Subscribe********================");
  //   Map<String, dynamic> data = {
  //     // "planId": purchaseDetails.productID,
  //     "trial": "7-Days Free Trial",
  //     "orderId": purchaseDetails.purchaseID,
  //     "status": purchaseDetails.status.name,
  //     "transactionDate": purchaseDetails.transactionDate,
  //     "transitionId": purchaseDetails.purchaseID,
  //     "productId": purchaseDetails.productID,
  //     "paymentMethod": Platform.isAndroid ? 'android' : 'ios',
  //     "amount":
  //         Get.find<SubscriptionController>().planList?[productIndex].price ??
  //             "",
  //     "iosCustomerId": transactionIdentifier ?? "NaN",
  //     // "allResponce": purchaseDetails.verificationData.localVerificationData,
  //     "purchaseToken": Platform.isAndroid
  //         ? purchaseDetails.verificationData.serverVerificationData
  //         : "NaN"
  //   };

  //   BaseApiService()
  //       .post(apiEndPoint: ApiEndPoints().subscribePlan, data: data)
  //       .then((value) async {
  //     if (value?.statusCode == 200) {
  //       try {
  //         BaseSuccessResponse response =
  //             BaseSuccessResponse.fromJson(value?.data);
  //         if (response.success ?? false) {
  //           await Get.find<DashboardController>().getSubscriptionDetail();
  //           showSnackBar(
  //             isSuccess: true,
  //             subtitle: "Purchase Completed Successfully",
  //           );
  //         } else {
  //           showSnackBar(subtitle: response.message ?? "");
  //         }
  //       } catch (e) {
  //         showSnackBar(subtitle: parsingError);
  //       }
  //     } else {
  //       showSnackBar(subtitle: "Something went wrong, please try again");
  //     }
  //   });
  // }

  void showPendingUI() {
    update();
  }

  void handleError() {
    // dismissBaseLoader();
    update();
  }

  Future<List<ProductDetails>> getProductList(Set<String> productId) async {
    final ProductDetailsResponse response =
        await InAppPurchase.instance.queryProductDetails(productId);
    if (response.notFoundIDs.isNotEmpty) {
      throw "product Id not found";
    }
    List<ProductDetails> products = response.productDetails;
    if (kDebugMode) {
      print('get product list :- ${products[0].title}');
    }

    _queryProduct.addAll(products);
    return products;
  }

  RxBool isPlanShown = false.obs;
  void buyPlan({required String productId}) async {
    if (kDebugMode) {
      print("somen index ${productIndex.value}");
    }

    if (_products.isNotEmpty) {
      try {
        bool planNotFound = true;
        _products.map((productDetails) {
          log(productDetails.id);
          if (!isPlanShown.value) {
            if (productDetails.id == productId) {
              isPlanShown.value = true;
              planNotFound = false;
              // print("somen ${productId}");
              if (kDebugMode) {
                print("somen  ${productDetails.id}");
                print("somen ${productDetails.price}");
                print("somen ${productDetails.title}");
              }
              // print("somen ${productDetails.id}");
              _inAppPurchase.buyNonConsumable(
                purchaseParam: PurchaseParam(
                  productDetails: productDetails,
                ),
              );
            }
          }
        }).toList();

        if (planNotFound) {
          // dismissBaseLoader();
          // showSnackBar(
          //   subtitle: 'No Plan Found',
          // );
        }
      } catch (e) {
        // dismissBaseLoader();
        log('error $e');
      }
    } else {
      // dismissBaseLoader();
      // showSnackBar(
      //   subtitle: 'Something Went Wrong',
      // );
    }
  }

  void cancelPlan(
      {required BuildContext buildContext,
      required String productId,
      required String paymentMethod}) async {
    // showBaseLoader();
    if (Platform.isAndroid) {
      // cancelSubscription() async {

      if (paymentMethod.isNotEmpty && paymentMethod == "android") {
        String url =
            "https://play.google.com/store/account/subscriptions?sku=$productId&package=com.app.zenzephyr";
        // "https://play.google.com/store/account/subscriptions";
        try {
          // await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
          //     .then((value) {
          //   dismissBaseLoader();
          // });
        } catch (e) {
          // showSnackBar(
          //   subtitle: 'Something Went Wrong',
          // );
        }
      } else {
        showLoader(true);
        // dismissBaseLoader();
        // showGeneralDialog(
        //   context: buildContext,
        //   transitionBuilder: (dContext, a1, a2, _) {
        //     return Transform.scale(
        //       scale: a1.value,
        //       child: Dialog(
        //         insetPadding: const EdgeInsets.symmetric(horizontal: 18.0),
        //         backgroundColor: Colors.white,
        //         child: Container(
        //           padding: const EdgeInsets.symmetric(
        //             horizontal: 18.0,
        //             vertical: 16.0,
        //           ),
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(
        //               horizontal: 12.0,
        //               vertical: 32.0,
        //             ),
        //             child: Column(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 const BaseText(
        //                   // "dummy Cancel Plan",
        //                   value: "Warning",
        //                   color: Colors.black,
        //                   fontSize: 25,
        //                   fontWeight: FontWeight.w700,
        //                 ),
        //                 const SizedBox(
        //                   height: 14,
        //                 ),
        //                 const BaseText(
        //                     value:
        //                         "Your subscription was made on an Android device. To cancel, you must use a Android device not an iOS device.",
        //                     textAlign: TextAlign.center,
        //                     color: Colors.black),
        //                 const SizedBox(
        //                   height: 30,
        //                 ),
        //                 SizedBox(
        //                   height: 40,
        //                   // width: 150,
        //                   child: BaseButton(
        //                     title: "Continue",
        //                     onPressed: () {
        //                       Get.back();
        //                     },
        //                   ),
        //                 ),
        //                 // const SizedBox(
        //                 //   height: 20,
        //                 // ),
        //                 // InkWell(
        //                 //   onTap: onNo,
        //                 //   child: Text(
        //                 //     LocalizationManager().translate("noThanks"),
        //                 //     style: const TextStyle(
        //                 //       // fontSize: 25,
        //                 //       fontWeight: FontWeight.w700,
        //                 //       color: Colors.white,
        //                 //     ),
        //                 //   ),
        //                 // ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        //   pageBuilder: (context, a1, a2) => const SizedBox(),
        // );
      }

      // https://play.google.com/store/account/subscriptions?sku=weekly_subscription&package=com.app.nabgh_app
      // try {
      //   if(Get.find<HomeScreenCtrl>().userDetail?.planDetail?.platform == "android") {
      //
      //     if (!await launchUrl(
      //       Uri.parse(
      //           "https://play.google.com/store/account/subscriptions?sku=${Get
      //               .find<HomeScreenCtrl>()
      //               .userDetail?.planDetail?.inAppPlanAndroid ??
      //               ""}&package=com.app.one.one"),
      //       mode: LaunchMode.externalApplication,
      //     )) {
      //       throw 'Could not launch URL';
      //     }
      //     // await Get.find<HomeScreenCtrl>().cancelSubscription(context);
      //   }else{
      //     showGeneralDialog(
      //       context: context,
      //       pageBuilder: (context1, animation, secondaryAnimation) {
      //         return ShowGeneralPopup(
      //           msg: "Your subscription was made on an iOS device. To cancel, you must use a iOS device not an Android device.",
      //           actionWidget: CustomButton(
      //             text: "Confirm",
      //             onPressed: (){
      //               Navigator.pop(context1);
      //             },
      //           ),
      //         );
      //       },
      //     );
      //   }
      // } catch (e) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(
      //       content: Text('Failed to launch URL'),
      //     ),
      //   );
      // }
    } else {
      try {
        if (paymentMethod.isNotEmpty && paymentMethod == "ios") {
          String url = "https://apps.apple.com/account/subscriptions";

          try {
            // await launchUrl(Uri.parse(url),
            //         mode: LaunchMode.externalApplication)
            //     .then((value) {
            //   dismissBaseLoader();
            // });
          } catch (e) {
            // showSnackBar(subtitle: 'Something Went Wrong');
          }

          // await Get.find<HomeScreenCtrl>().cancelSubscription(context);
        } else {
          // dismissBaseLoader();
          // showGeneralDialog(
          //   context: buildContext,
          //   transitionBuilder: (dContext, a1, a2, _) {
          //     return Transform.scale(
          //       scale: a1.value,
          //       child: Dialog(
          //         insetPadding: const EdgeInsets.symmetric(horizontal: 18.0),
          //         child: Container(
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: 18.0,
          //             vertical: 16.0,
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.symmetric(
          //               horizontal: 12.0,
          //               vertical: 32.0,
          //             ),
          //             child: Column(
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 const BaseText(
          //                     // "dummy Cancel Plan",
          //                     value: "Warning",
          //                     fontSize: 25,
          //                     fontWeight: FontWeight.w700,
          //                     color: Colors.black),
          //                 const SizedBox(
          //                   height: 14,
          //                 ),
          //                 const BaseText(
          //                   value:
          //                       "Your subscription was made on an Android device. To cancel, you must use a Android device not an iOS device.",
          //                   color: Colors.black,
          //                   textAlign: TextAlign.center,
          //                 ),
          //                 const SizedBox(
          //                   height: 30,
          //                 ),
          //                 SizedBox(
          //                   height: 40,
          //                   // width: 150,
          //                   child: BaseButton(
          //                     title: "Continue",
          //                     onPressed: () {
          //                       Get.back();
          //                     },
          //                   ),
          //                 ),
          //                 // const SizedBox(
          //                 //   height: 20,
          //                 // ),
          //                 // InkWell(
          //                 //   onTap: onNo,
          //                 //   child: Text(
          //                 //     LocalizationManager().translate("noThanks"),
          //                 //     style: const TextStyle(
          //                 //       // fontSize: 25,
          //                 //       fontWeight: FontWeight.w700,
          //                 //       color: Colors.white,
          //                 //     ),
          //                 //   ),
          //                 // ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          //   pageBuilder: (context, a1, a2) => const SizedBox(),
          // );

          // showGeneralDialog(
          //   context: context,
          //   pageBuilder: (context1, animation, secondaryAnimation) {
          //     return ShowGeneralPopup(
          //       msg:
          //       "Your subscription was made on an Android device. To cancel, you must use a Android device not an iOS device.",
          //       actionWidget: CustomButton(
          //         text: "Confirm",
          //         onPressed: () {
          //           Navigator.pop(context1);
          //         },
          //       ),
          //     );
          //   },
          // );
        }
      } catch (e) {
        if (buildContext.mounted) {
          // showSnackBar(subtitle: "notOpenAppStoreSetting");
        }
      }
    }
  }

  void onDispose() {
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(null);
    }
    _subscription.cancel();

    _queryProduct.clear();
    _products.clear();
  }
}

class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }
}
