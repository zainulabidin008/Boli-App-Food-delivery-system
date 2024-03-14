// import 'package:boli_app/constants/constant_colors.dart';
// import 'package:boli_app/ui_components/custom_widget.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import '../../constants/constant_textstyle.dart';
// import '../../utils/bottomnavigationBar.dart';
//
// class RestaurantsScreen extends StatelessWidget {
//   const RestaurantsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController searchController = TextEditingController();
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 2.5.h),
//         child: Column(
//           children: [
//             getVerSpace(5.6.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.arrow_back_ios_sharp,
//                         size: 14.px, color: const Color(0xff444444))),
//                 Text(
//                   'Restaurants',
//                   style: TextStyle(
//                       fontSize: 14.px,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: 'segoeui',
//                       color: const Color(0xff444444)),
//                 ),
//                 const Expanded(child: SizedBox()),
//                 Row(
//                   children: [
//                     Container(
//                         height: 2.8.h,
//                         width: 2.8.h,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.1),
//                               offset: const Offset(0, 2),
//                               spreadRadius: 2,
//                               blurRadius: 2,
//                             )
//                           ],
//                         ),
//                         child: getSvgImage('cart.svg')),
//                     getHorSpace(1.h),
//                     CircleAvatar(
//                       radius: 12.px,
//                       backgroundImage:
//                           const AssetImage('assets/jpgs/profile.jpg'),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//             customTextFormField(
//                 searchController, 'Search menu, restaurant or etc',
//                 isObsecure: false,
//                 prefixIcon: Icons.search_sharp,
//                 iconColor: const Color(0xff878787),
//                 sufixIcon: IconButton(
//                     onPressed: () {}, icon: getSvgImage('filter.svg'))),
//             getVerSpace(1.8.h),
//             Expanded(
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 padding: EdgeInsets.zero,
//                 itemCount: 7,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     margin: EdgeInsets.symmetric(vertical: 1.h),
//                     height: 26.h,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             offset: const Offset(0, 2),
//                             spreadRadius: 2,
//                             blurRadius: 2,
//                           )
//                         ],
//                         image: const DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage('assets/pngs/resturent.png')),
//                         borderRadius: BorderRadius.circular(16.px)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(8.0),
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                 bottomRight: Radius.circular(16.px),
//                                 bottomLeft: Radius.circular(16.px),
//                               )),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Belmond Copacabana',
//                                     style: TextStyle(
//                                         fontSize: 12.px,
//                                         fontWeight: FontWeight.w600,
//                                         fontFamily: 'segoeui',
//                                         color: const Color(0xff404040)),
//                                   ),
//                                   Text(
//                                     'Address: Av. Atlântica, 1702',
//                                     style: TextStyle(
//                                         fontSize: 9.px,
//                                         fontWeight: FontWeight.w400,
//                                         fontFamily: 'segoeui',
//                                         color: const Color(0xff404040)),
//                                   ),
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.star,
//                                         color: Colors.yellow,
//                                         size: 10.px,
//                                       ),
//                                       Icon(Icons.star,
//                                           color: Colors.yellow, size: 10.px),
//                                       Icon(Icons.star,
//                                           color: Colors.yellow, size: 10.px),
//                                       Icon(Icons.star,
//                                           color: Colors.yellow, size: 10.px),
//                                       Icon(Icons.star,
//                                           color: Colors.yellow, size: 10.px),
//                                       getHorSpace(.3.h),
//                                       Text(
//                                         '5.0',
//                                         style: TextStyle(
//                                             fontSize: 10.px,
//                                             fontWeight: FontWeight.w500,
//                                             fontFamily: 'segoeui',
//                                             color: const Color(0xff404040)),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                               Container(
//                                 alignment: Alignment.center,
//                                 height: 3.h,
//                                 width: 7.h,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(30),
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.1),
//                                       offset: const Offset(0, 2),
//                                       spreadRadius: 2,
//                                       blurRadius: 2,
//                                     )
//                                   ],
//                                 ),
//                                 child: Text(
//                                   'View',
//                                   style: CustomTextStyles.buttonTextStyle,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
