import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class AddMedications extends StatefulWidget {
  const AddMedications({super.key});

  @override
  State<AddMedications> createState() => _AddMedicationsState();
}

class _AddMedicationsState extends State<AddMedications> {
  final controller = Get.find<HomeController>();
  final List<String> items = [
  'Syringe',
  'Pill',
  'Chewable',
  'Liquid',
  'etc',
];
String? selectedValue;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      resizeToAvoidBottomInset: false,    
      body:   GetBuilder<HomeController>(
        // init: MyController(),
        // initState: (_) {},
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
                      horizontal: 12.h,
                      vertical: 8.h
                    ),
                    child: ListView(
                      children: [
                     addHeight(30),
                      AppBar1(title: "Add New Medication"),
                      addHeight(20),
                      CustomTextField(
                        labelText:  "Name",

                      ),
                      addHeight(20),
                      CustomTextField(
                        labelText:  "Dosage",
                        
                      ),
                       addHeight(10),
                       Padding(
                            padding:  EdgeInsets.only(
                              top: 10.h
                            ),
                            child: Container(
                              width: Get.width,
                              height: 50.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.blackColor2
                            ),
                          borderRadius: BorderRadius.circular(10),
                          // color: AppColors.whiteColor
                        ),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Text(
                                'Dosage Form',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              iconStyleData: IconStyleData(
                                icon: SvgPicture.asset(AppAssets.dropDownIcon)
                              ),
                              items: items
                                  .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                               
                                height: 40,
                                width: 140,          
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                
                                // overlayColor:,
                                height: 40,
                              ),
                            ),
                          ),
                      ),
                    ),
                       addHeight(20),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           addHeadingTxtMedium("Prescription",fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                           CupertinoSwitch(value: controller.prescriptionType, 
                           activeColor: AppColors.appColor,
                           onChanged: (val){
                            
                           controller.prescriptionType = val;
                           controller.update();
                           })
                        ],
                       ),
                         addHeight(10),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           addHeadingTxtMedium("Over the Counter",fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                           CupertinoSwitch(value: controller.overTheCounterType, 
                           activeColor: AppColors.appColor,
                           onChanged: (val){
                            
                           controller.overTheCounterType = val;
                           controller.update();
                           })
                        ],
                       ),
                      //  Row(
                      //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     InkWell(
                      //       child: Container(
                      //         child: Row(children: [
                      //           InkWell(
                      //             onTap: (){
                      //               log("Log");
                                    
                                    //  controller.medicationType = "Prescription";
                      //               controller.update();
                      //               log(controller.medicationType);
                      //             },
                      //             child:controller.medicationType == 'Prescription' ? SvgPicture.asset( AppAssets.circleBoxIcon):  SvgPicture.asset( AppAssets.circleBoxFilledIcon)),
                      //           addWidth(10),
                      //           addHeadingTxtMedium("Prescription",fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                      //         ]),
                      //       ),
                      //     ),
                      //     addWidth(20),
                      //      Container(
                      //       child: Row(children: [
                      //         InkWell(
                      //           onTap: (){
                      //            controller.medicationType = "Over the Counter";
                      //               controller.update();
                      //                log(controller.medicationType);
                      //           },
                      //           child: controller.medicationType == "Over the Counter" ? SvgPicture.asset( AppAssets.circleBoxIcon):  SvgPicture.asset( AppAssets.circleBoxFilledIcon) ),
                      //         addWidth(10),
                      //         addHeadingTxtMedium("Over the Counter", fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                      //       ]),
                      //     ),
                        
                      
                      //   ],
                      //  ),
                         addHeight(20),
                          Row(
                            children: [
                              addRegularTxt("Administration Options:", fontSize: 12, color: AppColors.greyColor4)
                            ],
                          ),
                          addHeight(20),
                           Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Container(
                              child: Row(children: [
                                InkWell(
                                  onTap: (){
                                    log("Log");
                                    
                                     controller.medicationTime = "AM";
                                    controller.update();
                                  
                                  },
                                  child:controller.medicationTime == 'AM' ?  SvgPicture.asset( AppAssets.checkboxFilledIcon):  SvgPicture.asset( AppAssets.checkboxIcon)),
                                addWidth(10),
                                addHeadingTxtMedium("AM",fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                              ]),
                            ),
                          ),
                          addWidth(20),
                           Container(
                            child: Row(children: [
                              InkWell(
                                onTap: (){
                                 controller.medicationTime = "PM";
                                    controller.update();
                                    //  log(controller.medicationType);
                                },
                                child: controller.medicationTime == "PM" ? SvgPicture.asset( AppAssets.checkboxFilledIcon):  SvgPicture.asset( AppAssets.checkboxIcon) ),
                              addWidth(10),
                              addHeadingTxtMedium("PM", fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                            ]),
                          ),
                          addWidth(20),
                           Container(
                            child: Row(children: [
                              InkWell(
                                onTap: (){
                                 controller.medicationTime = "As Needed";
                                    controller.update();
                                    //  log(controller.medicationType);
                                },
                                child: controller.medicationTime == "As Needed" ? SvgPicture.asset( AppAssets.checkboxFilledIcon):  SvgPicture.asset( AppAssets.checkboxIcon) ),
                              addWidth(10),
                              addHeadingTxtMedium("As Needed", fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                            ]),
                          ),
                          
                        
                      
                        ],
                       ),
                         addHeight(20),
                           Row(
                            children: [
                              addRegularTxt("Duration", fontSize: 12, color: AppColors.greyColor4)
                            ],
                          ),
                          addHeight(20),
                          
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             
                             Expanded(
                               flex: 5,
                              child: CustomTextField(
                                readOnly:  true,
                                onTap: (){
                                  //  _Calendarpop(BuildContext context){
      showDialog(
                    context: context,
                    // barrierColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return CustomDialog2();
                    },
                  );                               
                                },
                                                      controller: controller.startingDateCont,
                                                      
                                                    labelText:  "Start Date",
                                                    suffixIcon: Padding(
                                                      padding: const EdgeInsets.all(12.0),
                                                      child: SvgPicture.asset(AppAssets.calendarIcon),
                                                    ),
                                                    
                                                  ),),
                      Spacer(),
                         Expanded(
                          flex: 5,
                          child: CustomTextField(
                            controller: controller.endingDateCont,
                            onTap: (){
                                  //  _Calendarpop(BuildContext context){
      showDialog(
                    context: context,
                    // barrierColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return CustomDialog2(endDataBool: true,);
                    },
                  );
                                  //  CustomDialog2(endDate: false,);
                                  //  log("inside");
                                },
                        labelText:  "End Date",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(AppAssets.calendarIcon),
                        ),
                        
                      ),)
                            ],
                          ),
                          addHeight(20),
                      CustomTextField(
                        labelText:  "Custom",
                        
                      ),
                         addHeight(20),
                      CustomTextField(
                        onTap: (){
                           showDialog(
                    context: context,
                    // barrierColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return CustomDialog2(dataTime: true,);
                    },
                  );        
                        },
                        labelText:  "Date and Time",
                        controller: controller.dateTimeCont,
                        suffixIcon: Padding(
                          
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(AppAssets.calendarIcon),
                        ),
                        
                      ),
                      addHeight(20),

                      Row(children: [
                         InkWell(
                                onTap: (){
                                 controller.medicationNotify = !controller.medicationNotify;
                                    controller.update();
                                    //  log(controller.medicationType);
                                },
                                child: controller.medicationNotify ? SvgPicture.asset( AppAssets.checkboxFilledIcon):  SvgPicture.asset( AppAssets.checkboxIcon) ),
                                addWidth(10),
                        addHeadingTxtMedium("Notify for this Medication", fontFamily: "Montserrat", color: AppColors.blackColor, fontSize: 13, fontWeight: FontWeight.bold)
                      ],),
                      addHeight(20),
                      Container(                 
                  // height: 170.h,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                           decoration: BoxDecoration(
                            // color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          
                                          color: AppColors.blackColor2
                                        )
                                        ),
                          child: Padding(
                                          padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 8.h
                                          ),
                            child: const Column(
                              children: [
                                TextField(                              
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: "Add New Comments",
                                    border: InputBorder.none
                                  ),
                                ),                                                                           
                              ],
                            ),
                          ),
                        ),
                      ),
                      //  Positioned(
                      //     top: -4,
                      //     left: 14,
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //         color: AppColors.whiteColor.withOpacity(0.8)
                      //       ),
                      //       child: Padding(
                      //         padding: const EdgeInsets.symmetric(horizontal: 6),
                      //         child: addRegularTxt("Add New Comments", color: AppColors.blackColor2, fontSize: 13.sp),
                      //       ),
                      //     ),
                      //   )
                      
                    ],
                  ),
                ),
                addHeight(20),
                 Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 14.h,
                  vertical: 8

                ),
                child: Row(
                  children: [
                    addBoldTxt("Add Photo:", fontSize: 16.sp),
                  ],
                ),
              ),
                Padding(
   padding: const EdgeInsets.all(8.0),
   child: InkWell(
    onTap: (){
        _addPictureSheet(context);
    },
     child: DottedBorder(
        color: AppColors.dotBorderColor,
        strokeWidth: 1,
        dashPattern: [3,5],
        borderType: BorderType.RRect,
        radius: Radius.circular(20),
                      // width: 120.h,
                      // height: 90.h,
                      child: Container(
                        decoration: BoxDecoration(
  //  color: AppColors.whiteColor,
   borderRadius: BorderRadius.circular(20)
                        ),
                        
                        height: 100.h,
                        // width: 120.h,
                        child: Center(
                          child: ctrl.symptomDocPath == "" ?  Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               SvgPicture.asset(AppAssets.uploadIcon),
                               addHeight(10),
                               addHeadingTxtMedium("Upload Photo/Documents", fontSize: 12.sp,  color: AppColors.greyColor2, fontFamily: "Montserrat-medium" ),
                        
                            ],
                          ): Container(
                            decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(image: FileImage(File(ctrl.medicationDocPath)), fit: BoxFit.fill)
                            ),
                          ),
                        ),
                      ),
                    ),
   ),
 ),
 addHeight(20),
 CustomButton(
    height: 50,
    width: Get.width / 2,
    text: "Save", onPressed: (){}),
    addHeight(40),

                      ])));
                      })
      
    );
  }

  _addPictureSheet(BuildContext context ) {
  String? imgPath;
   final controller = Get.find<HomeController>();
   showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title:  Text('Add Picture'.tr, style: TextStyle(
          fontWeight: FontWeight.w700,
        ),),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel'.tr,
            // style: HeadingCustom(color: Colors.blue),
          ),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.of(context).pop();
              final res = await controller.getImage();
              if(res != null){
              // imgPath = res.path;
                                                // controller.memberImgPath  = res.path;
                                                 
                                                  controller.medicationDocPath = res.path;
                                                
                                                controller.update();                                                
              }             
            },
            child: addBoldTxt(
              'Choose Form Gallery'.tr,
              fontSize: 18
              // style: HeadingCustom(color: Colors.blue),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.of(context).pop();
               final res = await controller.getImageToCamera();
                                              if(res != null){
                                              controller.symptomDocPath = res.path;
                                                
                                                controller.update();                                                  
                                              }        
            },
            child: addBoldTxt('Take a Picture'.tr,
            fontSize: 18
                // style: HeadingCustom(color: Colors.blue)
                ),
          ),
        ],
      ),
    );

    return  imgPath ?? "";
  }

  

}

 



class CuponClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    // final radius = size.height * .065;

    Path holePath = Path();
     holePath.addOval(
        Rect.fromCircle(
          center: Offset(Get.width / 2.55,  0),
          radius: 20,
        ),
      );

  

    return Path.combine(PathOperation.difference, path, holePath);
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldRepaint
    return true;
  }
}




var _currentDate = DateTime.now();
  DateTime? _targetDateTime = DateTime.now();
  String _currentMonth = DateFormat.yMMMM().format(DateTime.now());
// ignore: must_be_immutable
class CustomDialog2 extends StatelessWidget{
  bool? endDataBool;
  bool? dataTime;
  CustomDialog2({super.key, this.endDataBool = false, this.dataTime = false});
  final controller = Get.find<HomeController>();

 
  @override 
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
              color: Colors.transparent,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50)),
                    child: ClipPath(
                         clipper: CuponClipper(),
    child: Container(

                        padding:
                            const EdgeInsets.only(top: 14, left: 6, right: 6),
                        // margin: const EdgeInsets.only(top: 10),
                        alignment: AlignmentDirectional.center,
                        height: Get.height / 2.1,
                        
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(              
                   children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 14.h,
                        vertical: 10.h
                      ),
                      child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                               setState(() {
                              _targetDateTime = DateTime(
                                  _targetDateTime!.year, _targetDateTime!.month - 1);
                              _currentMonth =
                                  DateFormat.yMMM().format(_targetDateTime!);
                            });
                            },
                            child: SvgPicture.asset(AppAssets.leftCircleIcon, height: 30.h,)),
                          addHeadingTxtMedium(_currentMonth, fontSize: 20, fontFamily: "Montserrat-semibold"),
                          // Spacer(),
                          
                          // addWidth(10),
                          InkWell(
                            onTap: (){
                               setState(() {
                              _targetDateTime = DateTime(
                                  _targetDateTime!.year, _targetDateTime!.month + 1);
                              _currentMonth =
                                  DateFormat.yMMM().format(_targetDateTime!);
                            });
                            },
                            child: SvgPicture.asset(AppAssets.rightCircleIcon,  height: 30.h,)),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 14.h
                        
                      ),
                      child: Divider(
                        thickness: 1.2,
                      ),
                    ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: CalendarCarousel<Event>(
          // todayBorderColor: Colors.green,
          childAspectRatio: 1.3,
          onDayPressed: (date, events) {  
            Navigator.of(context).pop();   
            var day = DateFormat("dd/MM/yyyy").format(date);
            log(endDataBool.toString())            ;
            if(endDataBool == true){
              controller.endingDateCont.text = day.toString(); 
              controller.update();
              }else if(dataTime == true){
 controller.dateTimeCont.text = day.toString(); 
              controller.update();
              }
              else{
                controller.startingDateCont.text = day.toString();
                controller.update();
              }
          }, 
          showOnlyCurrentMonthDate: false,
          weekendTextStyle: const TextStyle(
            color: AppColors.blackColor,
          ),
          thisMonthDayBorderColor: Colors.grey,
          
          weekFormat: false,      
          height: 210.h,
          weekDayPadding: EdgeInsets.only(
            bottom: 10.h
          ),  
          weekdayTextStyle: TextStyle(color: AppColors.blackColor, fontFamily: "Montserrat-semibold", fontWeight: FontWeight.w200, fontSize: 10),
          customGridViewPhysics: const NeverScrollableScrollPhysics(),      
          showHeader: false,
          todayTextStyle: const TextStyle(
            // color: Colors.,
          ),      
          todayButtonColor: AppColors.appColor,
           targetDateTime: _targetDateTime,
          selectedDayTextStyle: const TextStyle(
            color: Colors.yellow,
          ),
          minSelectedDate: _currentDate.subtract(Duration(days: 360)),
          maxSelectedDate: _currentDate.add(Duration(days: 360)),      
          inactiveDaysTextStyle: TextStyle(
            color: Colors.tealAccent,
            fontSize: 16,
          ),
          onCalendarChanged: (DateTime date) {
            setState(() {
              _targetDateTime = date;
              _currentMonth = DateFormat.yMMM().format(date);
            });
          },
          onDayLongPressed: (DateTime date) {
            print('long pressed date $date');
          },
    ),                  
  ),
                    
                   ],
                 ),                   
                      ),
                    )
  //                    CustomPaint(
  //                     painter: MyShape(),
  //                     child: 
  //                     
  //                   ),
              
                  ),
                  // GestureDetector(
                  //   onTap: () => Navigator.of(context).pop(),
                  //   child: Container(
                  //     height: 30,
                  //     width: 30,
                  //     decoration: BoxDecoration(
                  //       color: Colors.transparent,
                  //       border: Border.all(color: Colors.white),
                  //       borderRadius: BorderRadius.circular(100),
                  //     ),
                  //     child: const Icon(
                  //       Icons.close,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // )
                    Positioned(
                    top: 0,
                    left: Get.width / 2.85,
                    // right: Get.width / 2,
                    
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ));
        }
      ),
    );
  }
}