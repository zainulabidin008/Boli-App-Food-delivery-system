import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_colors.dart';
import '../../utils/bottomnavigationBar.dart';

class ReservationSuccess extends StatelessWidget {
  const ReservationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(children: [
        getVerSpace(2.3.h),
        getJpgImage('reservationsuccess.jpg'),
        getVerSpace(2.3.h),
        Text(
          'Congrats! Reservation Successful.',
          style: TextStyle(
              fontSize: 12.px,
              fontWeight: FontWeight.w600,
              fontFamily: 'segoeui',
              color: const Color(0xff444444)),
        ),
        getVerSpace(3.h),
        Container(
          height: 11.1.h,width: 25.2.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.px),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                offset: const Offset(0, 2),
                spreadRadius: 2,
                blurRadius: 2,
              )
            ],
          ),child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reservation Details.',
              style: TextStyle(
                  fontSize: 12.px,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'segoeui',
                  color: const Color(0xff444444)),
            ),
            Text(
              'Date: 16/02/2024.',
              style: TextStyle(
                  fontSize: 12.px,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'segoeui',
                  color: const Color(0xffA6A6A6)),
            ),
            Text(
              'Table for 1',
              style: TextStyle(
                  fontSize: 12.px,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'segoeui',
                  color: const Color(0xffA6A6A6)),
            ),  Text(
              '08:00 PM',
              style: TextStyle(
                  fontSize: 12.px,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'segoeui',
                  color: const Color(0xffA6A6A6)),
            ),
          ],),
        ),
        getVerSpace(3.h),
        Align(alignment: Alignment.bottomCenter,
          child: customElevatedButton(() {
Get.offAll(()=>  BottomNavBar(commingIndex: 0,));
          },
              tittle: 'Done',
              height: 4.4.h,
              width: 30.9.h,
              tittleColor:Colors.white ,
              borColor:ConstantColors.greenColor ,
              backColor: ConstantColors.greenColor),
        )

      ],),

    );
  }
}
