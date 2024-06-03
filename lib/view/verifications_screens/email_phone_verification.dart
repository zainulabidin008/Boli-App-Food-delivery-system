import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_colors.dart';
import '../authentication_screens/change_password_screen.dart';
import 'email_otp_screen.dart';

class SendEmailVerify extends StatelessWidget {
   const SendEmailVerify({super.key,this.title});
final String?title;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.55.h),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              getVerSpace(6.h),
              title=='Email'?Row(crossAxisAlignment: CrossAxisAlignment.end,
                children: [IconButton(onPressed: (){
                  Get.back();
                }, icon:  Icon(Icons.arrow_back_ios,color: Colors.black,size: 2.1.h,)
              ),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Change Password',style: TextStyle(fontSize: 16.px,color: const Color(0xff444444,),
                      fontFamily: 'segoeui',fontWeight: FontWeight.w700),),
                    getVerSpace(.5.h),
                    Text('Enter your registered Email to change your Password',style: TextStyle(fontSize: 10.px,color: const Color(0xff444444,),
                        fontFamily: 'segoeui',fontWeight: FontWeight.w400),),

                  ],
                )],):const SizedBox.shrink(),
              getVerSpace(3.5.h),

              getSvgImage('forgotpassword.svg'),
              getVerSpace(4.h),
          title=='Email'?const SizedBox.shrink():    Text(
                'Enter Your Email/Phone',
                style: TextStyle(
                    fontSize: 20.5.px,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff233245),
                    fontFamily: 'segoeui'),
              ),
              getVerSpace(.8.h),
              title=='Email'?const SizedBox.shrink():        Text(
                'Please enter your Email Address or Phone Number  Receive Verification Code',
                style: CustomTextStyles.onBoardSimpleTextStyle,
                textAlign: TextAlign.center,
              ),
              getVerSpace(3.h),
              customTextFormField(
                contentPading: EdgeInsetsDirectional.only(top:1.h ),

                emailController,
                'johnsondoe@nomail.com.',
                isObsecure: false,
                prefixIcon: Icons.email_rounded,
              ),
              getVerSpace(5.9.h),
              customElevatedButton(() {
                Get.to(() =>  title=='Email'? ChangePasswordScreen(title: 'Email',): const EmailOtpScreen());
              },
                  tittle: 'Done',
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
