import 'package:boli_app/constants/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
  SnackbarController customSnackBar(String title,String message,Color titleColor){
    return Get.snackbar('', '',backgroundColor: ConstantColors.greenColor,
    colorText: Colors.white,
    titleText: Text(title,style: TextStyle(fontSize: 14.px,color: titleColor,fontWeight: FontWeight.w600),),
    messageText: Text(message,style: TextStyle(fontSize: 12.px,color:Colors.white,fontWeight: FontWeight.w400)));
  }

