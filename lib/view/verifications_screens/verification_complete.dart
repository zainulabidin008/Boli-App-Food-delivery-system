import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:boli_app/view/authentication_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_colors.dart';

class VerificationSuccessfully extends StatelessWidget {
  const VerificationSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(alignment: Alignment.topCenter,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.3.h),
          child: Column(

            children: [getVerSpace(18.h), getSvgImage('sucess sign.svg')
            ,getVerSpace(15.h),
              Text('Link to Change Password has been sent to your entered Email Address!',style: TextStyle(fontSize: 14.px,color: const Color(0xff444444,),
                  fontFamily: 'segoeui',fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
            getVerSpace(8.9.h),

        customElevatedButton(() {
                Get.to(() => const LoginScreen());
              },
                  tittle: 'Log in again',
                  borColor: ConstantColors.greenColor,
                  tittleColor: Colors.white,
                  backColor: ConstantColors.greenColor,
                  height: 4.4.h,
                  width: 30.9.h),],
          ),
        ),

      ),

    );
  }
}
