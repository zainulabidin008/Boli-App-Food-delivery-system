import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../welcome_screens/welcome_screen.dart';

class OnBoardScreenFirst extends StatelessWidget {
  const OnBoardScreenFirst({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt index = 0.obs;
    return Scaffold(
      body: Obx(
        () => Stack(children: [
          Align(
            alignment: Alignment.bottomRight,
            child: getJpgImage('onboard1.jpg'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: getSvgImage('onboard2.svg'),
          ),
          index.value == 1
              ? Positioned(bottom: 16.h,left: 6.h,
                child: SizedBox(height: 34.7.h,
                  child: getPngImage('onboard4.png',height: 34.7.h,),
                ),
              )
              : Positioned(bottom: 16.h,left: 6.h,
                child: SizedBox(height: 34.7.h,
                  child: getSvgImage(
                    'onboard3.svg',height:  34.7.h,
                  ),
                ),
              ),
          Positioned(
            bottom: 3.h,
            right: 19.h,
            left: 19.h,
            child: Row(
              children: [
                Container(
                  height: 7.38,
                  width: 7.38,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index.value == 0 ? Colors.red : Colors.white),
                ),
                getHorSpace(1.h),
                Container(
                  height: 7.38,
                  width: 7.38,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index.value == 1 ? Colors.red : Colors.white),
                ),
                getHorSpace(1.h),
                Container(
                  height: 7.38,
                  width: 7.38,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index.value == 0 ? Colors.white : Colors.white),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Column(children: [
              getVerSpace(8.3.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: index.value == 1 ? 'Nourishify ' : 'Flavorlytic ',
                        style: CustomTextStyles.onBoardHeadingRedStyle),
                    TextSpan(
                        text: 'food',
                        style: CustomTextStyles.onBoardHeadingGreenStyle),
                  ],
                ),
              ),
              getVerSpace(2.h),
              Text(
                'Lorem ipsum dolor sit amet, consectetu elit, sed eiusmod tempor Lorem ipsum dolor sit amet, consectetu elit, sed do ',
                style: CustomTextStyles.onBoardSimpleTextStyle,
                textAlign: TextAlign.center,
              ),
              getVerSpace(6.7.h),
              customElevatedButton(() {
                if (index.value == 0) {
                  index.value = 1;
                } else {
                  index.value = 0;
                  Get.offAll(() => const WelcomeScreen());
                }
              },
                  tittle: 'Next',
                  borColor: ConstantColors.greenColor,
                  height: 3.h,
                  width: 14.2.h,
                  tittleColor: ConstantColors.greenColor),
            ]),
          ),
        ]),
      ),
    );
  }
}
