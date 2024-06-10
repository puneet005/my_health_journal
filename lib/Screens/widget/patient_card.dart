import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/Screens/home/patient_details2.dart';
import 'package:my_health_journal/common-widgets/base_image_network.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/models/patient_list_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
// import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';
// import 'package:my_health_journal/routers/app_routers.dart';

class PatientCard extends StatefulWidget {
  PatientListMember data;
   PatientCard({super.key, required this.data});

  @override
  State<PatientCard> createState() => _PatientCardState();
}

class _PatientCardState extends State<PatientCard> {
   final bottomCont = Get.find<BottomBarController>();
  
  @override
  Widget build(BuildContext context) {    
    return Padding(
      padding:  EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 4.h
          ),
      child: InkWell(
        onTap: (){
        bottomCont.selectedPatient = widget.data;      
        Get.toNamed(AppRoutes.patientDetails2);
        // Get.to(const PatientDetails2());  
        },
        child: Card(          
            // elevation: 2.0,
            color: AppColors.appColor2.withOpacity(0.6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp)
            ),
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 6.h
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
        BaseImageNetwork(
                                  fit: BoxFit.cover,
                                  borderRadius: 10,
                                  link: "${ApiUrls.domain}${widget.data.profile}",
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
                                    addHeadingTxtMedium(widget.data.name!, fontSize: 14, color: AppColors.blackColor, fontFamily: "Montserrat-semibold"),
                                    addHeight(5),
                                    addRegularTxt(widget.data.relation!, fontSize: 12)
                                  ],
                                ),
                                Spacer(),
                                DropdownButtonHideUnderline(
            child: DropdownButton2(
              customButton: SvgPicture.asset(AppAssets.threeDotIcon, color: AppColors.blackColor,),
              items: [
                ...MenuItems.firstItems.map(
                  (item) => DropdownMenuItem<MenuItem>(
                    value: item,
                    child: MenuItems.buildItem(item),
                  ),
                ),
              ],
              onChanged: (value) {
                MenuItems.onChanged(context, value! as MenuItem);
              },
              dropdownStyleData: DropdownStyleData(
                width: 160,
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.whiteColor,
                ),
                offset: const Offset(0, 8),
              ),
              menuItemStyleData: MenuItemStyleData(
                customHeights: [
                  ...List<double>.filled(MenuItems.firstItems.length, 48),                      
                ],
                padding: const EdgeInsets.only(left: 16, right: 16),
              ),
            ),
            ),
                              // Icon(Icons.menu)           
              ],
            ),
      
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [remove, share];


  static const remove = MenuItem(text: 'Remove', icon: Icons.delete);
  static const share = MenuItem(text: 'Share', icon: Icons.share);
  // static const settings = MenuItem(text: 'Settings', icon: Icons.settings);


  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: AppColors.blackColor,size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.remove:
        //Do something
        break;
      // case MenuItems.settings:
      //   //Do something
      //   break;
      case MenuItems.share:
        //Do something
        break;
      // case MenuItems.logout:
      //   //Do something
      //   break;
    }
  }
}