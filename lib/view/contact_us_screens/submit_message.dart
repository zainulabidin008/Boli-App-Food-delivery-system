import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_colors.dart';
import '../../utils/bottomnavigationBar.dart';

class SubmitMessage extends StatelessWidget {
  const SubmitMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.4.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,

          children: [
          getVerSpace(10.h),
          getSvgImage('messagesubmit.svg'),
            getVerSpace(6.8.h),
            Text(
              'Lita Han your massage has been submitted successfully for further details kindly check your registered mail ',
              style: TextStyle(
                  fontSize: 14.px,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'segoeui',
                  color: const Color(0xff444444)),textAlign: TextAlign.center,
            ),
            getVerSpace(6.8.h),
            Align(
              alignment: Alignment.bottomCenter,
              child: customElevatedButton(() {
                Get.to(()=> BottomNavBar(commingIndex: 0,));
              },
                  tittle: 'Back to Homepage',
                  height: 4.4.h,
                  width: 30.9.h,
                  tittleColor: Colors.white,
                  borColor: ConstantColors.greenColor,
                  backColor: ConstantColors.greenColor),
            ),

          ],),
      ),
    );
  }
}
