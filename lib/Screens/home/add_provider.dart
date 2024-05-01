import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_health_journal/Screens/widget/appbar.dart';
import 'package:my_health_journal/common-widgets/custom_button.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/calendar_controller.dart';
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
      body:   GetBuilder<CalendarContorller>(
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
                      AppBar1(title: "Add Provider"),
                      addHeight(20),
                      CustomTextField(
                        labelText:  "Doctor Name",

                      ),
                      addHeight(20),
                      CustomTextField(
                        labelText:  "Specialization",
                        
                      ),
                       addHeight(20),
                        CustomTextField(
                        labelText:  "Provider Website URL",
                        
                      ),
                       addHeight(20),
                      CustomTextField(
                        labelText:  "Account Number",
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
                            flagsButtonPadding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            
                            decoration: InputDecoration(    
                              floatingLabelAlignment: FloatingLabelAlignment.start,                        
                              label: addRegularTxt('Mobile Number', color: AppColors.greyColor1),
                              floatingLabelStyle: TextStyle(                           
                              ),
                              isDense: false,
                              filled: true,  
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: AppColors.orangeColor
                                ),
        
                                  // gapPadding: 20
                                // borderSide: BorderSide.none,
                              ), 
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: AppColors.orangeColor
                                ),)
        ,
        
                                                                                 
                              focusColor: AppColors.orangeColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: AppColors.orangeColor
                                ),
                                  // gapPadding: 20
                                // borderSide: BorderSide.none,
                              ),   
                              enabledBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: AppColors.orangeColor
                                ),                          
                              ) ,                         
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: AppColors.orangeColor
                                ),                               
                              ),
                            ),
                            showDropdownIcon: true,
                            dropdownIcon: Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.blackColor2,), 
                            dropdownIconPosition: IconPosition.trailing,                          
                            showCountryFlag: true,                          
                            initialCountryCode:'US',
                            onCountryChanged: (country) {
                              // log(country.dialCode);
                              // log(country.code);  
                             
                            },
                            onChanged: (phone)
                                           {
                            },
                             enabled: true,
                          ), 
                       addHeight(20),
                      CustomTextField(
                        labelText: "Date Of First Visit",
                      ), addHeight(20),
                       
             Padding(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
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
    text: "Save", onPressed: (){}),
),
addHeight(10)
                      ])));})
                       );
  }
  String _addPictureSheet(BuildContext context, int number ) {
  String? imgPath;
   final controller = Get.find<CalendarContorller>();
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
}