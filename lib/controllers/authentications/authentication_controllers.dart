import 'dart:convert';
import 'dart:developer';
import 'package:boli_app/view/authentication_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api_services/my_shared_preferance.dart';
import '../../api_services/user_services.dart';
import '../../constants/constant_colors.dart';
import '../../ui_components/custom_widget.dart';
import '../../utils/bottomnavigationBar.dart';
import '../../utils/custom_snackbar.dart';
import '../../view/verifications_screens/email_otp_screen.dart';

class AuthenticationsController extends GetxController {
  TextEditingController regFullNameController = TextEditingController();
  TextEditingController regEmailController = TextEditingController();
  TextEditingController regPasswordController = TextEditingController();
  TextEditingController regConfirmPasswordController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  final MySharedPreferanse mySharedPreferanse=MySharedPreferanse();
  void clearRegisterController() {
    regConfirmPasswordController.clear();
    regEmailController.clear();
    regFullNameController.clear();
    regPasswordController.clear();
  }

  void clearLoginController() {
    loginEmailController.clear();
    loginPasswordController.clear();
  }

  var loading = false.obs;
  registerUser(String name, email, password) async {
    Map body = {
      "email": email.toString(),
      "password": password.toString(),
      "name": name.toString()
    };
    loading.value = true;
    await ApiServices()
        .postApiData(body, 'api/customer/register')
        .then((value) {
      var jsonData = jsonDecode(value.body);
      if (value == null) {
        loading.value = false;
        customSnackBar('Sorry!', 'Something went wrong! please try again',
            Colors.redAccent);
      } else if (jsonData['message'] == "User created successfully") {
        loading.value = false;
        customSnackBar(
            'Congratulation!', 'User created successfully', Colors.white);

        Get.offAll(() => EmailOtpScreen(
              email: email,
            ));
        clearRegisterController();
      } else if (jsonData["message"] == "User already exists") {
        loading.value = false;
        customSnackBar(
            'Please Check!', 'User already exists', Colors.redAccent);
      } else {
        loading.value = false;
        customSnackBar('Sorry!', 'Something went wrong! please try again',
            Colors.redAccent);
      }
    });
  }

  otpVerification(String email, otp, BuildContext context) async {
    Map body = {
      "email": email.toString(),
      "otp": otp.toString(),
    };

    loading.value = true;
    await ApiServices().postApiData(body, 'api/customer/verify').then((value) {
      var jsonData = jsonDecode(value.body);
      log('Value is $value');
      if (value == null) {
        loading.value = false;
        customSnackBar('Sorry!', 'Something went wrong! please try again',
            Colors.redAccent);
      } else if (jsonData['message'] == "User verified successfully") {
        loading.value = false;
        customSnackBar(
            'Congratulation!', 'verification Successfully', Colors.white);
        showAlertDialog(context);
      } else if (jsonData["message"] == "Invalid OTP") {
        loading.value = false;
        customSnackBar('Please Check!', 'Invalid OTP', Colors.redAccent);
      } else {
        loading.value = false;
        customSnackBar('Sorry!', 'Something went wrong! please try again',
            Colors.redAccent);
      }
    });
  }

  userLogin(
    String email,
    password,
  ) async {
    Map body = {
      "email": email.toString(),
      "password": password.toString(),
    };
    loading.value = true;
    await ApiServices().postApiData(body, 'api/customer/login').then((value) {
      var jsonData = jsonDecode(value.body);
      log('Value is $value');
      if (value == null) {
        loading.value = false;
        customSnackBar('Sorry!', 'Something went wrong! please try again',
            Colors.redAccent);
      } else if (jsonData["message"] == "Invalid credentials") {
        loading.value = false;
        customSnackBar(
            'Please Check!', 'Invalid credentials', Colors.redAccent);
      } else if (jsonData['message'] == "User logged in successfully") {
        mySharedPreferanse. token.value = jsonData['token'].toString();
        log('Token ${mySharedPreferanse.token.value}');

        mySharedPreferanse.  storeUserLoginToken(mySharedPreferanse.token.value.toString()).then((value) {
          return true;
        });
        Get.offAll(() => const BottomNavBar(
              commingIndex: 0,
            ));
        loading.value = false;
        customSnackBar(
            'Congratulation!', 'User logged in successfully', Colors.white);
        clearLoginController();
      } else if (jsonData['message'] == 'User not verified') {
        resendOtp(email);
        loading.value = false;
        customSnackBar('Sorry!', 'User not verified! please verified first',
            Colors.redAccent);
        Get.to(() => EmailOtpScreen(
              email: email,
            ));
      } else {
        loading.value = false;
        customSnackBar('Sorry!', 'Something went wrong! please try again',
            Colors.redAccent);
      }
    });
  }

  resendOtp(
    String email,
  ) async {
    Map body = {
      "email": email.toString(),
    };
    await ApiServices()
        .postApiData(body, 'api/customer/resendVerificationCode')
        .then((value) {
      var jsonData = jsonDecode(value.body);
      log('Value is $value');
      if (value == null) {
        customSnackBar('Sorry!', 'Something went wrong! please try again',
            Colors.redAccent);
      } else if (jsonData["message"] ==
          "Verification code already sent, Try again in few min") {
        customSnackBar(
            'Please wait!',
            'Verification code already sent, Try again in few min',
            Colors.redAccent);
      } else if (jsonData['message'] == "Verification code resent") {
        customSnackBar('Congratulation!',
            'Verification code resent Successfully', Colors.white);
      } else {
        customSnackBar('Sorry!', 'Something went wrong! please try again',
            Colors.redAccent);
      }
    });
  }

  Future changePassword({required String email,required String oldPassword, required String  newPassword,}) async {
    Map body = {
      "email": email.toString(),
      "oldPassword": oldPassword.toString(),
      "newPassword": newPassword.toString(),
    };
    loading.value = true;
    await ApiServices()
        .updateApiData(body, 'api/customer/changePassword')
        .then((value) {
      var jsonData = jsonDecode(value);
      if (value == null) {
        loading.value = false;
        customSnackBar('Sorry!', 'Something went wrong! please try again',
            Colors.redAccent);
      } else if (jsonData['message'] == "Password changed successfully") {
        loading.value = false;

        customSnackBar(
            'Congratulation!', 'Password changed successfully !Please login again', Colors.white);
        Get.offAll(()=>const LoginScreen());
        return true;

// Get.to(()=> AllReviews());
      } else if (jsonData["message"] == "Invalid  credentials") {
        loading.value = false;
        customSnackBar(
            'Please Check!', 'Invalid  credentials', Colors.redAccent);
      } else {
        loading.value = false;
        customSnackBar('Sorry!', 'Something went wrong! please try again',
            Colors.redAccent);
      }
    });
  }


}

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
