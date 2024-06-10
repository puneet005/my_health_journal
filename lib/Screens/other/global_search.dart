

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_health_journal/Screens/home/labs_scans/test_scan_details.dart';
import 'package:my_health_journal/Screens/home/medications/medication_details.dart';
import 'package:my_health_journal/Screens/other/provder_screenh.dart';
import 'package:my_health_journal/Screens/other/search_widget/appointment_dialog.dart';
import 'package:my_health_journal/Screens/other/search_widget/sysptoms_dialog.dart';
import 'package:my_health_journal/Screens/widget/patient_card.dart';
import 'package:my_health_journal/common-widgets/base_image_network.dart';
import 'package:my_health_journal/controllers/bottom_bar_controller.dart';
import 'package:my_health_journal/controllers/shimmer_loading.dart';
import 'package:my_health_journal/models/home/appointment_list_model.dart';
import 'package:my_health_journal/models/home/get_test_scan_model.dart';
import 'package:my_health_journal/models/home/medication_list_model.dart';
import 'package:my_health_journal/models/home/procedures_list_model.dart';
import 'package:my_health_journal/models/home/provider_view_model.dart';
import 'package:my_health_journal/models/home/symphtom_list_model.dart';
import 'package:my_health_journal/models/patient_list_model.dart';
import 'package:my_health_journal/models/seach_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class GlobalSearch extends StatefulWidget {
  const GlobalSearch({super.key});

  @override
  State<GlobalSearch> createState() => _GlobalSearchState();
}

class _GlobalSearchState extends State<GlobalSearch> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<BottomBarController>(
      // init: MyController(),
      initState: (_) {},
      builder: (ctrl) {
        return  
        Scaffold(
               resizeToAvoidBottomInset: true,    
              backgroundColor: Colors.transparent,
              body:
        Padding(
           padding:  EdgeInsets.symmetric(
            horizontal: 14.h,
            vertical: 8.h,
          ),
          child: Column(
            children: [
              addHeight(50.h),
             Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [                          
            addHeadingTxtMedium("Search", fontSize: 15.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-medium" ),                     
              ],
                    ),
              addHeight(16.h), 
                Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
          height: 50,
          decoration:  BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: AppColors.blackColor2
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 10.h
            ),
            child:   Center(
              child: TextField(   
                controller: ctrl.searchName,                           
                decoration: const InputDecoration(                  
                  fillColor: Colors.transparent,
                  hintText: "Search",
                  suffixIcon: Icon(Icons.search, color: AppColors.brownColor,),
                  // suffix: SvgPicture.asset(AppAssets.bottomNav4, color: AppColors.borderColor,),
                  border: InputBorder.none,
                ),
                onChanged: (val){
                 if(val.trim().isNotEmpty){
                  ctrl.SearchApi();
                 } 
                },
              ),
            ),
          )
        ),
           ),   
           ctrl.searchList == null && !ctrl.searchLoading ? EmptyUi()   : 
           Container(
            height: Get.height / 1.5,
            child: ctrl.searchLoading ? const ShimmerLoading() : 
             ctrl.searchList !=  null ? 
             SearchUi(ctrl.searchList!, context):EmptyUi(),
          ),
          //  Expanded(child:  Center(
          //   child: 
            //  Container(
            //   child:Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Image.asset(AppAssets.notFound, height: Get.height / 5,
            //       width: Get.width,), 
            //       addHeight(20),
            //       addRegularTxt("Search Result Not Found!!")
            //     ],
            //   ), 
            // 
            // ),
          //  ) 
          //  )    
                   ]),));}             
    );
  }
}
EmptyUi(){
  return Expanded(child:  Center(
            child: 
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Image.asset(AppAssets.notFound, height: Get.height / 5,
                 width: Get.width,), 
                 addHeight(20),
                 addRegularTxt("Search Result Not Found!!")
               ],
             ),
           ) 
           );
}
SearchUi(SeachModelData data, BuildContext ctx){
  return  ListView(
    // shrinkWrap: true,
    children: [
      // Appointment
      if(data.appointment!.isNotEmpty)
      SearchTitle("Appointment"),
      if(data.appointment!.isNotEmpty)      
      AppoimantUi(data.appointment!, ctx),
      // Member
      if(data.member!.isNotEmpty)
     SearchTitle("Member"),
      if(data.member!.isNotEmpty)
      MemberUi(data.member!),
      // Procedures
      if(data.procedures!.isNotEmpty)
      SearchTitle("Procedures"),
      if(data.procedures!.isNotEmpty)
      ProceduresUi(data.procedures,),
      // Tests And Scans
      if(data.testScan!.isNotEmpty)
      SearchTitle("Tests And Scans"),
      if(data.testScan!.isNotEmpty)
      TestScanUi(data.testScan),
      // Medication
      if(data.medication!.isNotEmpty)
      SearchTitle("Medication"),
      if(data.medication!.isNotEmpty)
      MedicationUi(data.medication),
        // Symptoms
      if(data.symptoms!.isNotEmpty)
      SearchTitle("Symptoms"),
      if(data.symptoms!.isNotEmpty)
      SymptomsUi(data.symptoms, ctx),
      // Provider
      if(data.provider!.isNotEmpty)
      SearchTitle("Provider"),
      if(data.provider!.isNotEmpty)
      ProviderUi(data.provider, ctx),
    

      
    ],
  
  );
}

SearchTitle(String title){
  return  Row(
        children: [addBoldTxt(title)],
      );
}

ProceduresUi(List<ProceduresListModelData>? data) {

  return ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: List.generate(data!.length, (index) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor, 
                                      borderRadius: BorderRadius.circular(20.h),
                                  
                                    ),
                                    width: Get.width / 1.1,
                                    height: Get.height / 8,
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(
                                        horizontal: 10.h,                                
                                      ),
                                      child: Row(children: [
                                        data[index].file != null  ?
                                        // CircleAvatar(
                                        //   radius: 30,
                                        //   backgroundImage:  NetworkImage("${ApiUrls.domain}${bottomCont.medicationList![index].file}"),
                                        //                         //  child:   , 
                                        // ) 
                                         BaseImageNetwork(
                                        fit: BoxFit.cover,
                                        borderRadius: 40,
                                        link: "${ApiUrls.domain}${data[index].file}",
                                        concatBaseUrl: true,
                                        isAssetImage: false,
                                        height: 60.h,
                                        width: 60.h,
                                        topMargin: 2,
                                        rightMargin: 2,
                                        leftMargin: 2,
                                        bottomMargin: 2,
                                        errorWidget: const Icon(Icons.error, size: 40),
                                      )
                                        : CircleAvatar(
                                          radius: 30,
                                          child:  SvgPicture.asset(AppAssets.proceduresIcon),
                                        ),
                                        addWidth(10.h),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // if(bottomCont.medicationList![index].getProvider != null)
                                              addRegularTxt("${data[index].type ?? ""}", fontSize: 16.h),
                                              addHeadingTxtMedium("${data[index].dateOfProcedure ?? ""}", fontSize: 14, fontFamily: 'Montserrat-light'),
                                              // addHeadingTxtMedium(bottomCont.providerListData[index].phone ?? "", fontSize: 14, fontFamily: 'Montserrat-light', maxLines: 1, overflow: TextOverflow.ellipsis),
                                          
                                            ],
                                          ),
                                        )
                                      ],),
                                    ),
                                  ),
    )),
  );
}

MemberUi(List<PatientListMember> data) {
  return ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: List.generate(data.length, (index) =>  PatientCard(
                                          data: data[index],
                                        ),    )
  );
}

AppoimantUi(List<AppointmentListModelData>? data, BuildContext context) {
  return  ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
        children: List.generate(data!.length, (index) => InkWell(
          onTap: (){
             AppointMantUIBottonSheetView(context,data[index]);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor, 
                                        borderRadius: BorderRadius.circular(20.h),
                                    
                                      ),
                                      width: Get.width / 1.1,
                                      height: Get.height / 8,
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(
                                          horizontal: 10.h,                                
                                        ),
                                        child: Row(children: [
                                          data[index].photo != null  ?
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundImage:  NetworkImage("${ApiUrls.domain}${data[index].photo}"),
                                                                  //  child:   , 
                                          ) : CircleAvatar(
                                            radius: 30,
                                            child:  SvgPicture.asset(AppAssets.appointmentIcon),
                                          ),
                                          addWidth(10.h),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                if(data[index].getProvider != null)
                                                addRegularTxt(data[index].getProvider!.name ?? "", fontSize: 16.h),
                                                addHeadingTxtMedium(data[index].visitDate ?? "", fontSize: 14, fontFamily: 'Montserrat-light'),
                                                // addHeadingTxtMedium(bottomCont.providerListData[index].phone ?? "", fontSize: 14, fontFamily: 'Montserrat-light', maxLines: 1, overflow: TextOverflow.ellipsis),
                                            
                                              ],
                                            ),
                                          )
                                        ],),
                                      ),
                                    ),
          ),
        ),),
      );



}

TestScanUi(List<GetTestScanModelData>? data,) {
  return ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: List.generate(data!.length, (index) => InkWell(
      onTap: (){
         Get.to(TestScansDetailsView(data: data[index]));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor, 
                                        borderRadius: BorderRadius.circular(20.h),
                                    
                                      ),
                                      width: Get.width / 1.1,
                                      height: Get.height / 8,
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(
                                          horizontal: 10.h,                                
                                        ),
                                        child: Row(children: [
                                          data[index].file != null  ?                                 
                                           BaseImageNetwork(
                                          fit: BoxFit.cover,
                                          borderRadius: 40,
                                          link: "${ApiUrls.domain}${data[index].file}",
                                          concatBaseUrl: true,
                                          isAssetImage: false,
                                          height: 60.h,
                                          width: 60.h,
                                          topMargin: 2,
                                          rightMargin: 2,
                                          leftMargin: 2,
                                          bottomMargin: 2,
                                          errorWidget: const Icon(Icons.error, size: 40),
                                        )
                                          : CircleAvatar(
                                            radius: 30,
                                            child:  SvgPicture.asset(AppAssets.labsScansIcon),
                                          ),
                                          addWidth(10.h),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                // if(bottomCont.medicationList![index].getProvider != null)
                                                addRegularTxt("${data[index].name ?? ""}", fontSize: 16.h),
                                                addHeadingTxtMedium("${data[index].scanTest ?? ""}", fontSize: 14, fontFamily: 'Montserrat-light'),
                                                // addHeadingTxtMedium(bottomCont.providerListData[index].phone ?? "", fontSize: 14, fontFamily: 'Montserrat-light', maxLines: 1, overflow: TextOverflow.ellipsis),
                                            
                                              ],
                                            ),
                                          )
                                        ],),
                                      ),
                                    ),
      ),
    ),),
  );
}
MedicationUi(List<MedicationListModelData>? data) {
  return ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: List.generate(data!.length, (index) => InkWell(
      onTap: (){
         Get.to(MedicationDetailsView(data: data[index]));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor, 
                                      borderRadius: BorderRadius.circular(20.h),
                                  
                                    ),
                                    width: Get.width / 1.1,
                                    height: Get.height / 8,
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(
                                        horizontal: 10.h,                                
                                      ),
                                      child: Row(children: [
                                        data[index].file != null  ?
                                        // CircleAvatar(
                                        //   radius: 30,
                                        //   backgroundImage:  NetworkImage("${ApiUrls.domain}${bottomCont.medicationList![index].file}"),
                                        //                         //  child:   , 
                                        // ) 
                                         BaseImageNetwork(
                                        fit: BoxFit.cover,
                                        borderRadius: 40,
                                        link: "${ApiUrls.domain}${data[index].file}",
                                        concatBaseUrl: true,
                                        isAssetImage: false,
                                        height: 60.h,
                                        width: 60.h,
                                        topMargin: 2,
                                        rightMargin: 2,
                                        leftMargin: 2,
                                        bottomMargin: 2,
                                        errorWidget: const Icon(Icons.error, size: 40),
                                      )
                                        : CircleAvatar(
                                          radius: 30,
                                          child:  SvgPicture.asset(AppAssets.medicationsIcon),
                                        ),
                                        addWidth(10.h),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // if(bottomCont.medicationList![index].getProvider != null)
                                              addRegularTxt("${data[index].name?? ""}  ${data[index].dosage?? ""}", fontSize: 16.h),
                                              addHeadingTxtMedium("${data[index].startDate?? ""} - ${data[index].endDate?? ""}", fontSize: 14, fontFamily: 'Montserrat-light'),
                                              // addHeadingTxtMedium(bottomCont.providerListData[index].phone ?? "", fontSize: 14, fontFamily: 'Montserrat-light', maxLines: 1, overflow: TextOverflow.ellipsis),
                                          
                                            ],
                                          ),
                                        )
                                      ],),
                                    ),
                                  ),
      ),
    ),),
  );
}
SymptomsUi(List<SymphtomListModelData>? data, BuildContext context) {
  return ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: List.generate(data!.length, (index) => InkWell(
      onTap: (){
          SysptomsBottonSheetView(context, data[index]);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor, 
                                        borderRadius: BorderRadius.circular(20.h),
                                    
                                      ),
                                      width: Get.width / 1.1,
                                      height: Get.height / 8,
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(
                                          horizontal: 10.h,                                
                                        ),
                                        child: Row(children: [
                                          data[index].file != null  ?
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundImage:  NetworkImage("${ApiUrls.domain}${data[index].file}"),
                                                                  //  child:   , 
                                          ) : CircleAvatar(
                                            radius: 30,
                                            child:  SvgPicture.asset(AppAssets.symptomsIcon),
                                          ),
                                          addWidth(10.h),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [                                       
                                                addHeadingTxtMedium(data[index].comment ?? "", fontSize: 14, fontFamily: 'Montserrat-light', maxLines: 4, overflow: TextOverflow.ellipsis),
                                                // addHeadingTxtMedium(bottomCont.providerListData[index].phone ?? "", fontSize: 14, fontFamily: 'Montserrat-light', maxLines: 1, overflow: TextOverflow.ellipsis),                                    
                                              ],
                                            ),
                                          )
                                        ],),
                                      ),
                                    ),
      ),
    ),),
  );
}
ProviderUi(List<ProviderViewModelData>? data, BuildContext context) {
  return ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: List.generate(data!.length, (index) => InkWell(
      onTap: (){
        ProviderBottonSheetView(context, data[index]);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor, 
                                        borderRadius: BorderRadius.circular(20.h),
                                    
                                      ),
                                      width: Get.width / 1.1,
                                      height: Get.height / 8,
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(
                                          horizontal: 10.h,                                
                                        ),
                                        child: Row(children: [
                                          data[index].reportInfo != null  ?
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundImage:  NetworkImage("${ApiUrls.domain}${data[index].reportInfo}"),
                                                                  //  child:   , 
                                          ) : CircleAvatar(
                                            radius: 30,
                                            child:  SvgPicture.asset(AppAssets.providersIcon),
                                          ),
                                          addWidth(10.h),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                addRegularTxt(data[index].name ?? "", fontSize: 16.h),
                                                addHeadingTxtMedium(data[index].specialization ?? "", fontSize: 14, fontFamily: 'Montserrat-light'),
                                                addHeadingTxtMedium(data[index].phone ?? "", fontSize: 14, fontFamily: 'Montserrat-light', maxLines: 1, overflow: TextOverflow.ellipsis),
                                            
                                              ],
                                            ),
                                          )
                                        ],),
                                      ),
                                    ),
      ),
    ),),
  );
}
// Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                         height: 50,
//                         decoration:  BoxDecoration(
//                           color: AppColors.borderColor,
//                           borderRadius: BorderRadius.circular(10)
//                         ),
//                         child: Padding(
//                           padding:  EdgeInsets.symmetric(
//                             horizontal: 10.h
//                           ),
//                           child:  const Center(
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 hintText: "Search by symptoms",
//                                 suffixIcon: Icon(Icons.search, color: AppColors.brownColor,),
//                                 // suffix: SvgPicture.asset(AppAssets.bottomNav4, color: AppColors.borderColor,),
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         )
//                       ),
//             ),