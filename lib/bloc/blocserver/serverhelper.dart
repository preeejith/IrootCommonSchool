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
  static String encrptypay = "F7F04ECA0B0A8C00C14620750BF4FCDD";
  static String decrptypay = "E074A2C130FC4FF676932DB3F8ABAC9F";
  static String merchentId = "628856";
  static String hashrequeskey = "de51c9a388700add01";
  static String merchPass = "62915a61";
  //payment

  static String myschoolauth = "stmary_";

  static String baseUrlOhyes = "https://stmarysapi.lumensof.in/api/";
  // static const baseUrlOhyes =

  //MyQpadServer
  static const baseUrl = "https://stmarysapi.lumensof.in/api/";
  static const imageUrl = "https://api.myqpad.com/file/get/";
  // static const baseUrl = "http://192.168.1.14:4000";
  // static const imageUrl = "http://192.168.1.14:4000/file/get/";

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
