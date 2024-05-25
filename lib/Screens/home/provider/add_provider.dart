import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_health_journal/Screens/home/medications/add_medications.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/calendar_controller.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class AddProvider extends StatefulWidget {
  const AddProvider({super.key});

  @override
  State<AddProvider> createState() => _AddProviderState();
}

class _AddProviderState extends State<AddProvider> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,    
      body:   GetBuilder<HomeController>(
        // init: MyController(),
        // initState: (_) {},
        builder: (ctrl) {
          return Form(
            key: ctrl.providerForm,
            child: Container(                    
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
                        AppBar1(title: "Add Provider"),
                        addHeight(20),
                        CustomTextField(
                          controller: ctrl.providerName,
                          labelText:  "Doctor Name",
                          validator: (val){
                             if(val!.isEmpty){
                      return "Name is Required*";
                    }
                    else if (val.length < 2){
                      return "Please enter valid name*";
                    }
                    return null;
                          },
            
                        ),
                        addHeight(20),
                        CustomTextField(
                          controller: ctrl.providerSpecicalization,
                          labelText:  "Specialization",
                          validator: (val){
                             if(val!.isEmpty){
                      return "Specialization is Required*";
                    }
                  
                    return null;
                          }
                          
                        ),
                         addHeight(20),
                          CustomTextField(
                            controller: ctrl.providerWebUrl,
                          labelText:  "Provider Website URL",
                          // validator: (val){}
                          
                        ),
                         addHeight(20),
                        CustomTextField(
                          controller: ctrl.providerAccount,
                          labelText:  "Account Number",
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                             FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                // LengthLimitingTextInputFormatter(15),
                          ],
                        ),
                         addHeight(20),
                        IntlPhoneField(
                              // controller: profileController.phoneNoCtrl,                 
                              // autovalidateMode: AutovalidateMode.always,
                              disableLengthCheck: true,
                              keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                LengthLimitingTextInputFormatter(15),
                              ],
                              validator: (val){
                                  if(val!.number.length > 7 &&  val.number.length < 15){
                                      return null;
                                    }
                                    else{
                                        return 'Enter Valid Number*'.tr;
                                    }
                              },
                              flagsButtonPadding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              
                              decoration: InputDecoration(    
                                floatingLabelAlignment: FloatingLabelAlignment.start,                        
                                label: addRegularTxt('Contact Information', color: AppColors.greyColor1),
                                floatingLabelStyle: const TextStyle(                           
                                ),
                                isDense: false,
                                // filled: true,  
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: AppColors.orangeColor
                                  ),
                    
                                    // gapPadding: 20
                                  // borderSide: BorderSide.none,
                                ), 
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: AppColors.orangeColor
                                  ),)
                    ,
                    
                                                                                   
                                focusColor: AppColors.orangeColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: AppColors.orangeColor
                                  ),
                                    // gapPadding: 20
                                  // borderSide: BorderSide.none,
                                ),   
                                enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: AppColors.orangeColor
                                  ),                          
                                ) ,                         
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: AppColors.orangeColor
                                  ),                               
                                ),
                              ),
                              showDropdownIcon: true,
                              dropdownIcon: const Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.blackColor2,), 
                              dropdownIconPosition: IconPosition.trailing,                          
                              showCountryFlag: true,                          
                              initialCountryCode:'US',
                              onCountryChanged: (country) {
                                // log(country.dialCode);
                                // log(country.code);  
                               
                              },
                              onChanged: (phone)
                                             {
                                            ctrl.providerPhone.text = "${phone.countryCode} ${phone.number}";
                              },
                               enabled: true,
                            ), 
                         addHeight(20),
                        CustomTextField(
                          controller: ctrl.providerDateOfVisit,
                          readOnly: true,
                          validator: (val){
                              if(val!.isEmpty){
                      return "Date Of First Visit is Required*";
                    }
                  
                    return null;
                          },
                          onTap: (){
            _Calendarpop(context);
                          },
                          labelText: "Date Of First Visit",
                          
                            suffixIcon: Padding(
                        padding:  EdgeInsets.all(12.0.sp),
                        child: SvgPicture.asset(AppAssets.bottomNav3, color: AppColors.orangeColor,height: 20,),
                      ),
                        ), addHeight(20),
                         
               Padding(
                padding: EdgeInsets.symmetric(vertical: 6,),
                child: InkWell(
                  onTap: (){
                      _addPictureSheet(context, 2);
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: DottedBorder(
                          color: AppColors.dotBorderColor,
                          strokeWidth: 1,
                          borderType: BorderType.RRect,
                          dashPattern: [3,5],
                          radius: Radius.circular(10),                    
                            child: SizedBox(
                              height: 50.h,
                              width: Get.width,
                              child: Center(
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 10.sp),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: addRegularTxt(ctrl.patientReportInfoPath == "" ? "Patient Report Info": ctrl.patientReportInfoPath.split("/").last, maxLines: 1, overflow: TextOverflow.ellipsis)),
                                      Spacer(),
                                      Expanded(
                                        flex: 1,
                                        child: SvgPicture.asset(AppAssets.uploadIcon)),
                                      
                                    ],
                                  ),
                                ),
                              ))),
                      ),
                            // Positioned(
                            //   top: 0,
                            //   left: 8,
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       color: AppColors.whiteColor.withOpacity(0.8)
                            //     ),
                            //     child: addRegularTxt("Patient Report Info", color: AppColors.blackColor3, fontSize: 13.sp),
                            //   ),
                            // )
                    ],
                  ),
                )
              ),
                         addHeight(20),
                         Padding(
               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child:   CustomButton(
                height: 50,
                width: Get.width / 2,
                text: "Save", onPressed: (){
                  if(ctrl.providerForm.currentState!.validate()){
                    ctrl.AddProviderApi();
                  }
                }),
            ),
            addHeight(10)
                        ]))),
          );})
                       );
  }
  String _addPictureSheet(BuildContext context, int number ) {
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
                                                controller.patientReportInfoPath  = res.path;                                              
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
                                               controller.patientReportInfoPath  = res!.path;
                                              
                                                controller.update();                                                                                        
                                                // controller.update();                                                
                                              } ,
            // },
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


   _Calendarpop(BuildContext context){
              showDialog(
                    context: context,
                    // barrierColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return CustomDialog();
                    },
                  );
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
              ctrl.providerDateOfVisit.text = DateFormat('dd/MM/yyyy').format(date);
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
              //  ctrl.memberDOB.text = DateFormat('dd/MM/yyyy').format(date);
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
