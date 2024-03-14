import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../authentication_screens/login_screen.dart';
import '../authentication_screens/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxString isPressed = 'LogIn'.obs;
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        Align(
            alignment: Alignment.bottomRight,
            child: getJpgImage('welcomescreen.png')),
        Positioned(
          bottom: 3.h,
          left: 3.h,
          child: Row(
            children: [
              Container(
                height: 7.38,
                width: 7.38,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
              ),
              getHorSpace(1.h),
              Container(
                height: 7.38,
                width: 7.38,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
              ),
              getHorSpace(1.h),
              Container(
                height: 7.38,
                width: 7.38,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.h),
          child: Obx(
            () => Column(
              children: [
                getVerSpace(8.h),
                getSvgImage('welcome (2).svg', height: 35.h),
                getVerSpace(6.2.h),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Welcome to',
                      style: TextStyle(
                        fontSize: 19.px,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff3C3F46),
                      ),
                    ),
                    TextSpan(
                      text: ' BOLI!',
                      style: TextStyle(
                        fontSize: 19.14.px,
                        color: ConstantColors.greenColor,
                      ),
                    ),
                  ]),
                ),
                getVerSpace(1.6.h),
                Text(
                  'Lorem ipsum dolor sit amet, consectetu elit, sed ',
                  style: CustomTextStyles.welcomeSimpleTextStyle,
                ),
                getVerSpace(7.h),
                customElevatedButton(() {
                  isPressed.value = 'LogIn';
                  Get.offAll(() => const LoginScreen());
                },
                    tittle: 'LogIn',
                    borColor: isPressed.value == 'LogIn'
                        ? ConstantColors.greenColor
                        : ConstantColors.textFieldGrey,
                    tittleColor: Colors.white,
                    backColor: isPressed.value == 'LogIn'
                        ? ConstantColors.greenColor
                        : ConstantColors.textFieldGrey,
                    height: 4.4.h,
                    width: 30.9.h),
                getVerSpace(2.1.h),
                customElevatedButton(() {
                  isPressed.value = 'Sign Up';
                  Get.offAll(() => const SignUpScreen());
                },
                    tittle: 'Sign Up',
                    borColor: isPressed.value == 'Sign Up'
                        ? ConstantColors.greenColor
                        : ConstantColors.textFieldGrey,
                    tittleColor: Colors.white,
                    backColor: isPressed.value == 'Sign Up'
                        ? ConstantColors.greenColor
                        : ConstantColors.textFieldGrey,
                    height: 4.4.h,
                    width: 30.9.h),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
