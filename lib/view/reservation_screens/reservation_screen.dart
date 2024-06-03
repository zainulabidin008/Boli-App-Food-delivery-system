
import 'dart:developer';

import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../api_services/my_shared_preferance.dart';
import '../../controllers/add_reviews_controller.dart';
import '../../controllers/book_reservation_Controller.dart';
import '../../controllers/get_resturants_controller.dart';
import '../../utils/custom_snackbar.dart';

class ReservationScreen extends StatefulWidget {
  final int selectedIndex;
  final String? restaurantId;

    const ReservationScreen({super.key,required this.selectedIndex,this.restaurantId});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final AddReviewsController addReviewsController=Get.put(AddReviewsController());
  BookReservationController bookReservationController=Get.put(BookReservationController());
  final GetResturantsController getResturantsController =
  Get.put(GetResturantsController());
  final Rx<DateTime> picked = DateTime.now().obs;
  final RxString formattedDate = '2024/12/20'.obs;
  final DateTime selectedDate = DateTime.now();

   Future<void>selectExpiryDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      initialDate: selectedDate,
      firstDate: DateTime(1900, 8),
      lastDate: DateTime(2025, 6),
      context: context,
    );
    if (pickedDate != null) {
      picked(pickedDate);
      formattedDate(DateFormat('yyyy-MM-dd').format(picked.value));
    }
  }
  final  initialTime=TimeOfDay.now().obs;
  final pickedTime=Rx<TimeOfDay?>(null);
  RxString? formattedTime='2:30 PM'.obs;

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime.value, // Use initialTime.value to set initial time
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked != null) {
      pickedTime.value = picked;

      // Format the picked time in 24-hour format without AM/PM
      formattedTime!.value = '${picked.hour}:${picked.minute}';
    }
  }
  MySharedPreferanse mySharedPreferanse=MySharedPreferanse();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    addReviewsController.getResturantReview(widget.restaurantId);
    mySharedPreferanse.getUserLoginToken();
  }
  @override
  Widget build(BuildContext context) {
    final RxInt quantity=0.obs;

    return Scaffold(
      body: Obx(()=>
      addReviewsController.loading.value==true||addReviewsController.isLoading.value==true?Center(child: CircularProgressIndicator(color: ConstantColors.greenColor,)):
        Column(
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
                            image: getResturantsController
                                .allResturant
                                .value!
                                .data![widget.selectedIndex]
                                .images!
                                .isEmpty
                                ? const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/pngs/resturent.png'))
                                : DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    '${getResturantsController.allResturant.value!.data![widget.selectedIndex].images}')
                              // image: AssetImage(
                              //     'assets/pngs/resturent.png')
                            ),
                            borderRadius: BorderRadius.circular(10.px)),
                      ),
                      title: Text(
                        getResturantsController.allResturant.value!.data![widget.selectedIndex].name??'Good',
                        style: TextStyle(
                            fontSize: 12.px,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'segoeui',
                            color: const Color(0xff464646)),
                      ),
                      subtitle: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RatingBar
                              .builder(
                            initialRating:
                            (getResturantsController.allResturant.value!.data![widget.selectedIndex].averageRating ?? 5)
                                .toDouble() ??
                                5,
                            minRating: 0,
                            direction: Axis
                                .horizontal,
                            allowHalfRating:
                            false,
                            itemCount: 5,
                            itemSize:
                            2.5.h,
                            itemPadding: const EdgeInsets
                                .symmetric(
                                horizontal:
                                .5),
                            itemBuilder:
                                (context,
                                _) =>
                            const Icon(
                              Icons.star,
                              color:Color(0xffFFA500),
                            ),
                            onRatingUpdate:
                                (rating) {},
                            ignoreGestures:
                            true,
                            tapOnlyMode:
                            true,
                          ),
                          getHorSpace(.5.h),
                          Text(
                            '${(getResturantsController.allResturant.value!.data![widget.selectedIndex].averageRating ?? 5.0).toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 12.px,
                            ),
                          ),
                      Text(
                        ' (${(addReviewsController.getAllReviews.value!.data!.length)})',


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
                        Obx(()=>
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
                                InkWell(onTap: (){
                                  if(quantity.value>0){
                                    quantity.value--;

                                  }
                                },
                                  child: Text(
                                    '-',
                                    style: CustomTextStyles.buttonTextStyle.copyWith(
                                        color: const Color(
                                          0xff717171,
                                        ),
                                        fontSize: 17.px),
                                  ),
                                ),
                                Text(
                                  '${quantity.value}',
                                  style: CustomTextStyles.buttonTextStyle.copyWith(
                                      color: const Color(0xff717171), fontSize: 16.px),
                                ),
                                InkWell(onTap: (){

                                    quantity.value++;


                                },
                                  child: Text(
                                    '+',
                                    style: CustomTextStyles.buttonTextStyle.copyWith(
                                        color: const Color(
                                          0xff717171,
                                        ),
                                        fontSize: 17.px),
                                  ),
                                )
                              ],
                            ),
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
                          formattedDate.value ?? '16/02/2024',
                          style: CustomTextStyles.buttonTextStyle.copyWith(color: const Color(0xff717171)),
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
                      formattedTime!.value?? '08:00 PM',
                        style: CustomTextStyles.buttonTextStyle
                            .copyWith(color: const Color(0xff717171)),
                      ),
                    ),
                  ),
                  getVerSpace(5.7.h),
                 bookReservationController.isLoading.value==true?Center(child: CircularProgressIndicator(color: ConstantColors.greenColor,),): Align(alignment: Alignment.bottomCenter,
                    child: customElevatedButton(() {
                      log('This is tableNo: ${quantity.value}');
                      log('This is tableBook date: ${formattedDate.toString()}');
                      log('This is time: ${formattedTime.toString()}');
                      log('This is token: ${mySharedPreferanse.gettoken}');
                    if(quantity.value<=0){
                      customSnackBar(
                          'Sorry',
                          'Please enter the Table Number',
                          Colors.redAccent);
                    }else{
                      bookReservationController.bookReservation(resturantId:widget.restaurantId! ,
                          tableNo: quantity.value.toString() ,
                          date:"2024-04-15" ,
                          time: formattedTime!.value.toString(),
                          token: mySharedPreferanse.gettoken
                      );
                      // Get.to(()=>const ReservationSuccess());
                    }
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
      ),
    );
  }
}
