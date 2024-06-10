import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/common-widgets/base_image_network.dart';
import 'package:my_health_journal/controllers/home_controller.dart';
import 'package:my_health_journal/controllers/profile_controller.dart';
import 'package:my_health_journal/models/auth/profile_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class CommentUi extends StatefulWidget {
  Map<String, dynamic> comment;
  String type;
  int index;
  ProfileModelData? userData;
  CommentUi({super.key, required this.comment, required this.userData, required this.type, required this.index});

  @override
  State<CommentUi> createState() => _CommentUiState();
}

class _CommentUiState extends State<CommentUi> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    log(widget. comment.toString());       
    //  final profile = Get.put(ProfileContorller());
    // log(comment.toString());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        
        decoration: BoxDecoration(
          color: AppColors.whiteColor, 
          borderRadius: BorderRadius.circular(10)
    
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: widget.userData!.profile != null ?  
                   Image.network("${ApiUrls.domain}${widget.userData!.profile}",
                    fit: BoxFit.fill,
                     width: 60,
                   height: 60,
                  ):
                 Image.asset(AppAssets.profileIcon, width: 60,
                 height: 60,),
                ),
                  addWidth(10),
                 Expanded(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      addBoldTxt(widget.userData!.name.toString()),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // addHeadingTxtMedium("", fontSize: 12, color: AppColors.greyColor4, ),
                          // addWidth(10),
                          // addHeadingTxtMedium("|", fontSize: 16, color: AppColors.greyColor4,),
                          // addWidth(10),
                          addHeadingTxtMedium("${widget.comment['time']}", fontSize: 12, color: AppColors.greyColor4,)
                        ],
                      )
                    ],
                   ),
                 ), 
                 IconButton(onPressed: (){
                  if(widget.type == "lab"){
                        controller.testScanCommitList.removeAt(widget.index);
                  }
                  else{
                      controller.proceduresMainCommitList.removeAt(widget.index);
                  }
                  controller.update();
                 }, icon: Icon(Icons.delete, color: AppColors.red,))
                ],
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text.rich(
                 TextSpan(
                   children: [
                     const TextSpan(text: 'Comment: ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,)),     
                     TextSpan(text: "${widget.comment['title']}", style: const TextStyle(fontSize: 12,) ),
                   ],
                 ),
               ),
               )
        
            ],
          ),
        ),
      ),
    );
  }
}