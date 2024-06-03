import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_services/user_services.dart';
import '../models/get_Review_Model.dart';
import '../utils/custom_snackbar.dart';

class AddReviewsController extends GetxController{
  final TextEditingController commentController=TextEditingController();
  Rxn<GetReviewModel> getAllReviews = Rxn<GetReviewModel>();
  var isLoading = false.obs;
  var loading = false.obs;

 Future addUserReviews({required String resturantId,required String text, required int Star,required String  token}) async {
    Map body = {
      "restaurantID": resturantId.toString(),
      "text": text.toString(),
      "stars": Star,
    };
    loading.value = true;
    await ApiServices()
        .postApiDataWithToken(body, 'api/customer/addReview',token)
        .then((value) {
      var jsonData = jsonDecode(value.body);
      if (value == null) {
        loading.value = false;
        customSnackBar('Sorry!', 'Something went wrong! please try again',
            Colors.redAccent);
      } else if (jsonData['message'] == "Review added successfully") {
        loading.value = false;

        customSnackBar(
            'Congratulation!', 'Review added successfully', Colors.white);
        commentController.clear();
        return true;

// Get.to(()=> AllReviews());
      } else if (jsonData["message"] == "An error occurred while adding the review.") {
        loading.value = false;
        customSnackBar(
            'Please Check!', 'An error occurred while adding the review.', Colors.redAccent);
      } else {
        loading.value = false;
        customSnackBar('Sorry!', 'Something went wrong! please try again',
            Colors.redAccent);
      }
    });
  }


  Future getResturantReview(String? resturantId) async {
   log("this is restureant id is: $resturantId");
    isLoading.value = true;
    await ApiServices().getApiData('api/customer/getReviews/$resturantId').then((value) {
      print("i am api data"+value);
      if (value != null) {
        getAllReviews.value = getReviewModelFromJson(value);

        isLoading.value = false;
      } else if(value==null) {
        getAllReviews.value=null;
        isLoading.value = false;
      }else{

        isLoading.value = false;
      }
    });
  }


}