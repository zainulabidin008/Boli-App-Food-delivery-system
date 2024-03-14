import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:boli_app/view/contact_us_screens/submit_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_colors.dart';
import '../../ui_components/custom_widget.dart';
import '../../utils/bottomnavigationBar.dart';

class ContactOurSupportTeam extends StatelessWidget {
  const ContactOurSupportTeam({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController=TextEditingController();
    return  Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [



          getVerSpace(5.h),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.to(()=>const BottomNavBar(commingIndex: 0,));
                  },
                  icon: Icon(Icons.arrow_back_ios_sharp,
                      size: 18.px, color: const Color(0xff444444))),
              Text(
                'Contact our support team',
                style: TextStyle(
                    fontSize: 16.px,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'segoeui',
                    color: const Color(0xff444444)),
              ),
            ],
          ),
        getVerSpace(3.2.h),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2.4.h),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              'From',
              style: TextStyle(
                  fontSize: 14.px,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'segoeui',
                  color: const Color(0xff444444)),
            ),
              getVerSpace(1.h),
              Text(
                  'Tell us who you are! or stay anonymous ',
                  style: CustomTextStyles.textFieldStyle.copyWith(color: const Color(0xffA6A6A6))
              ),
              getVerSpace(1.h),
              Container(alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 2.h,vertical: .2.h),
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
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.email,size: 2.4.h,color: ConstantColors.greenColor,),
                      getHorSpace(1.5.h),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email',style: CustomTextStyles.textFieldStyle,),
                          Text('Litahan.99@gmail.com)',style: CustomTextStyles.textFieldStyle.copyWith(color: const Color(0xff717171)),),

                        ],)
                    ],)
              ),
              getVerSpace(2.h),
              Container(alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 2.h,vertical: .2.h),
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
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Icon(Icons.call,size: 2.4.h,color: ConstantColors.greenColor,),
                  getHorSpace(1.5.h),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Contact No (Optional)',style: CustomTextStyles.textFieldStyle,),
                    Text('+00 111 222 3333)',style: CustomTextStyles.textFieldStyle.copyWith(color: const Color(0xff717171)),),

                  ],)
                ],)
              ),
              getVerSpace(2.h),

              Text(
                'Message',
                style: TextStyle(
                    fontSize: 14.px,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'segoeui',
                    color: const Color(0xff444444)),
              ),
              getVerSpace(1.h),
              Container(
                  height: 17.7.h,

                  padding: EdgeInsets.symmetric(horizontal: 2.h,vertical: 1.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.px),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            offset: const Offset(0, 2),
                            spreadRadius: 2,
                            blurRadius: 2)
                      ]),
                  child: TextFormField(
                    cursorHeight: 2.h,

                    controller: messageController,
                    style: TextStyle(fontSize: 12.px, color: ConstantColors.simpleTextColor),
                    cursorColor: ConstantColors.greenColor,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: .5.h), // Adjust vertical padding
                        isCollapsed: true,
                        border: InputBorder.none,
                        fillColor: Colors.white,


                        hintText: 'Enter your Message',
                        hintStyle: CustomTextStyles.textFieldStyle,

                    ),
                  ),
              ),
              getVerSpace(7.h),
              Align(
                alignment: Alignment.bottomCenter,
                child: customElevatedButton(() {
                  Get.to(()=>const SubmitMessage());
                },
                    tittle: 'Submit',
                    height: 4.4.h,
                    width: 30.9.h,
                    tittleColor: Colors.white,
                    borColor: ConstantColors.greenColor,
                    backColor: ConstantColors.greenColor),
              ),

          ],),
        )

      ],),
    );
  }
}
