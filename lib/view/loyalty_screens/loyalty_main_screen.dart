import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/bottomnavigationBar.dart';
import '../mycart_screens/mycart_main_screen.dart';
import '../profiles_screens/edit_profile_screen.dart';
import 'loyalty_redeem_points.dart';


class MainLoyaltyScreen extends StatelessWidget {
  const MainLoyaltyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
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
                    'Loyalty Card',
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
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: 2.4.h),
             child: Column(children: [
               getVerSpace(.5.h),
               Container(
                 padding: EdgeInsets.symmetric(
                     horizontal: 1.h, vertical: .5.h),
                 decoration: BoxDecoration(
                     color: ConstantColors.greenColor,
                     borderRadius: BorderRadius.circular(10.px)),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'Points: 1400',
                           style: TextStyle(
                               fontSize: 12.px,
                               fontWeight: FontWeight.w600,
                               color: Colors.white,
                               fontFamily: 'segoeui'),
                         ),
                         getVerSpace(.5.h),
                         Text(
                           'Lorem ipsum dolor sit amet consectetur.\nOrnare nunc at faucibus scelerisque hac in.',
                           style: TextStyle(
                               fontSize: 10.px,
                               fontWeight: FontWeight.w400,
                               color: Colors.white,
                               fontFamily: 'segoeui'),
                         ),

                       ],
                     ),
                     getSvgImage('burgergroup.svg')
                   ],
                 ),
               ),
               getVerSpace(2.h),
               Text(
                 '*For every dollar you spend on eligible purchases, you will receive 100 points',
                 style: TextStyle(
                     fontSize: 10.px,
                     fontWeight: FontWeight.w400,
                     color: Colors.green,
                     fontFamily: 'segoeui'),
               ),

               ListView.builder(physics: const NeverScrollableScrollPhysics(),
                 padding: EdgeInsets.zero,
                 itemCount: 4,
                 shrinkWrap: true,
                 itemBuilder: (context, index) {
                   return Padding(
                     padding: EdgeInsets.symmetric(vertical: 2.5.h),
                     child: GestureDetector(onTap: (){
                       Get.to(()=>const LoyaltyRedeemScreen());
                     },
                       child: Container(
                           height: 8.4.h,
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
                           child: ListTile( leading: Container(
                             height: 6.h,
                             width: 6.h,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10.px),
                                 color: Colors.grey,
                                 image: const DecorationImage(fit: BoxFit.cover,
                                     image:

                                     AssetImage('assets/pngs/item.png'))

                             ),

                           ),
                             title:
                             Text(
                               'Lorem ipsum dolor sit amets',
                               style: TextStyle(
                                   fontSize: 13.px,
                                   fontFamily: 'segoeui',
                                   color: const Color(0xff3D405B)),
                             ),subtitle:
                             Text(
                               'Lorem ipsum',
                               style: TextStyle(
                                   fontSize: 11.px,
                                   fontFamily: 'segoeui',
                                   color: const Color(0xff3D405B)),
                             ),
                             trailing:  Text(
                               "\$5.49",
                               style: TextStyle(
                                   fontWeight: FontWeight.w600,
                                   fontSize: 12.px,
                                   fontFamily: 'segoeui',
                                   color: ConstantColors.greenColor),
                             ),

                           )
                       ),
                     ),
                   );
                 },
               )
             ],),
           )
        
          ],
        ),
      ),
    );
  }
}
