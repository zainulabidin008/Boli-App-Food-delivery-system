import 'dart:developer';

import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../ui_components/custom_widget.dart';
import '../../utils/bottomnavigationBar.dart';
import '../../utils/custom_dialogeBox.dart';
import '../mycart_screens/mycart_main_screen.dart';
import '../profiles_screens/edit_profile_screen.dart';

class AddCartScreen extends StatefulWidget {
  const AddCartScreen({super.key});

  @override
  State<AddCartScreen> createState() => _AddCartScreenState();
}

class _AddCartScreenState extends State<AddCartScreen> {
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
    final TextEditingController nameController = TextEditingController();
    final TextEditingController cardNumberController = TextEditingController();
    RxObjectMixin isChecked = false.obs;
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
                    'Payment method',
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
                  getVerSpace(1.9.h),
                  Container(
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
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.4.h, vertical: 1.5.h),
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add New Card',
                                  style: CustomTextStyles.welcomeSimpleTextStyle
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                IconButton(
                                    onPressed: () {
                                      if (isPressed.value == false) {
                                        isPressed.value = true;
                                      } else {
                                        isPressed.value = false;
                                      }
                                    },
                                    icon: isPressed.value == true
                                        ? Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: ConstantColors.greenColor,
                                          )
                                        : Icon(
                                            Icons.keyboard_arrow_up_outlined,
                                            color: ConstantColors.greenColor,
                                          ))
                              ],
                            ),
                            isPressed.value == true
                                ? const SizedBox.shrink()
                                : getVerSpace(3.2.h),
                            isPressed.value == true
                                ? const SizedBox.shrink()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 3.6.h,
                                        width: 6.h,
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
                                        child:
                                            getPngImage('visa1.jpg', height: 1.5.h),
                                      ),
                                      Container(
                                        height: 3.6.h,
                                        width: 6.h,
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
                                        child: getJpgImage('mastercard.jpg',
                                            height: 1.5.h),
                                      ),
                                      Container(
                                        height: 3.6.h,
                                        width: 6.h,
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
                                        child:
                                            getJpgImage('apple.jpg', height: 1.5.h),
                                      ),
                                    ],
                                  ),
                            isPressed.value == true
                                ? const SizedBox.shrink()
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      getVerSpace(2.h),
                                      Text(
                                        'Enter your Card Details to save Info',
                                        style: CustomTextStyles.textFieldStyle
                                            .copyWith(
                                                color: const Color(0xff717171),
                                                fontWeight: FontWeight.w600),
                                      ),
                                      getVerSpace(2.h),
                                      Text(
                                        'Name on card',
                                        style: CustomTextStyles.textFieldStyle
                                            .copyWith(
                                                color: const Color(0xff717171),
                                                fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.px),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      Colors.grey.withOpacity(0.1),
                                                  offset: const Offset(0, 2),
                                                  spreadRadius: 2,
                                                  blurRadius: 2)
                                            ]),
                                        child: TextField(
                                          cursorHeight: 2.h,
                                          controller: nameController,
                                          style: TextStyle(
                                              fontSize: 12.px,
                                              color:
                                                  ConstantColors.simpleTextColor),
                                          cursorColor: ConstantColors.greenColor,
                                          textAlign: TextAlign.left,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(
                                                horizontal: 1.5.h,
                                                vertical:
                                                    2.h), // Adjust vertical padding
                                            isCollapsed: true,
                                            border: InputBorder.none,
                                            fillColor: Colors.white,

                                            hintText: 'Full Name',
                                            hintStyle:
                                                CustomTextStyles.textFieldStyle,
                                          ),
                                        ),
                                      ),
                                      getVerSpace(2.h),
                                      Text(
                                        'card Number',
                                        style: CustomTextStyles.textFieldStyle
                                            .copyWith(
                                                color: const Color(0xff717171),
                                                fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.px),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      Colors.grey.withOpacity(0.1),
                                                  offset: const Offset(0, 2),
                                                  spreadRadius: 2,
                                                  blurRadius: 2)
                                            ]),
                                        child: TextField(
                                          cursorHeight: 2.h,
                                          controller: cardNumberController,
                                          style: TextStyle(
                                              fontSize: 12.px,
                                              color:
                                                  ConstantColors.simpleTextColor),
                                          cursorColor: ConstantColors.greenColor,
                                          textAlign: TextAlign.left,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(
                                                horizontal: 1.5.h,
                                                vertical:
                                                    2.h), // Adjust vertical padding
                                            isCollapsed: true,
                                            border: InputBorder.none,
                                            fillColor: Colors.white,

                                            hintText: 'XXXX   XXXX   XXXX   XXXX',
                                            hintStyle:
                                                CustomTextStyles.textFieldStyle,
                                          ),
                                        ),
                                      ),
                                      getVerSpace(2.h),
                                      Text(
                                        'expiry date',
                                        style: CustomTextStyles.textFieldStyle
                                            .copyWith(
                                                color: const Color(0xff717171),
                                                fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.px),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      Colors.grey.withOpacity(0.1),
                                                  offset: const Offset(0, 2),
                                                  spreadRadius: 2,
                                                  blurRadius: 2)
                                            ]),
                                        child: TextField(
                                          onTap: () {
                                            selectExpiryDate(context);
                                            log('$picked');
                                          },
                                          readOnly: true,
                                          cursorHeight: 2.h,
                                          controller: nameController,
                                          style: TextStyle(
                                              fontSize: 12.px,
                                              color:
                                                  ConstantColors.simpleTextColor),
                                          cursorColor: ConstantColors.greenColor,
                                          textAlign: TextAlign.left,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(
                                                horizontal: 1.5.h,
                                                vertical:
                                                    2.h), // Adjust vertical padding
                                            isCollapsed: true,
                                            border: InputBorder.none,
                                            fillColor: Colors.white,

                                            hintText: 'MM/YY',
                                            hintStyle:
                                                CustomTextStyles.textFieldStyle,
                                          ),
                                        ),
                                      ),
                                      getVerSpace(2.h),
                                      Text(
                                        'Security code',
                                        style: CustomTextStyles.textFieldStyle
                                            .copyWith(
                                                color: const Color(0xff717171),
                                                fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.px),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      Colors.grey.withOpacity(0.1),
                                                  offset: const Offset(0, 2),
                                                  spreadRadius: 2,
                                                  blurRadius: 2)
                                            ]),
                                        child: TextFormField(
                                          cursorHeight: 2.h,
                                          controller: nameController,
                                          style: TextStyle(
                                              fontSize: 12.px,
                                              color:
                                                  ConstantColors.simpleTextColor),
                                          cursorColor: ConstantColors.greenColor,
                                          textAlign: TextAlign.left,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(
                                                horizontal: 1.5.h,
                                                vertical:
                                                    2.h), // Adjust vertical padding
                                            isCollapsed: true,
                                            border: InputBorder.none,
                                            fillColor: Colors.white,

                                            hintText: 'CVV',
                                            hintStyle:
                                                CustomTextStyles.textFieldStyle,
                                          ),
                                        ),
                                      ),
                                      getVerSpace(3.2.h),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: customElevatedButton(() {
                                        },
                                            tittle: 'Done',
                                            height: 4.4.h,
                                            width: 30.9.h,
                                            tittleColor: Colors.white,
                                            borColor: ConstantColors.greenColor,
                                            backColor: ConstantColors.greenColor),
                                      )
                                    ],
                                  )
                          ],
                        ),
                      ),
                    ),
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

