import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_colors.dart';
import '../../constants/constant_textstyle.dart';
import '../my_order_screens/my_order_main.dart';

class OrderCompleted extends StatelessWidget {
  const OrderCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.7.h),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getVerSpace(15.h),
              getSvgImage('ordercomplete.svg'),
                getVerSpace(5.9.h),
                Text(
                  'Freshness in Progress. Your Culinary Masterpiece is on its Way!',
                  style: CustomTextStyles.welcomeSimpleTextStyle
                      .copyWith(fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                ),

              ],),
          ),
          getVerSpace(6.7.h),
          Align(alignment: Alignment.bottomCenter,
            child: customElevatedButton(() {
              Get.to(()=>const MyOrderMainScreen());
            },
                tittle: 'Done',
                height: 4.4.h,
                width: 30.4.h,
                tittleColor:Colors.white ,
                borColor:ConstantColors.greenColor ,
                backColor: ConstantColors.greenColor),
          )

        ],
      ),
    );
  }
}
