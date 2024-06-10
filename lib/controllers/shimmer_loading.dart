import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({super.key});

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    return   ListView(
                                children: List.generate(5, (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: Get.width / 1.1,
                                    height: Get.height / 8,
                                    child: Shimmer.fromColors(
                                      baseColor: AppColors.bgColor.withOpacity(0.3),
                                      highlightColor: AppColors.appColor2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.appColor2,
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                      )
                                    ),
                                  ),
                                )),
                              ) ;
  }
}