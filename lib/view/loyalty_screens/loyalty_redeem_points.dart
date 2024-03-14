import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_textstyle.dart';

class LoyaltyRedeemScreen extends StatelessWidget {
  const LoyaltyRedeemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            getVerSpace(5.h),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_sharp,
                        size: 18.px, color: const Color(0xff444444))),
                Text(
                  'Redeem Points',
                  style: TextStyle(
                      fontSize: 16.px,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'segoeui',
                      color: const Color(0xff444444)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.4.h),
              child: Column(
                children: [

                  ListView.builder(physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.5.h),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.h, horizontal: 1.h),
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
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 6.h,
                                    width: 6.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.px),
                                        color: Colors.grey,
                                        image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'assets/pngs/item.png'))),
                                  ),
                                  getHorSpace(1.h),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Lorem ipsum dolor sit amets',
                                            style: TextStyle(
                                                fontSize: 13.px,
                                                fontFamily: 'segoeui',
                                                color: const Color(0xff3D405B)),
                                          ),
                                          getHorSpace(4.h),
                                          Text(
                                            "\$5.49",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.px,
                                                fontFamily: 'segoeui',
                                                color: ConstantColors.greenColor),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Lorem ipsum',
                                            style: TextStyle(
                                                fontSize: 11.px,
                                                fontFamily: 'segoeui',
                                                color: const Color(0xff3D405B)),
                                          ),
                                          getHorSpace(13.h),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 1.h),
                                            height: 5.h,
                                            width: 10.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.px),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color:
                                                      Colors.grey.withOpacity(0.1),
                                                  offset: const Offset(0, 2),
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '-',
                                                  style: CustomTextStyles
                                                      .buttonTextStyle
                                                      .copyWith(
                                                          color: const Color(
                                                            0xff717171,
                                                          ),
                                                          fontSize: 17.px),
                                                ),
                                                Text(
                                                  '1',
                                                  style: CustomTextStyles
                                                      .buttonTextStyle
                                                      .copyWith(
                                                          color: const Color(
                                                              0xff717171),
                                                          fontSize: 16.px),
                                                ),
                                                Text(
                                                  '+',
                                                  style: CustomTextStyles
                                                      .buttonTextStyle
                                                      .copyWith(
                                                          color: const Color(
                                                            0xff717171,
                                                          ),
                                                          fontSize: 17.px),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                  ),
                  getVerSpace(2.h),
                  Text(
                    '*1200 points will be deducted from your loyalty card if you add this item in your cart.',
                    style: TextStyle(
                        fontSize: 10.px,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff717171),
                        fontFamily: 'segoeui'),
                  ),
                  getVerSpace(55.9.h),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: customElevatedButton(() {},
                        tittle: 'Add to cart',
                        height: 4.4.h,
                        width: 30.9.h,
                        tittleColor: Colors.white,
                        borColor: ConstantColors.greenColor,
                        backColor: ConstantColors.greenColor),
                  ),
                  getVerSpace(7.8.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
