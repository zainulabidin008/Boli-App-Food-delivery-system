import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:boli_app/view/reservation_screens/reservation_successfull_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReservationScreen extends StatefulWidget {
   ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  DateTime picked = DateTime.now();
  String? formattedDate;
  DateTime selectedDate=DateTime.now();
  Future<void>selectExpiryDate(BuildContext context)async{
    DateTime? pickedDate=await showDatePicker(initialDate:selectedDate,
        firstDate: DateTime(1900,8),
        lastDate: DateTime(2025,6),
        context: context);
    setState(() {
      picked=pickedDate!;
       formattedDate = DateFormat('yyyy-MM-dd').format(picked);

    });

  }
  TimeOfDay initialTime=TimeOfDay.now();
  TimeOfDay? pickedTime;
  String? formattedTime;
  Future<void> _selectTime(BuildContext context) async {
     pickedTime=await showTimePicker(context: context, initialTime:initialTime,

    );
     setState(() {
       final localizations = MaterialLocalizations.of(context);

        formattedTime = localizations.formatTimeOfDay(pickedTime!);

     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                'Reservation',
                style: TextStyle(
                    fontSize: 16.px,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'segoeui',
                    color: const Color(0xff444444)),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.4.h),
            child: Column(
              children: [

                Text(
                  'Fill the Details to complete the Reservation process.',
                  style: TextStyle(
                      fontSize: 12.px,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'segoeui',
                      color: const Color(0xff8D8D8D)),
                ),
                getVerSpace(2.h),
                Container(
                  height: 8.7.h,
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
                      height: 7.h,
                      width: 7.h,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/jpgs/resturant.jpg'),
                          ),
                          borderRadius: BorderRadius.circular(10.px)),
                    ),
                    title: Text(
                      'Belmond Copacabana ',
                      style: TextStyle(
                          fontSize: 12.px,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'segoeui',
                          color: const Color(0xff464646)),
                    ),
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.star,
                            color: const Color(0xffFFC000), size: 14.px),
                        getHorSpace(.5.h),
                        Text(
                          '5.0 ',
                          style: TextStyle(
                              fontSize: 12.px,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'segoeui',
                              color: const Color(0xff464646)),
                        ),
                        Text('(92 Reviews)',
                            style: TextStyle(
                              fontSize: 12.px,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'segoeui',
                              color: ConstantColors.greenColor,
                            )),
                      ],
                    ),
                  ),
                ),
                getVerSpace(2.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                  height: 6.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.px),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Table for',
                        style: CustomTextStyles.buttonTextStyle
                            .copyWith(color: const Color(0xff717171)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        height: 5.h,
                        width: 10.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.px),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '-',
                              style: CustomTextStyles.buttonTextStyle.copyWith(
                                  color: const Color(
                                    0xff717171,
                                  ),
                                  fontSize: 17.px),
                            ),
                            Text(
                              '1',
                              style: CustomTextStyles.buttonTextStyle.copyWith(
                                  color: const Color(0xff717171), fontSize: 16.px),
                            ),
                            Text(
                              '+',
                              style: CustomTextStyles.buttonTextStyle.copyWith(
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
                ),
                getVerSpace(2.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                  height: 6.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.px),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formattedDate??'16/02/20204',
                        style: CustomTextStyles.buttonTextStyle
                            .copyWith(color: const Color(0xff717171)),
                      ),
                      GestureDetector(onTap: (){
                        selectExpiryDate(context);
                      },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                          height: 3.8.h,
                          width: 3.8.h,
                          decoration: BoxDecoration(

                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                offset: const Offset(0, 2),
                                spreadRadius: 2,
                                blurRadius: 2,
                              )
                            ],
                          ),child: getSvgImage('myreservation.svg',boxFit: BoxFit.cover,),

                        ),
                      )
                    ],
                  ),
                ),
                getVerSpace(2.h),
                GestureDetector(onTap: (){
                  _selectTime(context);
                },
                  child: Container(alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                    height: 6.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.px),
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
                    child:   Text(
                    formattedTime?? '08:00 PM',
                      style: CustomTextStyles.buttonTextStyle
                          .copyWith(color: const Color(0xff717171)),
                    ),
                  ),
                ),
                getVerSpace(5.7.h),
                Align(alignment: Alignment.bottomCenter,
                  child: customElevatedButton(() {
                    Get.to(()=>const ReservationSuccess());
                  },
                      tittle: 'Confirm',
                      height: 4.4.h,
                      width: 30.9.h,
                      tittleColor:Colors.white ,
                      borColor:ConstantColors.greenColor ,
                      backColor: ConstantColors.greenColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
