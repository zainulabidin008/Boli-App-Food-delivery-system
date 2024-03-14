import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_textstyle.dart';
import '../../ui_components/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSelected1=true.obs;
    RxBool isSelected2=false.obs;
    RxInt isPicked=0.obs;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text(''),

      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          getVerSpace(5.6.h),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 1.5.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       // IconButton(
          //       //     onPressed: () {
          //       //
          //       //     },
          //       //     icon: Icon(
          //       //       Icons.menu_sharp,
          //       //       color: ConstantColors.greenColor,
          //       //     )),
          //       Row(
          //         children: [
          //           Container(
          //               height: 2.8.h,
          //               width: 2.8.h,
          //               decoration: BoxDecoration(
          //                 shape: BoxShape.circle,
          //                 color: Colors.white,
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: Colors.grey.withOpacity(0.1),
          //                     offset: const Offset(0, 2),
          //                     spreadRadius: 2,
          //                     blurRadius: 2,
          //                   )
          //                 ],
          //               ),
          //               child: getSvgImage('cart.svg')),
          //           getHorSpace(1.h),
          //           CircleAvatar(
          //             radius: 12.px,
          //             backgroundImage:
          //                 const AssetImage('assets/jpgs/profile.jpg'),
          //           )
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getVerSpace(1.8.h),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Welcome To Your',
                      style: CustomTextStyles.headingStyle.copyWith(
                        fontSize: 24.px,
                        color: const Color(0xff444444),
                      )),
                  TextSpan(
                    text: ' Flavorful\n',
                    style: CustomTextStyles.headingStyle
                        .copyWith(fontSize: 24.px),
                  ),
                  TextSpan(
                    text: ''
                        ' Journeys!',
                    style: CustomTextStyles.headingStyle.copyWith(
                        fontSize: 24.px, color: const Color(0xff444444)),
                  ),
                ])),
                getVerSpace(3.3.h),
                Container(
                  height: 5.h, width: 30.8.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.px),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          offset: const Offset(0, 2),
                          spreadRadius: 2,
                          blurRadius: 2,
                        )
                      ]),
                  child: Obx(()=>
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(onTap: (){
                          isSelected2.value=false;
                          isSelected1.value=true;

                        },
                          child: Container(alignment: Alignment.center,
                              height: 5.h,
                              width: 14.2.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.px),
                                  color:isSelected1.value==true? ConstantColors.greenColor:Colors.transparent,
                                 ),
                              child:  Text('Order Food',
                              style: TextStyle( color:isSelected1.value==true?Colors.white:ConstantColors.textFieldGrey, ),)),
                        ),

                        GestureDetector(onTap: (){
                          isSelected1.value=false;

                          isSelected2.value=true;

                        },
                          child: Container(alignment: Alignment.center,
                              height: 5.h,
                              width: 14.2.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.px),
                                  color: isSelected2.value==true? ConstantColors.greenColor:Colors.white,
                              ),
                              child:  Text('Reservations', style: TextStyle( color:isSelected2.value==true?Colors.white:ConstantColors.textFieldGrey, ))),
                        ),
                      ],
                    ),
                  ),
                ),
                getVerSpace(3.3.h),
                customTextFormField(
                  searchController,
                    'Search menu, restaurant or etc',
                    isObsecure: false,
                    prefixIcon: Icons.search_sharp,
                    iconColor: const Color(0xff878787),

                 ),
                getVerSpace(1.2.h),
                Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.px),
                  color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        offset: const Offset(0, 2),
                        spreadRadius: 2,
                        blurRadius: 2,
                      )
                    ]
                ),
                  child: ListView.builder(padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 2.2.h,vertical: 1.h),
                      child: GestureDetector(onTap: (){
                        isPicked.value=index;
                      },
                        child: Obx(() =>
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [ Text('Lorem ipsum dolor sit amet consectetur.',
                            style: CustomTextStyles.onBoardSimpleTextStyle,
                          ),      Container(height: 1.2.h,width: 1.2.h,
                            decoration: BoxDecoration(border: Border.all(
                                color:  isPicked.value==index?ConstantColors.greenColor:
                            Colors.grey,width:isPicked.value==index?2:0 ),
                                color: Colors.white,
                                shape: BoxShape.circle),),]
                                           ),
                        ),
                      ),
                    );
                  },),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
