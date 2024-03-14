import 'package:boli_app/constants/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../ui_components/custom_widget.dart';
import '../../utils/bottomnavigationBar.dart';
import '../home_screens/item_add_to_cart.dart';
import '../mycart_screens/mycart_main_screen.dart';
import '../profiles_screens/edit_profile_screen.dart';

class MyOrderMainScreen extends StatelessWidget {
  const MyOrderMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RxInt selectedIndex = 0.obs;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2.4.h),
          child: Column(
            children: [
              getVerSpace(5.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    IconButton(
                        onPressed: () {
                          Get.to(()=>const BottomNavBar(commingIndex: 0,));
                        },
                        icon: Icon(Icons.arrow_back_ios_sharp,
                            size: 18.px, color: const Color(0xff444444))),
                    Text(
                      'My Orders',
                      style: TextStyle(
                          fontSize: 16.px,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'segoeui',
                          color: const Color(0xff444444)),
                    ),
                  ],),
                  Padding(
                    padding: EdgeInsets.only(right: 2.h),
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




              getVerSpace(2.h),
              Obx(
                () => TabBar(
                    dividerColor: ConstantColors.textFieldGrey,
                    dividerHeight: 2.5,
                    indicatorWeight: 2.0,
                    labelPadding: EdgeInsets.symmetric(vertical: 1.h),
                    indicatorColor: ConstantColors.greenColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    padding: EdgeInsets.symmetric(horizontal: 9.h),
                    onTap: (value) {
                      selectedIndex.value = value;
                    },
                    tabs: [
                      Text(
                        'Previous Orders',
                        style: TextStyle(
                            fontSize: 10.px,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'segoeui',
                            color: selectedIndex.value == 0
                                ? const Color(0xff00BF63)
                                : const Color(0xffA6A6A6)),
                      ),
                      Text(
                        'Current Orders',
                        style: TextStyle(
                            fontSize: 10.px,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'segoeui',
                            color: selectedIndex.value == 1
                                ? const Color(0xff00BF63)
                                : const Color(0xffA6A6A6)),
                      ),
                    ]),
              ),
              getVerSpace(1.h),
                               Expanded(
               child: Container(height: double.infinity,
                 child: TabBarView(children: [
                   Column(children: [
                     Text(
                       'By clicking Reorder Item will be added to your cart.',
                       style: TextStyle(
                           fontSize: 10.px,
                           fontWeight: FontWeight.w500,
                           fontFamily: 'segoeui',
                           color: const Color(0xff444444)),
                     ),
                     getVerSpace(4.h),
                     ListView.builder(
                       padding: EdgeInsets.zero,
                       itemCount: 3,
                       shrinkWrap: true,
                       itemBuilder: (context, index) {
                         return GestureDetector(
                           onTap: () {
                           },
                           child: Padding(
                             padding:  EdgeInsets.symmetric(vertical: 2.h),
                             child: Container(padding: EdgeInsets.symmetric(vertical: .5.h),
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
                                 child: ListTile(
                                     leading: Container(
                                       height: 6.h,
                                       width: 6.h,
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10.px),
                                           color: Colors.grey,
                                           image: const DecorationImage(
                                               fit: BoxFit.cover,
                                               image:
                                               AssetImage('assets/pngs/item.png'))),
                                     ),
                                     title: Text(
                                       'Lorem ipsum dolor sit amets',
                                       style: TextStyle(
                                           fontSize: 13.px,
                                           fontFamily: 'segoeui',
                                           color: const Color(0xff3D405B)),
                                     ),
                                     subtitle:Text(
                                       "\$5.49",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           fontSize: 12.px,
                                           fontFamily: 'segoeui',
                                           color: ConstantColors.simpleTextColor),
                                     ),
                                     trailing: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Text(
                                           "Reorder",
                                           style: TextStyle(
                                               fontWeight: FontWeight.w600,
                                               fontSize: 14.px,
                                               fontFamily: 'segoeui',
                                               color: ConstantColors.greenColor,
                                               decoration: TextDecoration.underline,
                                               decorationColor: ConstantColors.greenColor),
                                         ),
                                         Text(
                                           "Delivered",
                                           style: TextStyle(
                                               fontWeight: FontWeight.w600,
                                               fontSize: 12.px,
                                               fontFamily: 'segoeui',
                                               color: ConstantColors.textFieldGrey,
                                               decoration: TextDecoration.underline,
                                               decorationColor: ConstantColors.textFieldGrey
                                           ),
                                         ),
                                       ],)
                                 )),
                           ),
                         );
                       },
                     ),


                   ],),
                   Column(children: [
                     getVerSpace(1.h),
                     Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 3.6.h),
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Container(height: 1.2.h,width: 1.2.h,
                                 decoration: BoxDecoration(shape: BoxShape.circle,color: ConstantColors.greenColor),),
                               Container(height: .4.h,width: 15.2.h,
                                 decoration: BoxDecoration(color: ConstantColors.greenColor),),
                               Container(height: 1.2.h,width: 1.2.h,
                                 decoration: BoxDecoration(shape: BoxShape.circle,color: ConstantColors.greenColor),),
                               Container(height: .4.h,width: 15.2.h,
                                 decoration: BoxDecoration(color: ConstantColors.textFieldGrey),),
                               Container(height: 1.2.h,width: 1.2.h,
                                 decoration: BoxDecoration(shape: BoxShape.circle,color: ConstantColors.textFieldGrey),),


                             ],),
                           getVerSpace(1.h),

                           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(
                                 'Confirmed',
                                 style: TextStyle(
                                     fontSize: 10.px,
                                     fontWeight: FontWeight.w500,
                                     fontFamily: 'segoeui',
                                     color: const Color(0xff444444)),
                               ),
                               Text(
                                 'Preparing',
                                 style: TextStyle(
                                     fontSize: 10.px,
                                     fontWeight: FontWeight.w500,
                                     fontFamily: 'segoeui',
                                     color: const Color(0xff444444)),
                               ),
                               Text(
                                 'Delivered',
                                 style: TextStyle(
                                     fontSize: 10.px,
                                     fontWeight: FontWeight.w500,
                                     fontFamily: 'segoeui',
                                     color: const Color(0xff444444)),
                               ),
                             ],),
                         ],
                       ),
                     ),
                     getVerSpace(2.h),
                     Row(crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                       Text(
                         'Order Details',
                         style: TextStyle(
                             fontSize: 13.px,
                             fontWeight: FontWeight.w600,
                             fontFamily: 'segoeui',
                             color: const Color(0xff444444)),
                       ),
                     ],),



                     ListView.builder(
                       padding: EdgeInsets.zero,
                       itemCount: 3,
                       shrinkWrap: true,
                       itemBuilder: (context, index) {
                         return Padding(
                           padding: EdgeInsets.symmetric(vertical: 2.h,),
                           child: GestureDetector(
                             onTap: () {
                               Get.to(() => const ItemAddToCart());
                             },
                             child: Container(padding: EdgeInsets.symmetric(vertical: .5.h),
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
                                 child: ListTile(
                                     leading: Container(
                                       height: 6.h,
                                       width: 6.h,
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10.px),
                                           color: Colors.grey,
                                           image: const DecorationImage(
                                               fit: BoxFit.cover,
                                               image:
                                               AssetImage('assets/pngs/item.png'))),
                                     ),
                                     title: Text(
                                       'Lorem ipsum dolor sit amets',
                                       style: TextStyle(
                                           fontSize: 13.px,
                                           fontFamily: 'segoeui',
                                           color: const Color(0xff3D405B)),
                                     ),
                                     subtitle:Text(
                                       "\$5.49",
                                       style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           fontSize: 12.px,
                                           fontFamily: 'segoeui',
                                           color: ConstantColors.simpleTextColor),
                                     ),
                                     trailing: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Text(
                                           "Reorder",
                                           style: TextStyle(
                                               fontWeight: FontWeight.w600,
                                               fontSize: 14.px,
                                               fontFamily: 'segoeui',
                                               color: ConstantColors.greenColor,
                                               decoration: TextDecoration.underline,
                                               decorationColor: ConstantColors.greenColor),
                                         ),
                                         Text(
                                           "Delivered",
                                           style: TextStyle(
                                               fontWeight: FontWeight.w600,
                                               fontSize: 12.px,
                                               fontFamily: 'segoeui',
                                               color: ConstantColors.textFieldGrey,
                                               decoration: TextDecoration.underline,
                                               decorationColor: ConstantColors.textFieldGrey
                                           ),
                                         ),
                                       ],)
                                 )),
                           ),
                         );
                       },
                     ),
                     Align(alignment: Alignment.bottomCenter,
                       child: customElevatedButton(() {
                         Get.to(()=> const BottomNavBar(commingIndex: 0,));
                       },
                           tittle: 'Done',
                           height: 4.4.h,
                           width: 30.9.h,
                           tittleColor:Colors.white ,
                           borColor:ConstantColors.greenColor ,
                           backColor: ConstantColors.greenColor),
                     ),
                     getVerSpace(14.4.h),

                   ],)
                 ]),
               ),
                               ),
            ],
          ),
        ),
      ),
    );
  }
}
