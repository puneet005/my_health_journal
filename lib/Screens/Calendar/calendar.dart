import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_health_journal/Screens/Calendar/appointment_bottom_sheet.dart';
import 'package:my_health_journal/Screens/Calendar/procedures_view.dart';
import 'package:my_health_journal/Screens/Calendar/test_view.dart';
import 'package:my_health_journal/common-widgets/base_image_network.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/controllers/calendar_controller.dart';
import 'package:my_health_journal/models/patient_list_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/routers/app_routers.dart';

import '../../resources/text_utility.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final controller =  Get.find<CalendarContorller>();
  // var _currentDate = DateTime.now();
  // DateTime? _targetDateTime = DateTime.now();
  // String _currentMonth = DateFormat.yMMMM().format(DateTime.now());

  @override
  void initState() { 
    super.initState();
    controller.GetCalendarEventApi();
    // setState(() {
    //   // _targetDateTime = DateTime(_currentDate.year);
      
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GetBuilder<CalendarContorller>(
        // init: MyController(),
        // initState: (_) {},
        builder: (ctrl) {
          return  Container(
             width: double.infinity,
                      height: Get.height,
                         decoration: const BoxDecoration(  
                          color: AppColors.bgColor,          
                    image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
                    fit: BoxFit.fill
                    )
                  ),
                  child: ListView(              
                    shrinkWrap: true,
                    children: [
                      addHeight(30),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.sp,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [  
                            // SizedBox(width: 50,),
                            // Spacer(),                                            
                            addHeadingTxtMedium("Calendar", fontSize: 15.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-medium" ),
                            // Spacer(),   
                            // InkWell(
                            //   onTap: (){
                            //     Get.back();
                            //   },
                            //   child: SvgPicture.asset(AppAssets.notificationIcon)),
                                       ],
                                    ),
            ),
            addHeight(20),
            Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 10.h
                  ),
                  child: Container(
                    width: Get.width / 1.5,
                    height: Get.height / 2.04,  
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                       boxShadow: const [ 
                        BoxShadow(
                            color: AppColors.blackColor2,
                            blurRadius: 3,
                          ),]            
                    ),
             child: Column(              
                   children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 14.h,
                        vertical: 10.h
                      ),
                      child: Row(
                        children: [
                          addHeadingTxtMedium(controller.currentMonth, fontSize: 20, fontFamily: "Montserrat-semibold"),
                          Spacer(),
                          InkWell(
                            onTap: (){
                              //  setState(() {
                           controller.targetDateTime = DateTime(
                                controller.targetDateTime!.year, controller.targetDateTime!.month - 1);
                                controller.showingDate = DateTime(controller.targetDateTime!.year, controller.targetDateTime!.month - 1);
                             controller.currentMonth =
                                  DateFormat.yMMM().format(controller.targetDateTime!);
                            // });
                            controller.GetCalendarEventApi();
                            controller.update();
                            },
                            child: SvgPicture.asset(AppAssets.leftIcon, height: 25.h,)),
                          addWidth(10),
                          InkWell(
                            onTap: (){
                              //  setState(() {
                            controller.targetDateTime = DateTime(
                                  controller.targetDateTime!.year, controller.targetDateTime!.month + 1);
                              controller.currentMonth =
                                  DateFormat.yMMM().format(controller.targetDateTime!);
                                  controller.showingDate = DateTime(controller.targetDateTime!.year, controller.targetDateTime!.month + 1);
                            // });
                            controller.GetCalendarEventApi();
                            controller.update();
                            },
                            child: SvgPicture.asset(AppAssets.rightIcon,  height: 25.h,)),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 14.h
                        
                      ),
                      child: const Divider(
                        thickness: 1.2,
                      ),
                    ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: CalendarCarousel<Event>(
                        
      todayBorderColor: Colors.green,
      childAspectRatio: 1.3,
      
      onDayPressed: (date, events) {
        // this.setState(() => _currentDate2 = date);
        // events.forEach((event) => print(event.title));
      },
      // daysHaveCircularBorder: false,
       weekdayTextStyle: TextStyle(color: AppColors.blackColor, fontFamily: "Montserrat-semibold", fontWeight: FontWeight.w200, fontSize: 12),
      showOnlyCurrentMonthDate: false,
        weekendTextStyle: const TextStyle(
            color: AppColors.blackColor,
          ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,      
      height: 240.h,
      
      

      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
        const CircleBorder(side: BorderSide(color: AppColors.orangeColor2)),
      markedDateCustomTextStyle: const TextStyle(
        fontSize: 18,
        color: AppColors.appColor,
      ),
      showHeader: false,
      todayTextStyle: const TextStyle(
        // color: Colors.,
      ),
      // markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      // markedDateMoreShowTotal:
      //     true,
      todayButtonColor: AppColors.appColor,
      targetDateTime: controller.targetDateTime,
      minSelectedDate: controller.currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: controller.currentDate.add(Duration(days: 360)),
      inactiveDaysTextStyle:  TextStyle(
        color: Colors.tealAccent,
        fontSize: 12.sp,
      ),
      markedDatesMap: controller.markedDateMap,
      onCalendarChanged: (DateTime date) {
        // this.setState(() {
          controller.targetDateTime = date;
          controller.currentMonth = DateFormat.yMMM().format(date);
          controller.update();
        // });
      },
  markedDateWidget: Container(
    decoration: const BoxDecoration(
      color: Colors.transparent,
      shape: BoxShape.circle,
    ),  
    // margin: EdgeInsets.symmetric(horizontal: 10.0),
  ),
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
      
    ),                  
  ),
                    
                   ],
             ),
                           ),
            ),    
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: GetBuilder<BottomBarController>(
                                  builder: (bottonCtrl){
                                    return Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                                              width: Get.width,
                                                              height: 50.h,
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  // color: ctrl. ?  Colors.red : AppColors.dotBorderColor
                                                            ),
                                                          borderRadius: BorderRadius.circular(10),
                                                          // color: AppColors.whiteColor
                                                        ),
                                                        child:                                           
                                                          DropdownButtonFormField<PatientListMember>(   
                                                            // isExpanded: true,       
                                                                    decoration: const InputDecoration(
                                                           errorStyle: TextStyle(height: 0),
                                                             border: UnderlineInputBorder(
                                                                 borderSide: BorderSide.none
                                                             )),
                                                                    value: ctrl.selectedMember,
                                                                    hint: addRegularTxt(" Select Member"),
                                                                    onChanged: (val){
                                                           ctrl.selectedMember = val;
                                                           ctrl.update();
                                                           ctrl.GetSelectedMemberCalendarEventApi();
                                                                    },
                                                            validator: (val){
                                                           if(ctrl.selectedMember == null){                                                      
                                                             return "";
                                                           }
                                                           return null;    
                                                                    },
                                                                    items: bottonCtrl.patientList!
                                                                                      .where((item) => item != null) // Filter out null values
                                                                                      .map((item) => DropdownMenuItem(
                                                                                          value: item,
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsets.only(left: 10),
                                                                                            child: addRegularTxt(item.name.toString(), fontSize: 14),
                                                                                          ),
                                                                                      ))
                                                                                      .toList(),                                                             
                                                                  ),
                                                      
                                                ),
                                        ),
                                               if(ctrl.selectedMember != null)
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: InkWell(
                                                          onTap: (){
                                                            ctrl.selectedMember = null;
                                                            ctrl.GetCalendarEventApi();
                                                          },
                                                          child: addBoldTxt("Show All", color: AppColors.red)),
                                                      )
                                      ],
                                    ).paddingOnly(bottom: 10);
                                    // return     container.paddingOnly(bottom: 10);
                                  }
                                  ),
             ),        
            if(controller.calendarData  != null)
                    controller.calendarData!.isEmpty ? Container(
                      height: Get.height/ 3.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppAssets.calendar2Icon),
                          addHeight(10),
                          addBoldTxt("Not Event Found!")
                        ],
                      ),
                    ) :  ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(controller.calendarData!.length, (index) => Padding(
                      padding:  EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 4.h
          ),
      child: InkWell(
        onTap: (){
          if(controller.calendarData![index].titleName == "Appointment"){
            AppointmentBottomSheet(context, controller.calendarData![index]); 
          }
          else if(controller.calendarData![index].titleName == "Procedures"){
            ProceduresBottomSheet(context, controller.calendarData![index]);
          }
          else{
            TestAndScansBottomSheet(context, controller.calendarData![index]);
          }
          // Get.toNamed(AppRoutes.doctorVisit);
        },
        child: Card(
          
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp)
            ),
          child: Padding(
            padding:  EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 8.h
            ),
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [           
                      BaseImageNetwork(
                                      fit: BoxFit.cover,
                                      borderRadius: 10,
                                      link:"${ApiUrls.domain}${controller.calendarData![index].member!.profile}",
                                      concatBaseUrl: true,
                                      isAssetImage: false,
                                      height: 60.h,
                                      width: 60.h,
                                      topMargin: 2,
                                      rightMargin: 2,
                                      leftMargin: 2,
                                      bottomMargin: 2,
                                      errorWidget: const Icon(Icons.error, size: 40),
                                    ),
                                    addWidth(10),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [                                
                                        addHeadingTxtMedium(controller.calendarData![index].member!.name ?? "", fontSize: 14, color: AppColors.blackColor, fontFamily: "Montserrat-semibold"),
                                        addHeight(5),
                                        addRegularTxt(controller.calendarData![index].titleName ?? "", fontSize: 12)
                                      ],
                                    ),
                                    Spacer(),
                                    RotatedBox(
      quarterTurns: 1,
      child: Container(
        width: 70.h,
        decoration: BoxDecoration(
           color: index % 2 == 0 ? AppColors.appColor : AppColors.orangeColor,
           borderRadius: BorderRadius.circular(10)
        ),       
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: addBoldTxt(controller.calendarData![index].member!.relation!.capitalize ?? "", fontSize: 12, color: AppColors.whiteColor, overflow: TextOverflow.ellipsis,)),
        ),
      ),
    ),                                  
                                    // Icon(Icons.menu)           
                  ],
            ),
      
          ),
        ),
      ),
    )),
                      // children:,
                     ),
                    ]));})
    );
  }
}