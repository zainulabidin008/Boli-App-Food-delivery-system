import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_colors.dart';
import '../../ui_components/custom_widget.dart';
import '../mycart_screens/mycart_main_screen.dart';
import '../profiles_screens/edit_profile_screen.dart';
import 'choosecard_screen.dart';

class MyCartProductDetail extends StatelessWidget {
  const MyCartProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: double.infinity,
            height: 30.4.h,
            decoration: const BoxDecoration(
                image:
                DecorationImage(fit: BoxFit.cover,
                    image: AssetImage('assets/jpgs/cake.jpg'))),
            child:   Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getVerSpace(3.h),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 1.h),
                        child: Container(alignment: Alignment.center,
                          height: 2.2.h,width: 2.2.h,
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
                          child:  GestureDetector(onTap: (){
                            Get.back();
                          },
                            child: Icon(Icons.arrow_back_ios_sharp,
                                size: 16.px, color: const Color(0xff444444)),
                          ),

                        ),
                      ),
                      Text(
                        'Desserts',
                        style: TextStyle(
                            fontSize: 16.px,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'segoeui',
                            color: const Color(0xff444444)),
                      ),
                    ],),
                    Padding(
                      padding:  EdgeInsets.only(right: 2.4.h),
                      child: Row(
                        children: [
                          GestureDetector(onTap: (){
                            Get.to(()=>const MyCartMainScreen());
                          },
                            child: Container(
                                height: 4.h,
                                width: 4.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
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
                                child: getSvgImage('cart.svg')),
                          ),
                          getHorSpace(1.h),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const EditProfileScreen());
                            },
                            child: CircleAvatar(
                              radius: 16.px,
                              backgroundImage:
                              const AssetImage('assets/jpgs/profile.jpg'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.4.h),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getVerSpace(1.2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lemon Cake',
                      style: TextStyle(
                          fontSize: 14.px,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'segoeui',
                          color: const Color(0xff444444)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 12.px,
                        ),
                        Icon(Icons.star,
                            color: Colors.yellow,
                            size: 12.px),
                        Icon(Icons.star,
                            color: Colors.yellow,
                            size: 12.px),
                        Icon(Icons.star,
                            color: Colors.yellow,
                            size: 12.px),
                        Icon(Icons.star,
                            color: Colors.yellow,
                            size: 12.px),
                        getHorSpace(.3.h),
                        Text(
                          '5.0',
                          style: TextStyle(
                              fontSize: 12.px,
                              fontWeight:
                              FontWeight.w500,
                              fontFamily: 'segoeui',
                              color: const Color(
                                  0xff404040)),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Ullamcorper sed quis eget urna proin auctor duis. Turpis duis semper condimentum.',
                  style: TextStyle(
                      fontSize: 11.px,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'segoeui',
                      color: const Color(0xff444444)),
                ),
                getVerSpace(1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$30.00",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.px,
                          fontFamily: 'segoeui',
                          color: ConstantColors.greenColor),
                    ),
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(padding: EdgeInsets.only(bottom: 1.h),
                          height:1.5.h,width: 1.5.h,
                          decoration:  BoxDecoration(shape: BoxShape.circle,
                              border: Border.all(color: ConstantColors.greenColor,
                                  width: .5)),
                          child:  Icon(Icons.minimize_sharp,size: 1.h,),
                        ),
                        getHorSpace(1.h),
                        Text(
                          "1",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.px,
                              fontFamily: 'segoeui',
                              color: Colors.black.withOpacity(0.5)),
                        ),
                        getHorSpace(1.h),
                        Container(
                          height:1.5.h,width: 1.5.h,
                          decoration:  BoxDecoration(shape: BoxShape.circle,
                              border: Border.all(color: ConstantColors.greenColor,
                                  width: .5)),
                          child:  Icon(Icons.add,size: 1.h,),
                        ),

                      ],
                    ),
                  ],
                ),
                getVerSpace(3.2.h),
                Text(
                  'Add Ons(Optional)',
                  style: TextStyle(
                      fontSize: 14.px,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'segoeui',
                      color: const Color(0xff444444)),
                ),
                getVerSpace(1.h),
                ListView.builder(padding: EdgeInsets.zero,
                  shrinkWrap: true,itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(vertical: 1.4.h),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(height: 1.8.h,width: 1.8.h,
                                decoration: BoxDecoration(border: Border.all(color: ConstantColors.textFieldGrey),
                                    shape: BoxShape.circle
                                ),),
                              getHorSpace(1.h),
                              Container(height: 4.h,width: 4.h,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.px),
                                    image: const DecorationImage(image: AssetImage('assets/jpgs/cake.jpg'))
                                ),)
                            ],
                          ),
                          Text(
                            "\$30.00",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.px,
                                fontFamily: 'segoeui',
                                color: ConstantColors.textFieldGrey),
                          ),

                        ],),
                    );
                  },),
                getVerSpace(10.h),
                Align(alignment: Alignment.bottomCenter,
                  child: customElevatedButton(() {
                    Get.to(()=>const ChooseCardPayment());
                  },
                      tittle: 'Done',
                      height: 4.4.h,
                      width: 30.9.h,
                      tittleColor:Colors.white ,
                      borColor:ConstantColors.greenColor ,
                      backColor: ConstantColors.greenColor),
                )


              ],
            ),


          )],),
    );



  }
}
