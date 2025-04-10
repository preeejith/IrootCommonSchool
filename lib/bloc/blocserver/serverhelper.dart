import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iroots/bloc/bloclocalstorage/prefmanager.dart';

//meserverhelper
class ServerHelper {
  //stmary_
  //stpaul_
  //stthomas_
  //stmarywill_
  //nirmala_
  //payment
  //stmarypayment
  static String encrptypay = "8D5AF3DDC43C81BC8B34569E91E0BB32";
  static String decrptypay = "A97DA58D3926D14FF0F6623CF2D59BA1";
  static String merchentId = "656216";
  static String hashrequeskey = "e0019992722a79b898";
  static String merchPass = "f6fced3f";
  //payment

  static String myschoolauth = "stmarywill_";

  static String baseUrlOhyes =
      "https://stmaryswilliamnagarapi.lumensof.in/api/";
  // static const baseUrlOhyes =

  //MyQpadServer
  static const baseUrl = "https://stmaryswilliamnagarapi.lumensof.in/api/";
  static const imageUrl = "https://api.myqpad.com/file/get/";
  // static const baseUrl = "http://192.168.1.14:4000";
  // static const imageUrl = "http://192.168.1.14:4000/file/get/";

  // dev("https://staging.ohyesworld.com/"),
  // prod("https://live.ohyesworld.com/");

  static Future<dynamic> post(url, data) async {
    var token = await PrefManager.getToken();
    // final messaging = FirebaseMessaging.instance;

    // String devicetoken = await messaging.getToken() ?? "";

    // debugPrint('FirebaseToken: $token');

    // Helper.showLog(token + "ddd");
    Map? sendData = {};
    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }

    var body = json.encode(sendData);
    var response = await http.post(
      Uri.parse(baseUrl + url),
      headers: {"Content-Type": "application/json", "token": token ?? ""},
      body: body,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };

      return error;
    }
  }

  static Future<dynamic> put(url, data, accessToken) async {
    // var token = await PrefManager.getToken();

    Map? sendData = {};
    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }

    var body = json.encode(sendData);
    var response = await http.put(
      Uri.parse(baseUrlOhyes + url),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${accessToken ?? ''}',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };

      return error;
    }
  }

  static Future<dynamic> ohYespost(url, data, accessToken) async {
    Map? sendData = {};
    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }
    var body = json.encode(sendData);
    log(body);
    var response = await http.post(
      Uri.parse(baseUrlOhyes + url),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${accessToken ?? ''}',
      },
      body: body,
    );
    log(baseUrlOhyes + url);
    if (response.statusCode == 200) {
      log(response.body);
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };

      return error;
    }
  }

  static Future<dynamic> get(url) async {
    var token = await PrefManager.getToken();

    // Helper.showLog(token);
    var response = await http.get(Uri.parse(baseUrl + url), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${token ?? ''}',
    });
    log(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };
      return error;
    }
  }

  static Future<dynamic> getohYes(url) async {
    var token = await PrefManager.getToken();

    debugPrint(token);
    debugPrint(url);
    var response = await http.get(Uri.parse(baseUrlOhyes + url), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${token ?? ''}',
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };
      return error;
    }
  }
}
