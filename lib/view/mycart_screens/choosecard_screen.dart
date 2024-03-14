
import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../ui_components/custom_widget.dart';
import '../../utils/bottomnavigationBar.dart';
import '../../utils/custom_dialogeBox.dart';
import 'ordercompleted.dart';

class ChooseCardPayment extends StatefulWidget {
  const ChooseCardPayment({super.key});

  @override
  State<ChooseCardPayment> createState() => _ChooseCardPaymentState();
}

class _ChooseCardPaymentState extends State<ChooseCardPayment> {
  CustomDialogueBox customDialogueBox=CustomDialogueBox();
  final DateTime? selectedDate = DateTime.now();

  DateTime picked = DateTime.now();

  Future<void> selectExpiryDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2025, 6),
        context: context);
    setState(() {
      picked = pickedDate!;
    });
  }

  RxBool isPressed = false.obs;

  @override
  Widget build(BuildContext context) {
    RxObjectMixin isChecked = false.obs;
    RxObjectMixin isChecked2 = false.obs;
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(   crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Payment',
                    style: TextStyle(
                        fontSize: 16.px,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'segoeui',
                        color: const Color(0xff444444)),
                  ),
                ],),

              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  getVerSpace(1.5.h),
                  Text(
                    'Saved Card',
                    style: CustomTextStyles.welcomeSimpleTextStyle
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  getVerSpace(1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (isChecked.value == false) {
                            isChecked.value = true;
                            isChecked2.value = false;
                          } else {
                            isChecked.value = false;
                          }
                        },
                        child: Obx(
                              () => Container(
                            alignment: Alignment.center,
                            height: 2.4.h,
                            width: 2.4.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: ConstantColors.greenColor, width: 2)),
                            child: isChecked.value == true
                                ? Container(
                              height: 2.h,
                              width: 2.h,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            )
                                : const SizedBox.shrink(),
                          ),
                        ),
                      ),
                      getHorSpace(2.h),
                      Container(
                        height: 5.6.h,
                        width: 35.h,
                        decoration: BoxDecoration(
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            getPngImage('visa1.jpg', height: 1.5.h),
                            Text(
                              '134***************5',
                              style: TextStyle(
                                  fontSize: 12.px,
                                  fontFamily: 'segoeui',
                                  color: const Color(0xff444444)),
                            ),
                            TextButton(
                                onPressed: () {
                                  customDialogueBox.openSignOutDialog(
                                      title: 'Delete Card',
                                      description: 'Are you sure you want to Delete this Card?',
                                      svg: 'delete.svg',
                                      onTap: (){}


                                  );

                                },
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      fontSize: 12.px,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.red,
                                      color: Colors.red),
                                ))
                          ],
                        ),
                      ),

                    ],
                  ),
                  getVerSpace(2.6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (isChecked2.value == false) {
                            isChecked2.value = true;
                            isChecked.value = false;
                          } else {
                            isChecked2.value = false;
                          }
                        },
                        child: Obx(
                              () => Container(
                            alignment: Alignment.center,
                            height: 2.4.h,
                            width: 2.4.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: ConstantColors.greenColor, width: 2)),
                            child: isChecked2.value == true
                                ? Container(
                              height: 2.h,
                              width: 2.h,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            )
                                : const SizedBox.shrink(),
                          ),
                        ),
                      ),
                      getHorSpace(2.h),
                      Container(
                        height: 5.6.h,
                        width: 35.h,
                        decoration: BoxDecoration(
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            getPngImage('mastercard.jpg', height: 2.5.h),
                            Text(
                              '134***************5',
                              style: TextStyle(
                                  fontSize: 12.px,
                                  fontFamily: 'segoeui',
                                  color: const Color(0xff444444)),
                            ),
                            TextButton(
                                onPressed: () {
                                  customDialogueBox.openSignOutDialog(
                                      title: 'Delete Card',
                                      description: 'Are you sure you want to Delete this Card?',
                                      svg: 'delete.svg',
                                      onTap: (){}


                                  );

                                },
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      fontSize: 12.px,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.red,
                                      color: Colors.red),
                                ))
                          ],
                        ),
                      ),

                    ],
                  ),
                  getVerSpace(13.9.h),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                   Align(alignment: Alignment.bottomCenter,
                     child: customElevatedButton(() {
                       Get.back();
                     },
                         tittle: 'Back to cart',
                         height: 4.4.h,
                         width: 17.4.h,
                         tittleColor:ConstantColors.greenColor ,
                         borColor:ConstantColors.greenColor ,
                         backColor:Colors.white ),
                   ),
                   Align(alignment: Alignment.bottomCenter,
                     child: customElevatedButton(() {
                       Get.to(()=>const OrderCompleted());
                     },
                         tittle: 'Order',
                         height: 4.4.h,
                         width: 17.4.h,
                         tittleColor:Colors.white ,
                         borColor:ConstantColors.greenColor ,
                         backColor: ConstantColors.greenColor),
                   )
                 ],)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

