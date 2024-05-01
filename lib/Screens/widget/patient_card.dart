import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/common-widgets/base_image_network.dart';
import 'package:my_health_journal/resources/app_assets.dart';
// import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:my_health_journal/routers/app_routers.dart';

class PatientCard extends StatefulWidget {
  Map data;
   PatientCard({super.key, required this.data});

  @override
  State<PatientCard> createState() => _PatientCardState();
}

class _PatientCardState extends State<PatientCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 4.h
          ),
      child: InkWell(
        onTap: (){
          Get.toNamed(AppRoutes.patientDetails);
        },
        child: Card(
          
            elevation: 2.0,
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
                                  link: widget.data['img'],
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
                                    // Spacer(),
                                    // addHeight(10),
                                    addHeadingTxtMedium(widget.data['name'], fontSize: 14, color: AppColors.blackColor, fontFamily: "Montserrat-semibold"),
                                    addHeight(5),
                                    addRegularTxt(widget.data['about'], fontSize: 12)
                                  ],
                                ),
                                Spacer(),
                                DropdownButtonHideUnderline(
            child: DropdownButton2(
              customButton: SvgPicture.asset(AppAssets.threeDotIcon),
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
  static const List<MenuItem> firstItems = [remove, share, settings];


  static const remove = MenuItem(text: 'Remove', icon: Icons.delete);
  static const share = MenuItem(text: 'Share', icon: Icons.share);
  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);


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
      case MenuItems.settings:
        //Do something
        break;
      case MenuItems.share:
        //Do something
        break;
      // case MenuItems.logout:
      //   //Do something
      //   break;
    }
  }
}