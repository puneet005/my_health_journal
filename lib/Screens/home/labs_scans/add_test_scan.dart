import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_health_journal/Screens/home/appointmant/add_doctors_visit.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/Screens/widget/comment_ui.dart';
import 'package:my_health_journal/common-widgets/custom_bottom_navigation3.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/controllers/profile_controller.dart';
import 'package:my_health_journal/models/auth/profile_model.dart';
import 'package:my_health_journal/models/home/provider_view_model.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class AddTestScan extends StatefulWidget {
  const AddTestScan({super.key});

  @override
  State<AddTestScan> createState() => _AddTestScanState();
}

class _AddTestScanState extends State<AddTestScan> {
   final controller = Get.find<HomeController>();
   final profile = Get.put(ProfileContorller());
   DateTime date = DateTime.now();
   String? todayDate;
   final bottomCont = Get.find<BottomBarController>();

   @override
   void initState() {
     super.initState();
     bottomCont.getProviderListApi();
     todayDate =  DateFormat('EEE, dd MMMM yyyy').format(date);
   setState(() {});
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
                        child: Form(
                          key: controller.testScanForm,
                          child: ListView(
                            children: [
                           addHeight(30),
                            AppBar1(title: "Tests and Scans"),
                            addHeight(20),
                            CustomTextField(
                              
                              labelText:  "Name",
                              controller:  controller.testScanName,
                              validator: (val){
                                if(val!.isEmpty){
                                    return "Name is Required*";
                                }
                                return null;
                              },
                          
                            ),
                            addHeight(20),
                            GetBuilder<BottomBarController>(
                                builder: (bottonCtrl){
                                  return     Container(
                                                      width: Get.width,
                                                      height: 60.h,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: ctrl.testScanError ?  Colors.red : AppColors.dotBorderColor
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
          value: ctrl.testScanProvider,
          hint: addRegularTxt("Add Provider"),
          onChanged: (val){
            
            // ctrl.appointmentProvider = 
            ctrl.testScanProvider = val;
            ctrl.update();
          },
          validator: (val){
            if(ctrl.testScanProvider == null){
              ctrl.testScanError = true;
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
         
        ),
         ),
  ).paddingOnly(bottom: 10);
                                }
                                ),
                            // CustomTextField(
                            //   labelText:  "Provider",
                            //    controller:  controller.testScanProvider,
                            //   validator: (val){
                            //     if(val!.isEmpty){
                            //         return "Provider is Required*";
                            //     }
                            //     return null;
                            //   },
                              
                            // ),
                             addHeight(20),
                              CustomTextField(
                              labelText:  "Date of Test or Scan",
                              readOnly: true,
                              controller:  controller.testScanDate,
                              onTap: (){
                                _Calendarpop(context);
                              },
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(AppAssets.calendarIcon),
                              ),
                               
                              validator: (val){
                                if(val!.isEmpty){
                                    return "Date is Required*";
                                }
                                return null;
                              },
                              
                            ),
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
                                  child: Column(
                                    children: [
                                       TextFormField( 
                                        controller: controller.testScanComment,                       
                                        maxLines: 5,
                                        decoration: const InputDecoration(
                                          hintText: "Add New Comments",
                                          border: InputBorder.none
                                        ),
                                      ),
                                     Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                             decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(
                                                      color: AppColors.orangeColor3
                                                    )
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(4.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                  addWidth(10),
                                  SvgPicture.asset(AppAssets.bottomNav3, color: AppColors.orangeColor3, height: 14.h,),
                                  addWidth(10),
                                  addRegularTxt("${todayDate}", color: AppColors.orangeColor3, fontSize: 13.sp), 
                                  addWidth(10),                           
                                                      ],
                                                    ),
                                                  ),                                      
                                          ), 
                                          addWidth(10),
                                          CustomButton(text: "Save", onPressed: (){
                                              controller.testScanCommitList.add({
                                                'title' :controller.testScanComment.text.trim(),
                                              'time' : todayDate!,
                                             
                                          });
                                            //  controller.testScanCommitList.add(CommentData(
                                            //     title :controller.testScanComment.text.trim(),
                                            //   time : todayDate!,
                                            //   user : profile.profileData.data
                                            // ));
                                           
                                            controller.testScanComment.clear();
                                            log(controller.testScanCommitList.toString());
                                            controller.update();
                                          }, height: 25, fontSize: 14.sp, width: 90.h,)
                                        ],
                                      )
                          
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
                            //         child: addRegularTxt("Date of Test or Scan", color: AppColors.blackColor2, fontSize: 13.sp),
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
                                child: ctrl.testScanDocPath == "" ?  Column(
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
                                    image: DecorationImage(image: FileImage(File(ctrl.testScanDocPath)), fit: BoxFit.fill)
                                  ),
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
                            if(controller.testScanForm.currentState!.validate()){
                                    controller.AddTestScanApi();
           
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
                          //  CustomButton(
                          //     height: 50,
                          //     width: Get.width / 2,
                          //     text: "Save and Share", onPressed: (){
                          //       if(controller.testScanForm.currentState!.validate()){
                          //           controller.AddTestScanApi();
           
                          //       }
                          //     }),
                              addHeight(20),
                              if(controller.testScanCommitList.isNotEmpty)
                              Row(
                                children: [
                                  addHeadingTxtMedium("History:", fontSize: 16, fontFamily: "Montserrat-medium")
                                ],
                              ),
                              if(controller.testScanCommitList.isNotEmpty)
                              ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: List.generate(controller.testScanCommitList.length, (index) => CommentUi(comment: controller.testScanCommitList[index], userData: profile.profileData.data,
                                 type: "lab",
                                index: index,) ),
                              )
                          
                            ]),
                        )));
                          })
                 ,bottomNavigationBar: const NavBar2(),
               ),
         ],
       );
  }
 _Calendarpop(BuildContext context){

      showDialog(
                    context: context,
                    // barrierColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return CustomDialog();
                    },
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
                                                 
                                                  controller.testScanDocPath = res.path;
                                                
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
                                              controller.testScanDocPath = res.path;
                                                
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
            showTimePicker(
  initialTime: TimeOfDay.now(),
  // barrierColor: AppColors.appColor,
  context: context,
).then((value) {
Navigator.pop(context);  
ctrl.scanData =  DateFormat('dd/MM/yyyy').format(date).toString() ;
ctrl.scanVisitTime = "${value!.hour}:${value.minute}";
ctrl.testScanDate.text = DateFormat('dd/MM/yyyy').format(date).toString() + " ${value!.hour} : ${value.minute}"   ; 
 ctrl.update();
}); 
            // Navigator.pop(context);  
            //   ctrl.testScanDate.text = DateFormat('dd/MM/yyyy').format(date);   
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
          weekdayTextStyle: const TextStyle(color: AppColors.blackColor, fontFamily: "Montserrat-semibold", fontWeight: FontWeight.w200, fontSize: 10),
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
          minSelectedDate: _currentDate.subtract(const Duration(days: 360)),
          maxSelectedDate: _currentDate.add(const Duration(days: 360)),      
          inactiveDaysTextStyle: const TextStyle(
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