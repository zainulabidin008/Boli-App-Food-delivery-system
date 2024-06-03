import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_services/user_services.dart';
import '../models/get_Reservation_Model.dart';
import '../utils/custom_snackbar.dart';

class BookReservationController extends GetxController{
  var isLoading = false.obs;
  Rxn<GetReservationModel> allReservation = Rxn<GetReservationModel>();
  var loading = false.obs;
  Future bookReservation({required String resturantId,required String tableNo, required String date,required String time,required String  token}) async {
    Map body = {
      "restaurant": resturantId.toString(),
      "tableFor": tableNo.toString(),
      "date": date.toString(),
      "time": time.toString(),
    };
    isLoading.value = true;
    await ApiServices()
        .postApiDataWithToken(body, 'api/customer/makeReservation',token)
        .then((value) {
      var jsonData = jsonDecode(value.body);
      if (value == null) {
        isLoading.value = false;
        customSnackBar('Sorry!', 'Something went wrong! please try again',
            Colors.redAccent);
      } else if (jsonData['message'] == "Reservation added successfully") {
        isLoading.value = false;

        customSnackBar(
            'Congratulation!', 'Reservation added successfully', Colors.white);
        return true;

      } else if (jsonData["message"] == "An error occurred while adding the reservation.") {
        isLoading.value = false;
        customSnackBar(
            'Please Check!', 'An error occurred while Booking the Reservation.', Colors.redAccent);
      } else {
        isLoading.value = false;
        customSnackBar('Sorry!', 'Something went wrong! please try again',
            Colors.redAccent);
      }
    });
  }
  Future getReservation(String token) async {
    isLoading.value = true;
    await ApiServices().getApiDataByToken('api/customer/getReservations?status=upcoming', token).then((value) {
      if (value != null) {
        allReservation.value = getReservationModelFromJson(value);

        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    });
  }
  Future<bool> cancelReservation(String? resturantId, String? tableNo, String? date, String? time, String? token, String? reservationId) async {
    Map<String, String> body = {
      "restaurant": resturantId.toString(),
      "tableFor": tableNo.toString(),
      "date": date.toString(),
      "time": time.toString(),
    };

    isLoading.value = true;

    try {
      var value = await ApiServices().deleteApiDataByToken(
        body,
        'api/customer/cancelReservation/$reservationId',
        token!,
      );

      var jsonData = jsonDecode(value);

      if (jsonData['message'] == "Reservation canceled successfully.") {
        isLoading.value = false;
        customSnackBar(
          'Congratulation!',
          'Reservation canceled successfully.',
          Colors.white,
        );
        Get.back();
        return true;
      } else if (jsonData["message"] == "Reservation not found or does not belong to you.") {
        isLoading.value = false;
        customSnackBar(
          'Please Check!',
          '${jsonData["message"]}',
          Colors.redAccent,
        );
      } else {
        isLoading.value = false;
        customSnackBar(
          'Sorry!',
          'Something went wrong! Please try again',
          Colors.redAccent,
        );
      }
    } catch (e) {
      isLoading.value = false;
      customSnackBar(
        'Error!',
        'An error occurred while canceling the reservation.',
        Colors.redAccent,
      );
    }

    return false;
  }


}