import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/add_reviews_controller.dart';

class AllReviews extends StatefulWidget {
  final String? resturantId;
  const AllReviews({super.key,this.resturantId});

  @override
  State<AllReviews> createState() => _AllReviewsState();
}

class _AllReviewsState extends State<AllReviews> {
  final AddReviewsController addReviewsController=Get.put(AddReviewsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addReviewsController.getResturantReview(widget.resturantId);
  }
  @override
  Widget build(BuildContext context) {
    final AddReviewsController addReviewsController=Get.put(AddReviewsController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_sharp,
                size: 14.px, color: const Color(0xff444444))),
        title: Text(
          'All Reviews ...',
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
          child: Obx(()=>
             Column(
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
                        text: ' (${addReviewsController.getAllReviews.value!.data!.length!})',
                        style: TextStyle(
                            fontSize: 14.px,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'segoeui',
                            color: const Color(0xff444444)),
                      )
                    ])),
                addReviewsController.isLoading.value==true?Center(child: CircularProgressIndicator(color: ConstantColors.greenColor,),):
                ListView.builder(
                  shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                  itemCount: addReviewsController.getAllReviews.value!.data!.length,
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}
