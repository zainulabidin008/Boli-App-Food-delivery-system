import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../ui_components/custom_widget.dart';

class AllReviews extends StatelessWidget {
  const AllReviews({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController commentController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_sharp,
                size: 14.px, color: const Color(0xff444444))),
        title: Text(
          'All Reviews ...',
          style: TextStyle(
              fontSize: 14.px,
              fontWeight: FontWeight.w600,
              fontFamily: 'segoeui',
              color: const Color(0xff444444)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Reviews',
                      style: TextStyle(
                          fontSize: 14.px,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'segoeui',
                          color: const Color(0xff444444)),
                    ),
                    TextSpan(
                      text: ' (14)',
                      style: TextStyle(
                          fontSize: 14.px,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'segoeui',
                          color: const Color(0xff444444)),
                    )
                  ])),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 14,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: 1.2.h),
                    child: Container(padding: EdgeInsets.all(1.h),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star,
                                color: const Color(0xffFFA500),
                                size: 15.px,
                              ),
                              Icon(Icons.star,
                                  color: const Color(0xffFFA500),
                                  size: 15.px),
                              Icon(Icons.star,
                                  color: const Color(0xffFFA500),
                                  size: 15.px),
                              Icon(Icons.star,
                                  color: Colors.blueGrey,
                                  size: 15.px),
                              Icon(Icons.star,
                                  color: Colors.blueGrey,
                                  size: 15.px),
                              getHorSpace(.3.h),

                            ],
                          ),
                          Text(
                            'Nice.',
                            style: TextStyle(
                                fontSize: 14.px,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'segoeui',
                                color: const Color(0xff444444)),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sal1234',
                                style: CustomTextStyles.textFieldStyle.copyWith(color: Color(0xff92847B)),
                              ),
                              Text(
                                '2 hours ago',
                                style: CustomTextStyles.textFieldStyle.copyWith(color: Color(0xff92847B)),
                              ),

                            ],
                          ),




                        ],),
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
