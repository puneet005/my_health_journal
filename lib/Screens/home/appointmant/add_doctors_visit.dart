import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
// import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/models/home/provider_view_model.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel, WeekdayFormat;
// import 'package:table_calendar/table_calendar.dart';

class AddDoctorsVisit extends StatefulWidget {
  const AddDoctorsVisit({super.key});

  @override
  State<AddDoctorsVisit> createState() => _AddDoctorsVisitState();
}

class _AddDoctorsVisitState extends State<AddDoctorsVisit> {
  // final bottomCont = Get.find<BottomBarController>();
  final bottomCont = Get.find<BottomBarController>();
  @override
  void initState() {
    super.initState();
    bottomCont.getProviderListApi();
    
  }
//   final List<String> items = [
//   'Tom Johnson',
//   'Maria Jobs',
//   'Meto Wilson',
//   'Anna',
// ];

String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,    
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
                  child: Form(
                    key: ctrl.appointmentForm,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: [
                       addHeight(30),
                        AppBar1(title: "Appointment"),
                        addHeight(10),
                          GetBuilder<BottomBarController>(
                            builder: (bottonCtrl){
                              return     Container(
                                                  width: Get.width,
                                                  height: 50.h,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: ctrl.appointmentError ?  Colors.red : AppColors.dotBorderColor
                                                ),
                                              borderRadius: BorderRadius.circular(10),
                                              // color: AppColors.whiteColor
                                            ),
                                            child:                                           
                                              Padding(
   padding: const EdgeInsets.symmetric(
    horizontal: 10
   ),
   child: DropdownButtonFormField<ProviderViewModelData>(
      
      decoration: const InputDecoration(
        errorStyle: TextStyle(height: 0),
          border: UnderlineInputBorder(
              borderSide: BorderSide.none
          )),
      value: ctrl.appointmentProvider,
      hint: addRegularTxt("Add Provider"),
      onChanged: (val){
        ctrl.appointmentProvider = val;
        ctrl.update();
      },
      validator: (val){
        if(ctrl.appointmentProvider == null){
          ctrl.appointmentError = true;
          ctrl.update();
          return "";
        }
        return null;    
      },
      items: bottomCont.providerListData
                                   .where((item) => item != null) // Filter out null values
                                   .map((item) => DropdownMenuItem(
                                       value: item,
                                       child: addRegularTxt(item.name.toString(), fontSize: 14),
                                   ))
                                   .toList(),
      // <DropdownMenuItem<ProviderViewModelData>>[
      //   DropdownMenuItem<int>(
      //     value: 1,
      //     child: Text("Owner"),
      //   ),
      //   DropdownMenuItem<int>(
      //     value: 2,
      //     child: Text("Member"),
      //   ),
      // ],
    ),
 ),
                                            // DropdownButtonHideUnderline(
                                            //     child: DropdownButton2<String>(
                                            //       isExpanded: true,
                                            //       hint: const Text(
                                            //         'Select Provider',
                                            //         style: TextStyle(
                                            //           fontSize: 16,
                                            //           color: AppColors.blackColor,
                                            //         ),
                                            //       ),
                                            //       iconStyleData: IconStyleData(
                                            //         icon: SvgPicture.asset(AppAssets.dropDownIcon)
                                            //       ),
                                            //       items: items
                                            //           .map((String item) => DropdownMenuItem<String>(
                                            //   value: item,
                                            //   child: Text(
                                            //     item,
                                            //     style: const TextStyle(
                                            //       fontSize: 14,
                                            //     ),
                                            //   ),
                                            // ))
                                            //           .toList(),
                                            //       value: selectedValue,
                                            //       onChanged: (String? value) {
                                            //         setState(() {
                                            //           selectedValue = value;
                                            //         });
                                            //       },
                                            //       buttonStyleData: const ButtonStyleData(
                                            //         padding: EdgeInsets.symmetric(horizontal: 16),
                                            //         height: 40,
                                            //         width: 140,          
                                            //       ),
                                            //       menuItemStyleData: const MenuItemStyleData(
                                            //         height: 40,
                                            //       ),
                                            //     ),
                                            //   ),
                                      //     ),
                                      //   ),                  
                                      // ],
                                    ).paddingOnly(bottom: 10);
                            }
                            ),
                    addHeight(10),
                    InkWell(
                    onTap: (){
                      _Calendarpop(context);
                    },
                    child: CustomTextField(
                      onTap: (){
                          _Calendarpop(context);
                      },
                      controller: ctrl.appointmentDOV,
                      labelText: "Date of Visit",
                      readOnly: true,
                        validator: (val){
                             if(val!.isEmpty){
                      return "Date of Visit is Required*";
                    }                    
                    return null;
                          },
            
                      onTapSuffixIcon: (){
                         _Calendarpop(context);
                      },                     
                      suffixIcon: Padding(
                        padding:  EdgeInsets.all(12.0.sp),
                        child: SvgPicture.asset(AppAssets.bottomNav3, color: AppColors.orangeColor,height: 20,),
                      ),
                    ).paddingOnly(bottom: 10),
                                    ),
                                    addHeight(10),
                                    CustomTextField(
                    controller: ctrl.appointmentQuestion,
                    labelText: "Questions for Provider",
                     validator: (val){
                             if(val!.isEmpty){
                      return "Questions is Required*";
                    }                    
                    return null;
                          },            
                                    ).paddingOnly(bottom: 10),
                                    addHeight(10),
                                    CustomTextField(                    
                    fillColor: AppColors.whiteColor,
                       controller: ctrl.appointmentComment,
                    labelText: "Provider Comments",
                                    ).paddingOnly(bottom: 10),
                                    addHeight(10),
                                     CustomTextField(
                       controller: ctrl.appointmentNotes,
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
                                    // color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(20)
                                       ),
                                       
                                       height: 110.h,
                                       // width: 120.h,
                                       child: Center(
                                         child: ctrl.appointmentPhoto == "" ?  Column(
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
                                             image: DecorationImage(image: FileImage(File(ctrl.appointmentPhoto)), fit: BoxFit.fill)
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
                        text: "Save", onPressed: (){
                          if(ctrl.appointmentForm.currentState!.validate()){
                            ctrl.AddAppointmentApi();
                          }
                        }),
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
                                                 
                                                  controller.appointmentPhoto = res.path;
                                                
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
                                              controller.appointmentPhoto = res.path;
                                                
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
// var _currentDate = DateTime.now();
  _Calendarpop(BuildContext context){

      showDialog(
                    context: context,
                    // barrierColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return CustomDialog();
                    },
                  );
    // showDialog(
    //   context: context,
      
    //   builder: (_) => AlertDialog(
    //     backgroundColor: Colors.transparent,
    //     // title: Text('Select a Date'),
    //     content:   CustomPaint(
    //               painter:MyShape2(),
    //       child: Container(
    //         height: MediaQuery.of(context).size.height / 2,
    //         width: Get.width / 1.1,
    //         child: CalendarCarousel<Event>(
    //         //  customWeekDayBuilder:(weekday, weekdayName) {
        
    //         //  },
            
    //         iconColor: AppColors.orangeColor,
    //         headerTextStyle: TextStyle(
    //           color: AppColors.blackColor,
    //           fontSize: 16,
    //           fontFamily: "Montserrat-semibold",
    //           fontWeight: FontWeight.bold
    //         ),          
    //         // weekDayPadding: EdgeInsets.all(2.h),  
    //           onDayPressed: (DateTime date, List<Event> events) {              
    //             setState(() {
    //               _currentDate = date;
    //             });
    //             Navigator.pop(context); // Close the dialog on date selection
    //           },            
    //           weekendTextStyle: TextStyle(
    //             color: Colors.black,
    //           ),
    //           thisMonthDayBorderColor: Colors.grey,
    //           selectedDateTime: _currentDate, // Set the initially selected date
    //         ),
    //       ),
    //     ),
       
    //   ),
    // );
   
  }

   
  

  

}
  var _currentDate = DateTime.now();
  DateTime? _targetDateTime = DateTime.now();
  String _currentMonth = DateFormat.yMMMM().format(DateTime.now());
class CustomDialog extends StatelessWidget{
   final ctrl = Get.find<HomeController>();
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
            Navigator.pop(context);  
              ctrl.appointmentDOV.text = DateFormat('dd/MM/yyyy').format(date);   
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




// class MyShape extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // TODO: implement paint
//     final paint = Paint();
//     final path = Path();
//     paint.style = PaintingStyle.stroke;
//     paint.strokeWidth = 0;
//     paint.color = Colors.white;
//     path.moveTo(0.00, size.height * 0.92);

//     path.quadraticBezierTo(
//       size.width * 0.00,
//       size.height * 0.006,
//       size.width * 0.006,
//       size.height * 0.06,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.03,
//       size.height * 0.006,
//       size.width * 0.09,
//       size.height * 0.006,
//     );

//     path.quadraticBezierTo(
//       size.width * 0.02,
//       size.height * 0.005,
//       size.width * 0.428,
//       size.height * 0.00,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.44,
//       size.height * 0.0735,
//       size.width * 0.53,
//       size.height * 0.067,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.51,
//       size.height * 0.0712,
//       size.width * 0.52,
//       size.height *0.066,
//     );
//     // path.quadraticBezierTo(
//     //   size.width * 0.55,
//     //   size.height * 0.054,
//     //   size.width * 0.549,
//     //   size.height * 0.052,
//     // );
//     path.quadraticBezierTo(
//       size.width * 0.571,
//       size.height * 0.040,
//       size.width * 0.57,
//       size.height * 0.00,
//     );

//     path.quadraticBezierTo(
//       size.width * 0.852,
//       size.height * 0.001,
//       size.width * 0.9,
//       size.height * 0.001,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.982,
//       size.height * 0.0,
//       size.width * 0.9999,
//       size.height * 0.065,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.9999,
//       size.height * 0.96,
//       size.width * 0.9999,
//       size.height * 0.92,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.99,
//       size.height * 0.99,
//       size.width * 0.9,
//       size.height * 1,
//     );
//     path.quadraticBezierTo(
//       size.width * 0,
//       size.height * 1,
//       size.width * 0.9,
//       size.height * 1,
//     );
//     // path.lineTo(size.width  0.06, size.height  1);
//     path.quadraticBezierTo(
//       size.width * 0.0,
//       size.height * 1,
//       size.width * 0.1,
//       size.height * 1,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.03,
//       size.height * 1,
//       size.width * 0.005,
//       size.height * 0.95,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.00,
//       size.height * 0.94,
//       size.width * 0.001,
//       size.height * 0.915,
//     );
//     // path.lineTo(size.width  0.0, size.height  0.95);
//     // path.lineTo(size.width, size.height);
//     // path.lineTo(0, size.height);
//     // path.lineTo(0, size.height * 0.8);
//     canvas.drawPath(path, paint);
//     final paint1 = Paint();
//     paint1.style = PaintingStyle.fill;
//     paint1.color = Colors.white;
//     canvas.drawPath(path, paint1);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return true;
//   }
// }


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

    // for (int i = 1; i <= 4; i++) {
    //   holePath.addOval(
    //     Rect.fromCircle(
    //       center: Offset(0, (size.height * .2) * i),
    //       radius: radius,
    //     ),
    //   );
    // }
    // for (int i = 1; i <= 4; i++) {
    //   holePath.addOval(
    //     Rect.fromCircle(
    //       center: Offset(size.width, (size.height * .2) * i),
    //       radius: radius,
    //     ),
    //   );
    // }

    return Path.combine(PathOperation.difference, path, holePath);
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldRepaint
    return true;
  }
  // bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
  //   // TODO: implement shouldReclip
  //   throw UnimplementedError();
  // }
  

  }
// class MyShape extends CustomPainter {  
//   @override
//   void paint(Canvas canvas, Size size) {
//     // TODO: implement paint
//     final paint = Paint();
//     final path = Path();
//     paint.style = PaintingStyle.stroke;
//     paint.strokeWidth = 0;
//     paint.color = Colors.white;
//     path.moveTo(0.00, size.height * 0.92);

//     path.quadraticBezierTo(
//       size.width * 0.00,
//       size.height * 0.006,
//       size.width * 0.006,
//       size.height * 0.06,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.03,
//       size.height * 0.006,
//       size.width * 0.09,
//       size.height * 0.006,
//     );

//     path.quadraticBezierTo(
//       size.width * 0.022,
//       size.height * 0.005,
//       size.width * 0.429,
//       size.height * 0.00,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.425,
//       size.height * 0.058,
//       size.width * 0.5,
//       size.height * 0.06,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.53,
//       size.height * 0.058,
//       size.width * 0.54,
//       size.height * 0.055,
//     );
//     // path.quadraticBezierTo(
//     //   size.width * 0.55,
//     //   size.height * 0.054,
//     //   size.width * 0.549,
//     //   size.height * 0.052,
//     // );
//     path.quadraticBezierTo(
//       size.width * 0.58,
//       size.height * 0.035,
//       size.width * 0.573,
//       size.height * 0.00,
//     );

//     path.quadraticBezierTo(
//       size.width * 0.852,
//       size.height * 0.001,
//       size.width * 0.9,
//       size.height * 0.001,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.982,
//       size.height * 0.0,
//       size.width * 0.9999,
//       size.height * 0.065,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.9999,
//       size.height * 0.96,
//       size.width * 0.9999,
//       size.height * 0.92,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.99,
//       size.height * 0.99,
//       size.width * 0.9,
//       size.height * 1,
//     );
//     path.quadraticBezierTo(
//       size.width * 0,
//       size.height * 1,
//       size.width * 0.9,
//       size.height * 1,
//     );
//     // path.lineTo(size.width  0.06, size.height  1);
//     path.quadraticBezierTo(
//       size.width * 0.0,
//       size.height * 1,
//       size.width * 0.1,
//       size.height * 1,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.03,
//       size.height * 1,
//       size.width * 0.005,
//       size.height * 0.95,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.00,
//       size.height * 0.94,
//       size.width * 0.001,
//       size.height * 0.915,
//     );
//     // path.lineTo(size.width  0.0, size.height  0.95);
//     // path.lineTo(size.width, size.height);
//     // path.lineTo(0, size.height);
//     // path.lineTo(0, size.height * 0.8);
//     canvas.drawPath(path, paint);
//     final paint1 = Paint();
//     paint1.style = PaintingStyle.fill;
//     paint1.color = Colors.white;
//     canvas.drawPath(path, paint1);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return true;
//   }
// }

// class MyShape2 extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // TODO: implement paint
//     final paint = Paint();
//     final path = Path();
//     // paint.style = PaintingStyle.stroke;
//     // paint.strokeWidth = 15;
//     // paint.color = Colors.blueAccent;
//     path.moveTo(0.0, size.height * 1);

//     path.quadraticBezierTo(
//       size.width * - 0.02,
//       size.height * -0.02,
//       size.width *  -0.02,
//       size.height * -0.02,
//     );

//     path.quadraticBezierTo(
//       size.width * 0.3,
//       size.height * -0.02,
//       size.width * 0.45,
//       size.height * -0.02,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.42,
//       size.height * 0.08,
//       size.width * 0.60,
//       size.height * 0.05
//     );
//     // path.quadraticBezierTo(
//     //   size.width * 0.70,
//     //   size.height * -0.02,
//     //   size.width * 0.90,
//     //   size.height * -0.02,
//     // );
//     path.quadraticBezierTo(
//       size.width * 0.65,
//       size.height * 0.02,
//       size.width * 0.64,
//       size.height * -0.02,
//     );
//     // path.quadraticBezierTo(
//     //   size.width * 0.7,
//     //   size.height * -0.02,
//     //   size.width * 0.7,
//     //   size.height *-0.02,
//     // );
// // Right border
//     path.quadraticBezierTo(
//       size.width * 0.85,
//       size.height *-0.02,
//       size.width * 0.8,
//       size.height *-0.02,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.97,
//       size.height * -0.02,
//       size.width *  1,
//       size.height * -0.02,
//     );
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.lineTo(0, size.height * 0.6);
//     canvas.drawPath(path, paint);
//     final paint1 = Paint();
//     paint1.style = PaintingStyle.fill;
//     paint1.color = Colors.white;
//     canvas.drawPath(path, paint1);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {

//     return true;
//   }
// }