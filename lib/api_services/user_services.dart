import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:boli_app/api_services/base_url.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future postApiData(Map body, String endPoint) async {
    final url = Uri.parse(BaseUrl.url + endPoint);
    String jsonBody = json.encode(body);
    final enCoding = Encoding.getByName('utf-8');
    final headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token',
    };
    try {
      http.Response response = await http
          .post(url, headers: headers, body: jsonBody, encoding: enCoding)
          .timeout(
              const Duration(
                seconds: 30,
              ), onTimeout: () {
        throw TimeoutException('Connection TimeOut! please try again');
      });
      log('Response ${response.body}');
      log('Response ${response.statusCode}');
      return response;
      // if(response.statusCode==201){
      //
      //   return response.body;
      // }else{
      //   return null;
      // }
    } on TimeoutException catch(error) {
      log('TimeOut Occurred $error');
      return null;

    }on SocketException catch (error){
      log('Socket Error $error');
      return null;
    }
  }
  Future getApiData( String endPoint) async {
    final url = Uri.parse(BaseUrl.url + endPoint);
    log("api url is: ${url}");
    final headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token',
    };
    try {
      http.Response response = await http
          .get(url, headers: headers,)
          .timeout(
          const Duration(
            seconds: 30,
          ), onTimeout: () {
        throw TimeoutException('Connection TimeOut! please try again');
      });
      // if(response.statusCode==200){
      //   var data=jsonDecode(response.body);
      //   log('$data');
      //
      //   return response.body;
      // }else{
      //   return null;
      // }
      return response.body;
    } on TimeoutException catch(error) {
      log('TimeOut Occurred $error');
      return null;

    }on SocketException catch (error){
      log('Socket Error $error');
      return null;
    }
  }
  Future getApiDataByToken( String endPoint,token) async {
    final url = Uri.parse(BaseUrl.url + endPoint);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      http.Response response = await http
          .get(url, headers: headers,)
          .timeout(
          const Duration(
            seconds: 30,
          ), onTimeout: () {
        throw TimeoutException('Connection TimeOut! please try again');
      });
      if(response.statusCode==200){
        var data=jsonDecode(response.body);
        log('$data');

        return response.body;
      }else{
        return null;
      }
    } on TimeoutException catch(error) {
      log('TimeOut Occurred $error');
      return null;

    }on SocketException catch (error){
      log('Socket Error $error');
      return null;
    }
  }
  Future deleteApiDataByToken(Map body,String endPoint,token)async{
    final url=Uri.parse(BaseUrl.url+endPoint);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    String jsonBody = json.encode(body);
    final enCoding = Encoding.getByName('utf-8');
    try{
      http.Response response=await http.delete(
        url,
        headers: headers,
        body: jsonBody,
        encoding: enCoding
      ).timeout(const Duration(seconds: 30),
      onTimeout: () {
        throw TimeoutException('Connection TimeOut! please try again');
      },);
      if(response.statusCode==200){
        var data=jsonDecode(response.body);
        log('$data');

        return response.body;
      }else{
        return response.body;
      }

    }on TimeoutException catch(error) {
      log('TimeOut Occurred $error');
      return null;

    }on SocketException catch (error){
      log('Socket Error $error');
      return null;
    }
}
  Future updateApiData(Map body,String endPoint,)async{
    final url=Uri.parse(BaseUrl.url+endPoint);
    final headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token',
    };
    String jsonBody = json.encode(body);
    final enCoding = Encoding.getByName('utf-8');
    try{
      http.Response response=await http.put(
        url,
        headers: headers,
        body: jsonBody,
        encoding: enCoding
      ).timeout(const Duration(seconds: 30),
      onTimeout: () {
        throw TimeoutException('Connection TimeOut! please try again');
      },);
      if(response.statusCode==200){
        var data=jsonDecode(response.body);
        log('$data');

        return response.body;
      }else{
        return response.body;
      }

    }on TimeoutException catch(error) {
      log('TimeOut Occurred $error');
      return null;

    }on SocketException catch (error){
      log('Socket Error $error');
      return null;
    }
}
  Future postApiDataWithToken(Map body, String endPoint,String token) async {
    final url = Uri.parse(BaseUrl.url + endPoint);
    String jsonBody = json.encode(body);
    final enCoding = Encoding.getByName('utf-8');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      http.Response response = await http
          .post(url, headers: headers, body: jsonBody, encoding: enCoding)
          .timeout(
          const Duration(
            seconds: 30,
          ), onTimeout: () {
        throw TimeoutException('Connection TimeOut! please try again');
      });
      log('Response ${response.body}');
      log('Response ${response.statusCode}');
      return response;
      if(response.statusCode==201){

        return response.body;
      }else{
        return null;
      }
    } on TimeoutException catch(error) {
      log('TimeOut Occurred $error');
      return null;

    }on SocketException catch (error){
      log('Socket Error $error');
      return null;
    }
  }
}
