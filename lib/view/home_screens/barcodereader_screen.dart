// import 'package:boli_app/constants/constant_colors.dart';
// import 'package:boli_app/constants/constant_textstyle.dart';
// import 'package:boli_app/ui_components/custom_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
//
// class BarCodeReader extends StatefulWidget {
//   const BarCodeReader({super.key});
//
//   @override
//   State<BarCodeReader> createState() => _BarCodeReaderState();
// }
//
// class _BarCodeReaderState extends State<BarCodeReader> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 2.h),
//         child: Column(
//           children: [
//             getVerSpace(6.h),
//             Row(
//               children: [
//                 Icon(
//                   Icons.arrow_back_ios_new_rounded,
//                   size: 2.h,
//                   color: Colors.black,
//                 ),
//                 getHorSpace(2.h),
//                 Text(
//                   'Scan QR Code',
//                   style: TextStyle(
//                       fontSize: 14.px,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: 'segoeui',
//                       color: const Color(0xff444444)),
//                 ),
//               ],
//             ),
//             getVerSpace(6.h),
//             Text(
//               'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ',
//               style: TextStyle(
//                   fontSize: 12.px,
//                   fontWeight: FontWeight.w400,
//                   fontFamily: 'segoeui',
//                   color: const Color(0xff404040)),
//               textAlign: TextAlign.center,
//             ),
//             getVerSpace(50.h),
//             Text(
//               'SCAN QR ON THE TABLE',
//               style: TextStyle(
//                   fontSize: 14.px,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: 'segoeui',
//                   color: const Color(0xff444444)),
//             ),
//             getVerSpace(3.h),
//             ElevatedButton(
//               style: ButtonStyle(
//                   fixedSize: MaterialStatePropertyAll(Size(30.9.h, 4.4.h)),
//                   backgroundColor:
//                       MaterialStatePropertyAll(ConstantColors.greenColor)),
//               onPressed: () async {
//                 var res = await Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const SimpleBarcodeScannerPage(),
//                     ));
//
//                 setState(() {
//                   if (res is String) {
//                     var result = res;
//                   }
//                 });
//               },
//               child: Text(
//                 'Scan',
//                 style: CustomTextStyles.buttonTextStyle
//                     .copyWith(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
