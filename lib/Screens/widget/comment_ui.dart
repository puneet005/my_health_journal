import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_health_journal/common-widgets/base_image_network.dart';
import 'package:my_health_journal/models/auth/profile_model.dart';
import 'package:my_health_journal/resources/api_constant.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class CommentUi extends StatelessWidget {
  CommentData comment;
  CommentUi({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    log(comment.toString());
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
                  child: comment.user!.profile != null ?  
                   Image.network("${ApiUrls.domain}${comment.user!.profile}",
                    fit: BoxFit.fill,
                     width: 60,
                   height: 60,
                  ):
                 Image.asset(AppAssets.profileIcon, width: 60,
                 height: 60,),
                ),
                  addWidth(10),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addBoldTxt(comment.user!.name.toString()),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // addHeadingTxtMedium("", fontSize: 12, color: AppColors.greyColor4, ),
                        // addWidth(10),
                        // addHeadingTxtMedium("|", fontSize: 16, color: AppColors.greyColor4,),
                        // addWidth(10),
                        addHeadingTxtMedium("${comment.time}", fontSize: 12, color: AppColors.greyColor4,)
                      ],
                    )
                  ],
                 )
                ],
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text.rich(
                 TextSpan(
                   children: [
                     const TextSpan(text: 'Comment: ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,)),     
                     TextSpan(text: comment.title, style: TextStyle(fontSize: 12,) ),
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