import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/constant_colors.dart';
import '../../constants/constant_textstyle.dart';
import 'mycart_product_detail.dart';

class MyCartMainScreen extends StatelessWidget {
  const MyCartMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
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
                'My Cart',
                style: TextStyle(
                    fontSize: 16.px,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'segoeui',
                    color: const Color(0xff444444)),
              ),
            ],
          ),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: 2.4.h),
             child: Column(children: [
               ListView.builder(physics: const NeverScrollableScrollPhysics(),
                 padding: EdgeInsets.zero,
                 itemCount: 4,
                 shrinkWrap: true,
                 itemBuilder: (context, index) {
                   return Padding(
                     padding: EdgeInsets.symmetric(vertical: 2.5.h),
                     child: GestureDetector(
                       onTap: () {
                         Get.to(()=>const MyCartProductDetail());
                       },
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
                                 height: 8.h,
                                 width: 8.h,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10.px),
                                     color: Colors.grey,
                                     image: const DecorationImage(
                                         fit: BoxFit.cover,
                                         image: AssetImage(
                                             'assets/pngs/item.png'))),
                               ),
                               getHorSpace(1.h),
                               Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                 Row(
                                   children: [
                                     Text(
                                       'Lorem ipsum dolor sit amets',
                                       style: TextStyle(
                                           fontSize: 13.px,
                                           fontFamily: 'segoeui',
                                           fontWeight: FontWeight.w600,
                                           color: const Color(0xff3D405B)),
                                     ),
                                     getHorSpace(5.5.h),
                                     Icon(Icons.clear_rounded,size: 2.h,color: Colors.black,)
                                   ],
                                 ),
                                 Text(
                                   'Lorem ipsum',
                                   style: TextStyle(
                                       fontSize: 11.px,
                                       fontFamily: 'segoeui',
                                       color: const Color(0xff3D405B)),
                                 ),
                                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         "\$5.34",
                                         style: TextStyle(
                                             fontWeight: FontWeight.w600,
                                             fontSize: 14.px,
                                             fontFamily: 'segoeui',
                                             color:const Color(0xff3D405B)),
                                       ),
                                       getHorSpace(14.5.h),
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
                                   ),
                               ],)
        
        
                             ],
                           )),
                     ),
                   );
                 },
               ),
                Divider(color: Colors.grey.withOpacity(0.8),),
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                 Text(
                   'TOTAL',
                   style: TextStyle(
                       fontSize: 12.px,
                       fontWeight: FontWeight.w600,
                       fontFamily: 'segoeui',
                       color: const Color(0xff444444)),
                 ),
                 Text(
                   '\$5.45',
                   style: TextStyle(
                       fontSize: 12.px,
                       fontWeight: FontWeight.w600,
                       fontFamily: 'segoeui',
                       color: const Color(0xff444444)),
                 ),
               ],),
               getVerSpace(10.h),
               Align(
                 alignment: Alignment.bottomCenter,
                 child: customElevatedButton(() {},
                     tittle: 'Proceed to Pay',
                     height: 4.4.h,
                     width: 30.9.h,
                     tittleColor: Colors.white,
                     borColor: ConstantColors.greenColor,
                     backColor: ConstantColors.greenColor),
               ),
        
                     ],),
           )
        ],),
      ),
    );
  }
}
