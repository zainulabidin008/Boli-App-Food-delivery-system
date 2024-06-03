import 'dart:developer';

import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:boli_app/view/authentication_screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_colors.dart';
import '../../controllers/authentications/authentication_controllers.dart';

class EmailOtpScreen extends StatelessWidget {
  final String? email;
  const EmailOtpScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(AuthenticationsController());
    final TextEditingController otpTextController = TextEditingController();
    RxInt otp = 0.obs;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.55.h),
          child: Align(
            alignment: Alignment.topCenter,
            child: Obx(
              () => Column(
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
                      child: PinInputTextField(
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              otp.value = int.parse(value);
                            } else {
                              otp.value = 0;
                            }
                          },
                          pinLength: 4,
                          decoration: UnderlineDecoration(
                              colorBuilder:
                                  const FixedColorBuilder(Colors.black)))),
                  getVerSpace(2.9.h),
                  GestureDetector(
                    onTap: () {
                      otpController.resendOtp(email!);
                    },
                    child: RichText(
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
                  ),
                  getVerSpace(5.9.h),
                  otpController.loading.value == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: ConstantColors.greenColor,
                          ),
                        )
                      : customElevatedButton(() {
                          otpController.otpVerification(
                              email.toString(), otp.value, context);
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
        ),
      ),
    );
  }
}
