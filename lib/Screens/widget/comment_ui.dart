import 'package:flutter/material.dart';
import 'package:my_health_journal/common-widgets/base_image_network.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';

class CommentUi extends StatelessWidget {
  String comment;
  CommentUi({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
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
                 Image.asset(AppAssets.patient2, width: 60,
                 height: 60,),
                  addWidth(10),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addBoldTxt("Maria Jobs"),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        addHeadingTxtMedium("Spouse", fontSize: 12, color: AppColors.greyColor4, ),
                        addWidth(10),
                        addHeadingTxtMedium("|", fontSize: 16, color: AppColors.greyColor4,),
                        addWidth(10),
                        addHeadingTxtMedium("Wed, 10 April 2024", fontSize: 12, color: AppColors.greyColor4,)
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
                     TextSpan(text: comment, style: TextStyle(fontSize: 12,) ),
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