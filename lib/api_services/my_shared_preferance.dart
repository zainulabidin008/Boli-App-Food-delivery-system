import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferanse{
   var gettoken;
   RxString token = ''.obs;

  Future storeUserLoginToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      await pref.setString('token', token);
      log('The Token of user stored successfully: $token');
      return true;
    } catch (e) {
      log('Error storing token: $e');
      return false ;
      // Handle error, e.g., show error message to the user
    }
  }
  Future getUserLoginToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      gettoken= await pref.get('token');
      log('The Token of user stored successfully: $token');
      return token;
    } catch (e) {
      log('Error storing token: $e');
      return false;
      // Handle error, e.g., show error message to the use
    }
  }

}