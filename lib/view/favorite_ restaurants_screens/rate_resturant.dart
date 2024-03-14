import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../ui_components/custom_widget.dart';
import 'all_reviews.dart';

class RateResturant extends StatelessWidget {
  const RateResturant({super.key});

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
          'Rate Restaurants',
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
                  text: ' (10)',
                  style: TextStyle(
                      fontSize: 14.px,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'segoeui',
                      color: const Color(0xff444444)),
                )
              ])),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
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
              getVerSpace(1.2.h),
              GestureDetector(onTap: (){
                Get.to(()=>const AllReviews());
              },
                child: Text(
                  'Show older reviews ...',
                  style: TextStyle(
                      fontSize: 16.px,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'segoeui',
                      color: ConstantColors.greenColor),
                ),
              ),
              getVerSpace(2.4.h),
              Divider(color: ConstantColors.textFieldGrey,thickness: 2,),
              getVerSpace(1.2.h),
              Text(
                'Add your rating and review!',
                style: TextStyle(
                    fontSize: 16.px,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'segoeui',
                    color: Color(0xff444444)),
              ),
              getVerSpace(1.2.h),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    color: ConstantColors.greenColor,
                    size: 25.px,
                  ),
                  getHorSpace(.3.h),
                  Icon(Icons.star,
                      color: ConstantColors.greenColor,
                      size: 25.px),
                  getHorSpace(.3.h),
                  Icon(Icons.star,
                      color: ConstantColors.greenColor,
                      size: 25.px),
                  getHorSpace(.3.h),
                  Icon(Icons.star,
                      color: Colors.grey,
                      size: 25.px),
                  getHorSpace(.3.h),
                  Icon(Icons.star,
                      color: Colors.grey,
                      size: 25.px),
                  getHorSpace(.3.h),
        
                ],
              ),
              getVerSpace(.8.h),
              Text(
                'Tap to add your rating',
                style: TextStyle(
                    fontSize: 14.px,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'segoeui',
                    color: const Color(0xff92847B)),
              ),
              getVerSpace(.8.h),
        Container(alignment: Alignment.center,
          height: 8.9.h,
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
        child: TextField(
        cursorHeight: 2.h,
        
            controller: commentController,
            style: TextStyle(fontSize: 12.px, color: ConstantColors.simpleTextColor),
            cursorColor: ConstantColors.greenColor,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 1.h), // Adjust vertical padding
            isCollapsed: true,
            border: InputBorder.none,
            fillColor: Colors.white,
              hintText: 'Add your review ...',
              hintStyle: CustomTextStyles.textFieldStyle

        
        )
        
        
        
        
            )),
            getVerSpace(1.5.h),
              customElevatedButton(() {
                Get.to(()=>const AllReviews());
              },
                  tittle: 'Submit review',
                  height: 2.4.h,
                  width: 10.9.h,
                  tittleColor:Colors.white ,
                  borColor:ConstantColors.greenColor ,
                  backColor: ConstantColors.greenColor)
            ],
          ),
        ),
      ),
    );
  }
}
