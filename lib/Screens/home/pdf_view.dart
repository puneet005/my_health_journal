import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_health_journal/common-widgets/custom_bottom_navigation3.dart';
import 'package:my_health_journal/resources/app_assets.dart';
import 'package:my_health_journal/resources/app_color.dart';
import 'package:my_health_journal/resources/text_utility.dart';
import 'package:share_plus/share_plus.dart';

class PdfViewUi extends StatefulWidget {
  String path;
   PdfViewUi({super.key, required this.path});

  @override
  State<PdfViewUi> createState() => _PdfViewUiState();
}

class _PdfViewUiState extends State<PdfViewUi> {final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
              // width: ,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(                
                image: DecorationImage(image: AssetImage(AppAssets.bgImg2),
                fit: BoxFit.fill
                ),
              ),
              child: Column(
                children: [
                     addHeight(50),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.sp,),
                      child: InkWell(
                        onTap: (){
                          // Get.toNamed(AppRoutes.bottomNav);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                Get.back();
                              },
                              child: SvgPicture.asset(AppAssets.backArrowIcon)),
                            addHeadingTxtMedium("Medical Summary", fontSize: 15.sp,  color: AppColors.blackColor, fontFamily: "Montserrat-medium" ),
                            // const SizedBox(width: 40,),
                            IconButton(onPressed: () async {
                              final result = await Share.shareXFiles([XFile(widget.path)], text: 'Medical Summary');

if (result.status == ShareResultStatus.success) {
    print('Thank you for sharing the picture!');
}
                            }, icon: Icon(Icons.share,))
                                       ],
                                    ),
                      ),
                            ),
                            addHeight(20),
                            Expanded(child: PDFView(
  filePath: widget.path,
  enableSwipe: true,
  swipeHorizontal: true,
  autoSpacing: false,
  pageFling: false,
  onRender: (_pages) {
    setState(() {
      // pages = _pages;
      // isReady = true;
    });
  },
  onError: (error) {
    print(error.toString());
  },
  onPageError: (page, error) {
    print('$page: ${error.toString()}');
  },
  onViewCreated: (PDFViewController pdfViewController) {
    _controller.complete(pdfViewController);
  },
 
),)
                ],
              ),
              ),
              bottomNavigationBar: const NavBar2(),
    );
  }
}