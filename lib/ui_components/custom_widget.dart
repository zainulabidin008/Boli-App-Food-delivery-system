import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/constant_colors.dart';
import '../constants/constant_textstyle.dart';
import '../constants/my_constant.dart';

  Widget getVerSpace(
      double height
      ){
    return SizedBox(
      height:height ,
    );
  }

Widget getHorSpace(
    double width
    ){
  return SizedBox(
    width:width ,
  );
}
Widget getJpgImage(
    String jpgImage, {
      double? height,
      double? width,
      double? scale,
      Color? color,
      BoxFit boxFit = BoxFit.contain,
    }) {
  return Image.asset(
    MyConstants.assetJpgImagePath + jpgImage,
    height: height,
    width: width,
    scale: scale,
    color: color,
    fit: boxFit,
  );
}

Widget getSvgImage(String svgImage,
    {double? height,
      double? width,
      Color? color,
      double? scale,
      BoxFit boxFit = BoxFit.contain}) {
  return SvgPicture.asset(
    MyConstants.assetsSvgPath + svgImage,
    color: color,
    fit: boxFit,
    height: height,
    width: width,
  );
}
  Widget getPngImage(
      String jpgImage, {
        double? height,
        double? width,
        double? scale,
        Color? color,
        BoxFit boxFit = BoxFit.contain,
      }) {
    return Image.asset(
      MyConstants.assetJpgImagePath + jpgImage,
      height: height,
      width: width,
      scale: scale,
      color: color,
      fit: boxFit,
    );
  }
Widget customTextFormField(
    TextEditingController? controller,
    String? hintText,
    {
      TextInputType? keyboardType,
      IconData? prefixIcon,
      Icon? icon,
      IconButton? sufixIcon,
      Color? iconColor,
      String? lableText,
      TextStyle?lableStyle,
      required bool isObsecure,
      EdgeInsetsDirectional? contentPading,
      Color? hintTextColor,
    }
    ) {
  return Container(alignment: Alignment.centerLeft,
    height: 5.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.px),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            offset: const Offset(0, 2),
            spreadRadius: 2,
            blurRadius: 2)
      ]),
    child: Padding(
      padding:  EdgeInsets.only(top: .5.h),
      child: TextFormField(
        cursorHeight: 2.h,

        obscureText: isObsecure,
        controller: controller,
        style: TextStyle(fontSize: 12.px, color: ConstantColors.simpleTextColor),
        cursorColor: ConstantColors.greenColor,
        textAlign: TextAlign.left,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding:contentPading?? EdgeInsets.only(top: .5.h), // Adjust vertical padding
          isCollapsed: true,
          border: InputBorder.none,
          fillColor: Colors.white,
          prefixIcon: Icon(
            prefixIcon,
            color:iconColor?? ConstantColors.greenColor,
            size: 2.4.h,
          ),
          suffixIcon: sufixIcon,
          hintText: hintText,
          hintStyle: CustomTextStyles.textFieldStyle.copyWith(color: hintTextColor),
          labelText: lableText,
          labelStyle: lableStyle
        ),
      ),
    ),
  );
}




Widget customElevatedButton( Callback? onPressed,{
String? tittle,
  required Color tittleColor,
  double? width,
  double? height,
  Color? backColor,
  required Color borColor,
}){
    return  ElevatedButton(
        onPressed:onPressed,
        style:  ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(width!, height!)),
        side:   MaterialStatePropertyAll(BorderSide(color:borColor )),
        backgroundColor:  MaterialStatePropertyAll(backColor)),
        child: Text(tittle!,style: CustomTextStyles.buttonTextStyle.copyWith(color: tittleColor),));

}
