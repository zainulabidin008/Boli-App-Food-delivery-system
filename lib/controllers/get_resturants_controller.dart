

import 'dart:developer';

import 'package:boli_app/api_services/user_services.dart';
import 'package:get/get.dart';

import '../models/Resturant_model.dart';
import '../models/get_Menue_OfRestaurant.dart';

class GetResturantsController extends GetxController {
  Rxn<ResturantModel> allResturant = Rxn<ResturantModel>();
  Rxn<ResturantModel> allResturantsearch = Rxn<ResturantModel>();
  RxList temList=[].obs;
  Rxn<GetMenueOfRestaurantModel> menueResturant = Rxn<GetMenueOfRestaurantModel>();
  var isLoading = false.obs;
  Future getResturants() async {
    isLoading.value = true;
    await ApiServices().getApiData('api/customer/getRestaurants').then((value) {
      if (value != null) {
        allResturant.value = resturantModelFromJson(value);
        allResturantsearch.value = resturantModelFromJson(value);
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    });
  }
// Define RxList variable to hold search results
  RxList<Datum> searchResults = <Datum>[].obs;

// Function to search restaurants by name
  void searchRestaurantsByName(String query) {
    // Clear previous search results
    searchResults.clear();

    if (allResturant.value != null && allResturant.value!.data != null) {
      List<Datum> results = [];
      allResturant.value!.data!.forEach((restaurant) {
        if (restaurant.name!.toLowerCase().contains(query.toLowerCase())) {
         results.add(restaurant);
        }
      });

      // Assign the search results to the RxList
      searchResults.assignAll(results);

      // Log the contents of the searchResults list
      log('Search results for query "$query": $searchResults');
    }
  }




  getResturantsMenue(String restaurantId,token) async {
    isLoading.value = true;
    await ApiServices().getApiDataByToken('api/customer/getCategories/$restaurantId', token).then((value) {
      if (value != null) {
        menueResturant.value = getMenueOfRestaurantModelFromJson(value);

        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    });
  }
}
