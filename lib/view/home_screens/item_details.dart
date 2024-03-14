import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../mycart_screens/mycart_main_screen.dart';
import '../profiles_screens/edit_profile_screen.dart';
import 'item_add_to_cart.dart';


class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

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
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios_sharp,
                          size: 18.px, color: const Color(0xff444444))),
                  Text(
                    'My Cart',
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5.h),
              child: Column(
                children: [
        
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 8,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.5.h),
                        child: GestureDetector(onTap: (){
                          Get.to(()=>const ItemAddToCart());
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
        
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
