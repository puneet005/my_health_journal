import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_health_journal/common-widgets/base_image_network.dart';
import 'package:my_health_journal/common-widgets/custom_textfield.dart';
import 'package:my_health_journal/controllers/calendar_controller.dart';
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
  var _currentDate = DateTime.now();
   DateTime? _targetDateTime = DateTime.now();
  String _currentMonth = DateFormat.yMMMM().format(DateTime.now());

  @override
  void initState() { 
    super.initState();
    setState(() {
      // _targetDateTime = DateTime(_currentDate.year);
      
    });
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [  
                            SizedBox(width: 50,),
                            Spacer(),                                            
                            addHeadingTxtMedium("Calendar", fontSize: 15.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-medium" ),
                            Spacer(),   
                            InkWell(
                              onTap: (){
                                Get.back();
                              },
                              child: SvgPicture.asset(AppAssets.notificationIcon)),
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
                          addHeadingTxtMedium(_currentMonth, fontSize: 20, fontFamily: "Montserrat-semibold"),
                          Spacer(),
                          InkWell(
                            onTap: (){
                               setState(() {
                              _targetDateTime = DateTime(
                                  _targetDateTime!.year, _targetDateTime!.month - 1);
                              _currentMonth =
                                  DateFormat.yMMM().format(_targetDateTime!);
                            });
                            },
                            child: SvgPicture.asset(AppAssets.leftIcon, height: 25.h,)),
                          addWidth(10),
                          InkWell(
                            onTap: (){
                               setState(() {
                              _targetDateTime = DateTime(
                                  _targetDateTime!.year, _targetDateTime!.month + 1);
                              _currentMonth =
                                  DateFormat.yMMM().format(_targetDateTime!);
                            });
                            },
                            child: SvgPicture.asset(AppAssets.rightIcon,  height: 25.h,)),
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
      
      

      customGridViewPhysics: NeverScrollableScrollPhysics(),
      // markedDateCustomShapeBorder:
      //     CircleBorder(side: BorderSide(color: Colors.yellow)),
      // markedDateCustomTextStyle: TextStyle(
      //   fontSize: 18,
      //   color: Colors.blue,
      // ),
      showHeader: false,
      todayTextStyle: TextStyle(
        // color: Colors.,
      ),
      // markedDateShowIcon: true,
      // markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      // markedDateMoreShowTotal:
      //     true,
      todayButtonColor: AppColors.appColor,
       targetDateTime: _targetDateTime,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      // prevDaysTextStyle: TextStyle(
      //   fontSize: 16,
      //   color: Colors.pinkAccent,
      // ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
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
            ),
            Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                        height: 50,
                        decoration:  BoxDecoration(
                          color: AppColors.borderColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                            horizontal: 10.h
                          ),
                          child:  const Center(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search by symptoms",
                                suffixIcon: Icon(Icons.search, color: AppColors.brownColor,),
                                // suffix: SvgPicture.asset(AppAssets.bottomNav4, color: AppColors.borderColor,),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        )
                      ),
            ),
                     ListView(
                      shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(controller.patientList.length, (index) => Padding(
      padding:  EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 4.h
          ),
      child: InkWell(
        onTap: (){

          Get.toNamed(AppRoutes.doctorVisit);
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
                                      link:controller.patientList[index]['img'],
                                      concatBaseUrl: true,
                                      isAssetImage: true,
                                      height: 60.h,
                                      width: 60.h,
                                      topMargin: 2,
                                      rightMargin: 2,
                                      leftMargin: 2,
                                      bottomMargin: 2,
                                      errorWidget: const Icon(Icons.error, size: 70),
                                    ),
                                    addWidth(10),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [                                
                                        addHeadingTxtMedium(controller.patientList[index]['name'], fontSize: 14, color: AppColors.blackColor, fontFamily: "Montserrat-semibold"),
                                        addHeight(5),
                                        addRegularTxt(controller.patientList[index]['visit'], fontSize: 12)
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
          child: Center(child: addBoldTxt(controller.patientList[index]['about'], fontSize: 12, color: AppColors.whiteColor, overflow: TextOverflow.ellipsis,)),
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