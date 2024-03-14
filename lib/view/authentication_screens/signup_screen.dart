import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:boli_app/view/authentication_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isVisible=false.obs;
    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5.h),
          child: SingleChildScrollView(
            child: Obx(()=>
                Column(
                  children: [
                    getVerSpace(10.h),
                    getSvgImage('signup.svg'),
                    getVerSpace(2.h),
                    Text(
                      'Sign Up',
                      style: CustomTextStyles.headingStyle,
                    ),
                    getVerSpace(2.h),
                    customTextFormField(
                      contentPading: EdgeInsetsDirectional.only(top:1.h ),

                      fullNameController,
                      'Full name',isObsecure: false,
                      prefixIcon: Icons.person,
                    ),                    getVerSpace(1.h),

                    customTextFormField(
                      contentPading: EdgeInsetsDirectional.only(top:1.h ),

                      emailController,
                      'johnsondoe@nomail.com.',isObsecure: false,
                      prefixIcon: Icons.email_rounded,
                    ),
                    getVerSpace(2.h),
                    customTextFormField(
                      contentPading: EdgeInsetsDirectional.only(top:1.h ),

                      passwordController, '••••••••••••••••••••',isObsecure: false,

                        prefixIcon: Icons.lock,
                    ),
                    getVerSpace(2.h),
                    customTextFormField(
                        contentPading: EdgeInsetsDirectional.only(top:1.h ),

                        confirmPasswordController, '••••••••••••••••••••',isObsecure: isVisible.value==true?
                    true:false,
                        prefixIcon: Icons.lock, sufixIcon: IconButton(onPressed: () {
                      if(isVisible.value==false){
                        isVisible.value=true;

                      }else{
                        isVisible.value=false;

                      }

                    }, icon:isVisible.value==true?Icon(Icons.visibility_off,color: ConstantColors.greenColor,size: 2.h,):  Icon(Icons.visibility,color: ConstantColors.greenColor,size: 2.h))),

                    getVerSpace(3.h),
                    customElevatedButton(() {
                      Get.to(()=>const LoginScreen());
                    },
                        tittle: 'Sign Up',
                        borColor: ConstantColors.greenColor,
                        tittleColor: Colors.white,
                        backColor: ConstantColors.greenColor,
                        height: 4.4.h,
                        width: 30.9.h),
                    getVerSpace(1.h),
                    Text('OR',style: CustomTextStyles.textFieldStyle.copyWith(color: Colors.black),)
                    , getVerSpace(2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(alignment: Alignment.center,
                            padding: EdgeInsets.all(1.h),
                            height: 6.h,
                            width: 6.h,
                            decoration:  BoxDecoration(border: Border.all(color:ConstantColors.textFieldGrey,
                                width: .2.h),
                                color: Colors.white,shape: BoxShape.circle
                            ),
                            child: getSvgImage('google.svg',height: 2.5.h),
                          ),
                        ),
                        getHorSpace(2.h),
                        InkWell(
                          onTap: () {},
                          child: Container(alignment: Alignment.center,
                            padding: EdgeInsets.all(1.h),
                            height: 6.h,
                            width: 6.h,
                            decoration:  BoxDecoration(border: Border.all(color:ConstantColors.textFieldGrey,
                                width: .2.h),
                                color: Colors.white,shape: BoxShape.circle
                            ),
                            child: getSvgImage('facebook.svg',height: 2.5.h),
                          ),
                        ),
                      ],
                    ),
                    getVerSpace(2.h),
                    GestureDetector(onTap: (){
                      Get.to(()=>const LoginScreen());
                    },
                      child:
                      RichText(text: TextSpan(children: [

                        TextSpan(text: 'Already have an Account?',style: TextStyle(
                            fontSize: 10.94.px,
                            color: const Color(0xffBBBBBB),
                            fontWeight: FontWeight.w300,
                            fontFamily: 'segoeui'



                        )),

                        TextSpan(text: 'Sign In',style: CustomTextStyles.headingStyle.copyWith(fontSize: 16.74.px)

                        ),

                      ])),
                    )

                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}
