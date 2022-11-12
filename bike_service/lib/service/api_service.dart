// ignore_for_file: missing_return, unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:flutter_complete_guide/models/customer.dart';
import 'package:flutter_complete_guide/models/store.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String CustomerURl = "http://52.73.161.142/api/Customer";
  final String StoreURL = "http://54.211.24.168/api/Store";

  Future<Map<String, dynamic>> fetchPost() async {
    print('feg');
    final response = await post(
      Uri.parse("http://54.211.24.168/api/LoginWithFirebase/login"),
      headers: {
        HttpHeaders.authorizationHeader:
            "eyJhbGciOiJSUzI1NiIsImtpZCI6ImQ3YjE5MTI0MGZjZmYzMDdkYzQ3NTg1OWEyYmUzNzgzZGMxYWY4OWYiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYmlrZS1zZXJ2aWNlLWM2MDJkIiwiYXVkIjoiYmlrZS1zZXJ2aWNlLWM2MDJkIiwiYXV0aF90aW1lIjoxNjY4MjA5Nzg3LCJ1c2VyX2lkIjoiV0xHS3c3dXhBMFVyOEtyOUZ5WDNXaE5yRHF2MSIsInN1YiI6IldMR0t3N3V4QTBVcjhLcjlGeVgzV2hOckRxdjEiLCJpYXQiOjE2NjgyMDk3ODcsImV4cCI6MTY2ODIxMzM4NywiZW1haWwiOiJ0aXBoYTMxM0BnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZW1haWwiOlsidGlwaGEzMTNAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.o7dwfZc7ZMbWhEdaPyZLNoFXSO_dYUwaKRUgVcpT3lS0tXWtTjxdcE7jXZ1WsqdfEGqQK5_qxQHuBY4ApJ0D2Ys7pS7uPgdWMN-GRt2Fia0wDJmWi2AHIBGL8__JpocBOZg3JQLi-nTR-oPWM9UCghntHd_JbBYzmAIiDVMbMUHUWTMV34s5j-FJrX3DuZfztZpz0SrDRDiEKVwmVZN9X0b1bzEvqTQfu0pFzEyPN4c254zvXBAfvfSq03uV_yWA-TYvLBge6WlKo-Zuf5nTkiNu8MHo6jHQVagiT5Udt7__nLHCJsER-Ns7QcOxXHWO425fab3N6S4jGWc82SepLw",
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final responseJson = json.decode(response.body);
    print("Result: " + responseJson);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(
        'token',
        responseJson[
            'eyJhbGciOiJSUzI1NiIsImtpZCI6ImQ3YjE5MTI0MGZjZmYzMDdkYzQ3NTg1OWEyYmUzNzgzZGMxYWY4OWYiLCJ0eXAiOiJKV1QifQ']);
    print("Token:" + prefs.getString("token"));
    return responseJson;
  }

  Future<List<Customer>> getAllCustomer() async {
    Response res = await get(Uri.parse(CustomerURl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Customer> customer =
          body.map((dynamic item) => Customer.fromJson(item)).toList();
      return customer;
    } else {
      throw "Failed to load customer list";
    }
  }

  Future<Customer> getCustomerById(String id) async {
    final Response res = await get(Uri.parse('$CustomerURl/$id'));

    if (res.statusCode == 200) {
      return Customer.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

  Future<Customer> createCustomer(Customer customer) async {
    Map data = {
      'name': customer.name,
      'phoneNumber': customer.phoneNumber,
      'email': customer.email
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    print("check token:" + token);
    print("data:" + data.toString());
    final Response res = await post(
      Uri.parse("http://54.211.24.168/api/Customer/add-customer"),
      headers: <String, String>{
        HttpHeaders.authorizationHeader: token,
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(data),
    );
    print("check res code:" + res.statusCode.toString());
    if (res.statusCode == 200) {
      return Customer.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  Future<Customer> updateCustomer(Customer customer) async {
    Map data = {
      'name': customer.name,
      'phoneNumber': customer.phoneNumber,
      'email': customer.email
    };

    final Response res = await put(
      Uri.parse(CustomerURl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (res.statusCode == 200) {
      return Customer.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  Future<void> deleteCustomer(String id) async {
    Response res = await delete(Uri.parse('$CustomerURl/$id'));

    if (res.statusCode == 200) {
      print("customer delete");
    } else {
      throw "Fail to delete this customer";
    }
  }

  Future<List<Store>> getAllStore() async {
    Response res = await get(Uri.parse('$StoreURL/get-all-store'));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Store> store =
          body.map((dynamic item) => Store.fromJson(item)).toList();
      return store;
    } else {
      throw "Fail to load Store list";
    }
  }

  Future<Store> getStoreById(String id) async {
    final Response res = await get(Uri.parse('$StoreURL/$id'));

    if (res.statusCode == 200) {
      return Store.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

  Future<Store> getStoreByName(String name) async {
    final Response res = await get(Uri.parse('$StoreURL/search-store/$name'));

    if (res.statusCode == 200) {
      return Store.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }
}
