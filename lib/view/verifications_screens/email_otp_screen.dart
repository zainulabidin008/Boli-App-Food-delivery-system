import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:boli_app/view/authentication_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_colors.dart';

class EmailOtpScreen extends StatelessWidget {
  const EmailOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showAlertDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.grey.withOpacity(0.1),
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: 50.27.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.px),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(0, 2),
                    spreadRadius: 2,
                    blurRadius: 2,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(10.px),
                child: Column(
                  children: [
                    getSvgImage('verifying.svg'),
                    getVerSpace(2.4.h),
                    Text(
                      "Verification Successful",
                      style: TextStyle(
                        fontSize: 20.5.px,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff233245),
                        fontFamily: 'segoeui',
                      ),
                    ),
                    getVerSpace(4.5.h),
                    customElevatedButton(
                      () {
                        Get.offAll(() => const LoginScreen());
                      },
                      tittle: 'Return to Login',
                      borColor: ConstantColors.greenColor,
                      tittleColor: Colors.white,
                      backColor: ConstantColors.greenColor,
                      height: 4.h,
                      width: 10.65.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.55.h),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              getVerSpace(10.h),
              getSvgImage('emailverify.svg'),
              getVerSpace(4.h),
              Text(
                'Verify your Email',
                style: TextStyle(
                    fontSize: 20.5.px,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff233245),
                    fontFamily: 'segoeui'),
              ),
              getVerSpace(.8.h),
              Text(
                'Please enter the 4 Digit Code sent to@idperson.com',
                style: CustomTextStyles.onBoardSimpleTextStyle,
                textAlign: TextAlign.center,
              ),
              getVerSpace(3.h),
              SizedBox(
                height: 5.h,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.h),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 4 - 25.05,
                        child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(width: .2.h))),
                            style: CustomTextStyles.buttonTextStyle
                                .copyWith(color: Colors.black)),
                      ),
                    );
                  },
                ),
              ),
              getVerSpace(2.9.h),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Didn't Receive a Code!",
                    style: CustomTextStyles.textFieldStyle
                        .copyWith(color: Colors.black.withOpacity(0.5))),
                TextSpan(
                    text: " Resend",
                    style: TextStyle(
                        fontSize: 11.px,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff233245),
                        fontFamily: 'segoeui'))
              ])),
              getVerSpace(5.9.h),
              customElevatedButton(() {
                showAlertDialog(context);
              },
                  tittle: 'Verify',
                  borColor: ConstantColors.greenColor,
                  tittleColor: Colors.white,
                  backColor: ConstantColors.greenColor,
                  height: 4.4.h,
                  width: 30.9.h),
            ],
          ),
        ),
      ),
    );
  }
}
