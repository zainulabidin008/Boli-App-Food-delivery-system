
import 'dart:developer';

import 'package:boli_app/api_services/my_shared_preferance.dart';
import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_colors.dart';
import '../../controllers/authentications/authentication_controllers.dart';
import '../../utils/custom_snackbar.dart';

class ChangePasswordScreen extends StatelessWidget {
   ChangePasswordScreen({super.key,this.title});
  final String?title;

  final MySharedPreferanse mySharedPreferanse=MySharedPreferanse();

  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();
    TextEditingController oldPasswordController = TextEditingController();
    TextEditingController  newPasswordController = TextEditingController();
  final   AuthenticationsController authenticationsController=Get.put(AuthenticationsController());
    RxBool isVisible=true.obs;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.55.h),
        child: Align(
          alignment: Alignment.topCenter,
          child: Obx(()=>
             Column(
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
                  contentPading: EdgeInsetsDirectional.only(top:.5.h ),

                  emailController, 'Enter your email',isObsecure: false
                ,
                  prefixIcon: Icons.email_rounded, ),
                getVerSpace(3.h),
                customTextFormField(
                    contentPading: EdgeInsetsDirectional.only(top:.5.h ),

                  oldPasswordController, 'old password',isObsecure: isVisible.value==true?
                true:false,
                    prefixIcon: Icons.lock, ),
                getVerSpace(3.h),
                customTextFormField(
                    contentPading: EdgeInsetsDirectional.only(top:.5.h ),

                    newPasswordController, 'New Password',isObsecure: isVisible.value==true?
                true:false,
                    prefixIcon: Icons.lock, sufixIcon: IconButton(onPressed: () {
                  if(isVisible.value==false){
                    isVisible.value=true;

                  }else{
                    isVisible.value=false;

                  }

                }, icon:isVisible.value==true?Icon(Icons.visibility_off,color: ConstantColors.greenColor,size: 2.h,):  Icon(Icons.visibility,color: ConstantColors.greenColor,size: 2.h))),

                getVerSpace(5.9.h),
             authenticationsController.loading.value==true?Center(child: CircularProgressIndicator(color: ConstantColors.greenColor,),):   customElevatedButton(() {
                if(emailController.text.isEmpty){
                  customSnackBar(
                      'Sorry!', 'Enter your Registered Email', Colors.redAccent);
                }else if (oldPasswordController.text.isEmpty){
                  customSnackBar(
                      'Sorry!', 'Enter your Registered oldPassword', Colors.redAccent);
                }else if(newPasswordController.text.isEmpty){
                  customSnackBar(
                      'Sorry!', 'Enter your New Password', Colors.redAccent);
                }else{
                  mySharedPreferanse.getUserLoginToken().then((value) {
                    mySharedPreferanse.gettoken;
                    log('This is token ${ mySharedPreferanse.gettoken}');
                    authenticationsController.changePassword(
                      email: emailController.text.trim(),
                      oldPassword: oldPasswordController.text.trim(),
                      newPassword: newPasswordController.text.trim(),

                    );

                  });
                }

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
      ),
    );
  }
}
