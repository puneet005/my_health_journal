import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
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
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel, WeekdayFormat;

class AddDoctorsVisit extends StatefulWidget {
  const AddDoctorsVisit({super.key});

  @override
  State<AddDoctorsVisit> createState() => _AddDoctorsVisitState();
}

class _AddDoctorsVisitState extends State<AddDoctorsVisit> {
  final List<String> items = [
  'Tom Johnson',
  'Maria Jobs',
  'Meto Wilson',
  'Anna',
];
String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   GetBuilder<HomeController>(
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
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                     addHeight(30),
                      AppBar1(title: "Doctors Visit"),
                      addHeight(10),
                      Stack(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(
                              top: 10.h
                            ),
                            child: Container(
                              width: Get.width,
                              height: 50.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.dotBorderColor
                            ),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.whiteColor
                        ),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Text(
                                'Maria Jobs',
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
                                height: 40,
                              ),
                            ),
                          ),
                      ),
                    ),

                     Positioned(
                            top: 2,
                            left: 15,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor.withOpacity(0.8)
                              ),
                              child: addRegularTxt("Select Provider", color: AppColors.blackColor3, fontSize: 13.sp),
                            ),
                          )
                  ],
                ).paddingOnly(bottom: 10), 
addHeight(10),
                InkWell(
                  onTap: (){
                    _Calendarpop(context);
                  },
                  child: CustomTextField(
                    controller: ctrl.dateofVisit,
                    labelText: "Date of Visit",
                    onTapSuffixIcon: (){
                       _Calendarpop(context);
                    },
                    // readOnly: true,
                    suffixIcon: Padding(
                      padding:  EdgeInsets.all(12.0.sp),
                      child: SvgPicture.asset(AppAssets.bottomNav3, color: AppColors.orangeColor,height: 20,),
                    ),
                  ).paddingOnly(bottom: 10),
                ),
                addHeight(10),
                CustomTextField(
                    controller: ctrl.questionsforProvider,
                  labelText: "Questions for Provider",
                ).paddingOnly(bottom: 10),
                addHeight(10),
                CustomTextField(
                  
                  fillColor: AppColors.whiteColor,
                     controller: ctrl.providerComments,
                  labelText: "Provider Comments",
                ).paddingOnly(bottom: 10),
                addHeight(10),
                 CustomTextField(
                     controller: ctrl.notes,
                  labelText: "Notes",
                ).paddingOnly(bottom: 10),
                addHeight(10),

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
             
        
              addHeight(10),
                InkWell(
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
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20)
                                     ),
                                     
                                     height: 110.h,
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
                                           image: DecorationImage(image: FileImage(File(ctrl.doctorVisitDocPath)), fit: BoxFit.fill)
                                         ),
                                       ),
                                     ),
                                   ),
                                 ),
                ),

                addHeight(20),
 Padding(
   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  child:   CustomButton(
    height: 50,
    width: Get.width / 2,
    text: "Save", onPressed: (){}),
),
//  addHeight(10),
 Padding(
   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  child:   CustomButton(
    btnColor: AppColors.orangeColor,
    height: 50,
    width: Get.width / 2,
    text: "Save and Share", onPressed: (){}),
),
addHeight(20),


                ],
              ),
            ),
            )  ; 
        },
      )  
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
                                                 
                                                  controller.doctorVisitDocPath = res.path;
                                                
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
                                              controller.doctorVisitDocPath = res.path;
                                                
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
var _currentDate = DateTime.now();
  _Calendarpop(BuildContext context){
    showDialog(
      context: context,
      
      builder: (_) => AlertDialog(
        backgroundColor: Colors.transparent,
        // title: Text('Select a Date'),
        content:   CustomPaint(
                  painter:MyShape2(),
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: Get.width / 1.1,
            child: CalendarCarousel<Event>(
            //  customWeekDayBuilder:(weekday, weekdayName) {
        
            //  },
            
            iconColor: AppColors.orangeColor,
            headerTextStyle: TextStyle(
              color: AppColors.blackColor,
              fontSize: 16,
              fontFamily: "Montserrat-semibold",
              fontWeight: FontWeight.bold
            ),          
            // weekDayPadding: EdgeInsets.all(2.h),  
              onDayPressed: (DateTime date, List<Event> events) {              
                setState(() {
                  _currentDate = date;
                });
                Navigator.pop(context); // Close the dialog on date selection
              },            
              weekendTextStyle: TextStyle(
                color: Colors.black,
              ),
              thisMonthDayBorderColor: Colors.grey,
              selectedDateTime: _currentDate, // Set the initially selected date
            ),
          ),
        ),
       
      ),
    );
   
  }

   
  

  

}

class MyShape2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint();
    final path = Path();
    // paint.style = PaintingStyle.stroke;
    // paint.strokeWidth = 15;
    // paint.color = Colors.blueAccent;
    path.moveTo(0.0, size.height * 1);

    path.quadraticBezierTo(
      size.width * - 0.02,
      size.height * -0.02,
      size.width *  -0.02,
      size.height * -0.02,
    );

    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * -0.02,
      size.width * 0.45,
      size.height * -0.02,
    );
    path.quadraticBezierTo(
      size.width * 0.42,
      size.height * 0.08,
      size.width * 0.60,
      size.height * 0.05
    );
    // path.quadraticBezierTo(
    //   size.width * 0.70,
    //   size.height * -0.02,
    //   size.width * 0.90,
    //   size.height * -0.02,
    // );
    path.quadraticBezierTo(
      size.width * 0.65,
      size.height * 0.02,
      size.width * 0.64,
      size.height * -0.02,
    );
    // path.quadraticBezierTo(
    //   size.width * 0.7,
    //   size.height * -0.02,
    //   size.width * 0.7,
    //   size.height *-0.02,
    // );
// Right border
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height *-0.02,
      size.width * 0.8,
      size.height *-0.02,
    );
    path.quadraticBezierTo(
      size.width * 0.97,
      size.height * -0.02,
      size.width *  1,
      size.height * -0.02,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.6);
    canvas.drawPath(path, paint);
    final paint1 = Paint();
    paint1.style = PaintingStyle.fill;
    paint1.color = Colors.white;
    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }
}