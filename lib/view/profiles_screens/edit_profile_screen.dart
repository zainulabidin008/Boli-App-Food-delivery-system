import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../verifications_screens/email_phone_verification.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getVerSpace(5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 2.1.h,
                    )),
                getHorSpace(1.h),
                Text(
                  'Personal Information',
                  style: TextStyle(
                      fontSize: 16.px,
                      color: const Color(
                        0xff444444,
                      ),
                      fontFamily: 'segoeui',
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          getVerSpace(2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.4.h),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 5.h,
                  backgroundColor: ConstantColors.textFieldGrey,
                  backgroundImage: const AssetImage('assets/jpgs/profile.jpg'),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 4.h,
                      width: 4.h,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: getSvgImage('Pencil.svg'),
                    ),
                  ),
                ),
                getVerSpace(3.h),
                customTextFormField(nameController, 'Full Name',
                    isObsecure: false,
                    lableStyle: CustomTextStyles.textFieldStyle
                        .copyWith(fontWeight: FontWeight.w500),
                    prefixIcon: Icons.person,
                    iconColor: ConstantColors.greenColor),
                getVerSpace(2.8.h),
                customTextFormField(
                  prefixIcon: Icons.email,
                  iconColor: ConstantColors.greenColor,
                  nameController,
                  'Email',
                  isObsecure: false,
                  lableStyle: CustomTextStyles.textFieldStyle
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                getVerSpace(2.8.h),
                Container(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CountryCodePicker(
                        hideMainText: true,
                        padding: EdgeInsets.zero,
                        onChanged: (e) {},
                        initialSelection: 'pk',
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: true,
                        alignLeft: false,
                      ),
                      Expanded(
                          child: TextField(
                              cursorHeight: 2.h,
                              style: TextStyle(
                                  fontSize: 12.px,
                                  color: ConstantColors.simpleTextColor),
                              cursorColor: ConstantColors.greenColor,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(
                                    .5.h), // Adjust vertical padding
                                isCollapsed: true,
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                hintText: 'Enter your phone',
                                hintStyle: CustomTextStyles.textFieldStyle,
                              )))
                    ],
                  ),
                ),
                getVerSpace(2.8.h),
                customTextFormField(nameController, 'Password',
                    isObsecure: false,
                    contentPading: EdgeInsetsDirectional.all(1.h),
                    lableStyle: CustomTextStyles.textFieldStyle
                        .copyWith(fontWeight: FontWeight.w500),
                    prefixIcon: Icons.lock,
                    iconColor: ConstantColors.greenColor),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  SendEmailVerify(
                                title: 'Email',
                              ),
                            ));
                      },
                      child: Text(
                        'Change Password',
                        style: CustomTextStyles.buttonTextStyle,
                      )),
                ),
                getVerSpace(3.5.h),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: customElevatedButton(() {
                    Get.back();
                  },
                      tittle: 'Done',
                      height: 4.4.h,
                      width: 30.9.h,
                      tittleColor: Colors.white,
                      borColor: ConstantColors.greenColor,
                      backColor: ConstantColors.greenColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
