
import 'dart:math';

import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../api_services/my_shared_preferance.dart';
import '../../controllers/add_reviews_controller.dart';
import '../../controllers/get_resturants_controller.dart';
import '../../ui_components/custom_widget.dart';
import '../../utils/custom_snackbar.dart';
import 'all_reviews.dart';

class RateResturant extends StatefulWidget {
  final String? resturantId;
  final int? restaurantIndex;
   const RateResturant({super.key,this .resturantId,this.restaurantIndex});

  @override
  State<RateResturant> createState() => _RateResturantState();
}

class _RateResturantState extends State<RateResturant> {
  final AddReviewsController addReviewsController=Get.put(AddReviewsController());
  final MySharedPreferanse mySharedPreferanse=MySharedPreferanse();
  final GetResturantsController getResturantsController =
  Get.put(GetResturantsController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySharedPreferanse.getUserLoginToken();
    addReviewsController.getResturantReview(widget.resturantId);
    print('This is RestaurantId ${widget.resturantId}');

  }
  @override
  Widget build(BuildContext context) {

    RxInt totalRating=0.obs;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_sharp,
                size: 14.px, color: const Color(0xff444444))),
        title: Text(
          'Rate Restaurants',
          style: TextStyle(
              fontSize: 14.px,
              fontWeight: FontWeight.w600,
              fontFamily: 'segoeui',
              color: const Color(0xff444444)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.4.h),
          child:
          Obx(()=>
      addReviewsController.loading.value==true||addReviewsController.isLoading.value==true?Center(child: CircularProgressIndicator(color: ConstantColors.greenColor,)):  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Reviews',
                    style: TextStyle(
                        fontSize: 14.px,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'segoeui',
                        color: const Color(0xff444444)),
                  ),
                  TextSpan(
                    text: ' (${addReviewsController.getAllReviews.value!.data!.length})',
                    style: TextStyle(
                        fontSize: 14.px,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'segoeui',
                        color: const Color(0xff444444)),
                  )
                ])),
          addReviewsController.getAllReviews.value!.data!.length==0 ?

          const Center(child: Text('There are No Reviews Available')):

                ListView.builder(
                  shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                  itemCount:min(05, addReviewsController.getAllReviews.value!.data!.length),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(vertical: 1.2.h),
                      child: Container(padding: EdgeInsets.all(1.h),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RatingBar.builder(
                              initialRating: addReviewsController.getAllReviews.value!.data![index].stars!.toDouble(),
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 3.2.h,
                              itemPadding: const EdgeInsets.symmetric(horizontal: .5),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Color(0xffFFA500),
                              ),
                              onRatingUpdate: (rating) {
                              },ignoreGestures: true,
                              tapOnlyMode: true,
                            ),
                            Text(
                              addReviewsController.getAllReviews.value!.data![index].text??'Nyce',
                              style: TextStyle(
                                  fontSize: 14.px,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'segoeui',
                                  color: const Color(0xff444444)),
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${addReviewsController.getAllReviews.value!.data![index].customer!.name}',
                                  style: CustomTextStyles.textFieldStyle.copyWith(color: const Color(0xff92847B)),
                                ),
                                Text(
                                  '${addReviewsController.getAllReviews.value!.data![index].timeAgo}',
                                  style: CustomTextStyles.textFieldStyle.copyWith(color: const Color(0xff92847B)),
                                ),

                              ],
                            ),




                          ],),
                      ),
                    );
                  },
                ),
                getVerSpace(1.2.h),
                addReviewsController.getAllReviews.value!.data!.length<=5?const SizedBox.shrink():  GestureDetector(onTap: (){
                  Get.to(()=>  AllReviews(resturantId: widget.resturantId,));
                  addReviewsController.getResturantReview(widget.resturantId);

                },
                  child: Text(
                    'Show older reviews ...',
                    style: TextStyle(
                        fontSize: 16.px,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'segoeui',
                        color: ConstantColors.greenColor),
                  ),
                ),
                getVerSpace(2.4.h),
                Divider(color: ConstantColors.textFieldGrey,thickness: 2,),
                getVerSpace(1.2.h),
                Text(
                  'Add your rating and review!',
                  style: TextStyle(
                      fontSize: 16.px,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'segoeui',
                      color: const Color(0xff444444)),
                ),
                getVerSpace(1.2.h),
                RatingBar.builder(
                  initialRating: 0.0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 3.2.h,
                  itemPadding: const EdgeInsets.symmetric(horizontal: .5),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color:Color(0xffFFA500),
                  ),
                  onRatingUpdate: (rating) {
                    totalRating.value=(rating).round();
                  },
                  tapOnlyMode: true,
                ),
                getVerSpace(.8.h),
                Text(
                  'Tap to add your rating',
                  style: TextStyle(
                      fontSize: 14.px,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'segoeui',
                      color: const Color(0xff92847B)),
                ),
                getVerSpace(.8.h),
                    Container(alignment: Alignment.center,
            height: 8.9.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
                    child: TextField(
                    cursorHeight: 2.h,

              controller:addReviewsController. commentController,
              style: TextStyle(fontSize: 12.px, color: ConstantColors.simpleTextColor),
              cursorColor: ConstantColors.greenColor,
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 1.h), // Adjust vertical padding
              isCollapsed: true,
              border: InputBorder.none,
              fillColor: Colors.white,
                hintText: 'Add your review ...',
                hintStyle: CustomTextStyles.textFieldStyle


                    )




              )),
              getVerSpace(1.5.h),
                addReviewsController.loading.value==true?
                Align(alignment: Alignment.bottomLeft,
                    child: CircularProgressIndicator(color: ConstantColors.greenColor,)):
                customElevatedButton(() {



               if(mySharedPreferanse.gettoken!=null&&addReviewsController.commentController.text.isNotEmpty){
                 addReviewsController.addUserReviews(resturantId:widget.resturantId.toString(),
                     text:addReviewsController.commentController.text ,
                     Star:totalRating.value ,
                     token:mySharedPreferanse.gettoken ).then((value) {

                       if(value==true){
                         addReviewsController.getResturantReview(widget.resturantId);
                       }else{


                       }
                 });



               }else{
                 customSnackBar('Sorry!', 'Something went wrong! please try again',
                     Colors.redAccent);
               }
                },
                    tittle: 'Submit review',
                    height: 3.5.h,
                    width: 10.9.h,
                    tittleColor:Colors.white ,
                    borColor:ConstantColors.greenColor ,
                    backColor: ConstantColors.greenColor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
