// import 'package:boli_app/ui_components/custom_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// class RestaurantsDetails extends StatelessWidget {
//   const RestaurantsDetails({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 1.h),
//             height: 26.h,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.1),
//                   offset: const Offset(0, 2),
//                   spreadRadius: 2,
//                   blurRadius: 2,
//                 )
//               ],
//               image: const DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage('assets/pngs/resturent.png'),
//               ),
//               borderRadius: BorderRadius.circular(16.px),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 2.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 9.2.h,
//                   child: ListView.builder(
//                     padding: EdgeInsets.zero,
//                     scrollDirection:
//                         Axis.horizontal, // Set scroll direction to horizontal
//                     shrinkWrap: true, // Ensure it takes only the space required
//                     itemCount: 5,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(16.px)),
//                         margin: EdgeInsets.symmetric(horizontal: .6.h),
//                         height: 9.2.h,
//                         width: 9.2.h,
//                         child: const Image(
//                             image: AssetImage('assets/pngs/more.png')),
//                       );
//                     },
//                   ),
//                 ),
//                 getVerSpace(1.8.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Belmond Copacabana',
//                       style: TextStyle(
//                           fontSize: 14.px,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'segoeui',
//                           color: const Color(0xff444444)),
//                     ),
//                     const Expanded(child: SizedBox()),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.star,
//                           color: Colors.yellow,
//                           size: 12.px,
//                         ),
//                         Icon(Icons.star, color: Colors.yellow, size: 12.px),
//                         Icon(Icons.star, color: Colors.yellow, size: 12.px),
//                         Icon(Icons.star, color: Colors.yellow, size: 12.px),
//                         Icon(Icons.star, color: Colors.yellow, size: 12.px),
//                         getHorSpace(.3.h),
//                         Text(
//                           '5.0',
//                           style: TextStyle(
//                               fontSize: 12.px,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'segoeui',
//                               color: const Color(0xff404040)),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Text(
//                   'Address: Av. Atlântica, 1702 - Copacabana, Rio de Janeiro - RJ, 22021-001, Brazil',
//                   style: TextStyle(
//                       fontSize: 11.px,
//                       fontWeight: FontWeight.w400,
//                       fontFamily: 'segoeui',
//                       color: const Color(0xff404040)),
//                 ),
//                 getVerSpace(1.6.h),
//                 Text(
//                   'Description',
//                   style: TextStyle(
//                       fontSize: 14.px,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: 'segoeui',
//                       color: const Color(0xff444444)),
//                 ),
//                 getVerSpace(1.h),
//                 Text(
//                   'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ullamco laboris nisised do eiusmod tempor incididunt ut labore ullamco laboris nisi ut aliquip Read more',
//                   style: TextStyle(
//                       fontSize: 11.px,
//                       fontWeight: FontWeight.w400,
//                       fontFamily: 'segoeui',
//                       color: const Color(0xff404040)),
//                 ),
//                 getVerSpace(1.8.h),
//                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(padding: const EdgeInsets.all(5.0),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.1),
//                                 offset: const Offset(0, 2),
//                                 spreadRadius: 2,
//                                 blurRadius: 2,
//                               )
//                             ],
//                             borderRadius: BorderRadius.circular(16.px)),
//                         margin: EdgeInsets.all(.2.h),
//                         height: 10.h,
//                         width: 10.h,
//                         child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             getSvgImage('mobile.svg'),
//                             Text(
//                               'Menu',
//                               style: TextStyle(
//                                   fontSize: 10.px,
//                                   fontWeight: FontWeight.w500,
//                                   fontFamily: 'segoeui',
//                                   color: const Color(0xff444444)),
//                             ),
//
//                           ],
//                         )),
//                     Container(padding: const EdgeInsets.all(2.0),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.1),
//                               offset: const Offset(0, 2),
//                               spreadRadius: 2,
//                               blurRadius: 2,
//                             )
//                           ],
//                           borderRadius: BorderRadius.circular(16.px)),
//                       margin: EdgeInsets.all(.2.h),
//                       height: 10.h,
//                       width: 10.h,
//                       child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           getSvgImage('payment.svg'),
//                           Text(
//                             'Pay',
//                             style: TextStyle(
//                                 fontSize: 10.px,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: 'segoeui',
//                                 color: const Color(0xff444444)),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                     Container(padding: const EdgeInsets.all(2.0),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.1),
//                               offset: const Offset(0, 2),
//                               spreadRadius: 2,
//                               blurRadius: 2,
//                             )
//                           ],
//                           borderRadius: BorderRadius.circular(16.px)),
//                       margin: EdgeInsets.all(.2.h),
//                       height: 10.h,
//                       width: 10.h,
//                       child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           getSvgImage('repair.svg'),
//                           Text(
//                             'Reservation',
//                             style: TextStyle(
//                                 fontSize: 10.px,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: 'segoeui',
//                                 color: const Color(0xff444444)),
//                           ),
//
//                         ],
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
