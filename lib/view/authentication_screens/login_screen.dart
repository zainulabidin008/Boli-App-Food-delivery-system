import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:boli_app/view/authentication_screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_colors.dart';
import '../../controllers/authentications/authentication_controllers.dart';
import '../../utils/custom_snackbar.dart';
import '../verifications_screens/email_phone_verification.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = Get.put(AuthenticationsController());

    RxBool isVisible = true.obs;

    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5.h),
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  getVerSpace(10.h),
                  getSvgImage('login.svg'),
                  getSvgImage('login1.svg'),
                  getVerSpace(3.5.h),
                  Text(
                    'Sign In',
                    style: CustomTextStyles.headingStyle,
                  ),
                  getVerSpace(3.1.h),
                  customTextFormField(
                    loginController.loginEmailController,
                    contentPading: EdgeInsetsDirectional.only(top: 1.h),
                    'johnsondoe@nomail.com.',
                    isObsecure: false,
                    prefixIcon: Icons.email_rounded,
                  ),
                  getVerSpace(2.h),
                  customTextFormField(
                      contentPading: EdgeInsetsDirectional.only(top: 1.h),
                      loginController.loginPasswordController,
                      '••••••••••••••••••••',
                      isObsecure: isVisible.value == true ? true : false,
                      prefixIcon: Icons.lock,
                      sufixIcon: IconButton(
                          onPressed: () {
                            if (isVisible.value == false) {
                              isVisible.value = true;
                            } else {
                              isVisible.value = false;
                            }
                          },
                          icon: isVisible.value == true
                              ? Icon(
                                  Icons.visibility_off,
                                  color: ConstantColors.greenColor,
                                  size: 2.h,
                                )
                              : Icon(Icons.visibility,
                                  color: ConstantColors.greenColor,
                                  size: 2.h))),
                  getVerSpace(2.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const SendEmailVerify());
                      },
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          fontSize: 9.14.px,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff515151),
                        ),
                      ),
                    ),
                  ),
                  getVerSpace(2.h),
                  loginController.loading.value == true
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        )
                      : customElevatedButton(() {
                          var emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if (loginController
                                  .loginEmailController.text.isNotEmpty &&
                              loginController
                                  .loginPasswordController.text.isNotEmpty) {
                            if (loginController.loginPasswordController
                                    .text
                                    .length >=
                                6) {
                              if (emailValid.hasMatch(loginController
                                  .loginEmailController
                                  .text
                                  .trim())) {
                                loginController.userLogin(
                                    loginController.loginEmailController.text
                                        .trim(),
                                    loginController.loginPasswordController.text
                                        .trim());
                              } else {
                                customSnackBar(
                                    'Invalid email!',
                                    'Please enter valid email',
                                    Colors.redAccent);
                              }
                            } else {
                              customSnackBar(
                                  'Sorry!',
                                  'Password length at least 6',
                                  Colors.redAccent);
                            }
                          } else {
                            customSnackBar('Sorry!', 'All Fields are Required',
                                Colors.redAccent);
                          }
                        },
                          tittle: 'LogIn',
                          borColor: ConstantColors.greenColor,
                          tittleColor: Colors.white,
                          backColor: ConstantColors.greenColor,
                          height: 4.4.h,
                          width: 30.9.h),
                  getVerSpace(1.h),
                  Text(
                    'OR',
                    style: CustomTextStyles.textFieldStyle
                        .copyWith(color: Colors.black),
                  ),
                  getVerSpace(2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(1.h),
                          height: 6.h,
                          width: 6.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ConstantColors.textFieldGrey,
                                  width: .2.h),
                              color: Colors.white,
                              shape: BoxShape.circle),
                          child: getSvgImage('google.svg', height: 2.5.h),
                        ),
                      ),
                      getHorSpace(2.h),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(1.h),
                          height: 6.h,
                          width: 6.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ConstantColors.textFieldGrey,
                                  width: .2.h),
                              color: Colors.white,
                              shape: BoxShape.circle),
                          child: getSvgImage('facebook.svg', height: 2.5.h),
                        ),
                      ),
                    ],
                  ),
                  getVerSpace(2.h),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignUpScreen());
                    },
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Don’t have an Account?',
                          style: TextStyle(
                              fontSize: 10.94.px,
                              color: const Color(0xffBBBBBB),
                              fontWeight: FontWeight.w300,
                              fontFamily: 'segoeui')),
                      TextSpan(
                          text: 'Sign Up',
                          style: CustomTextStyles.headingStyle
                              .copyWith(fontSize: 16.74.px)),
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
