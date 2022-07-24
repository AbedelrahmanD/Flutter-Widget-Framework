// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Connector extends GetConnect {
  static const int connectionTimeout=15;
  List<int> successStatusCodes = [200, 201];

  sendRequest({required String url, dynamic body}) async {
    dynamic response = {};
    if(!(await isConnectedToNetwork())){
      response.statusCode=-1;
      response.statusText="Not connected to network";
      return response;
    }
    dynamic options = {};
    if (body == null) {
      options["method"] = "GET";
      options["body"] = {};
      options["contentType"] = "";
    } else {
      options["method"] = "POST";
      options["body"] = jsonEncode(body);
      options["contentType"] = "application/json";
    }
    response = await request(url, options["method"],
        body: options["body"], contentType: options["contentType"]).timeout(
        const Duration(seconds: connectionTimeout),
        onTimeout: () => const Response(statusText: "Timeout", statusCode: 408));
    debugPrint(
        "url============= $url");
        debugPrint(
        "isSuccessStatusCode============= ${isSuccess(response.statusCode)}");
    debugPrint("statusCode============= ${response.statusCode}");
    debugPrint("body============= ${response.body}");

    return response;
  }

  isSuccess(statusCode) {
    return successStatusCodes.contains(statusCode);
  }

  isConnectedToNetwork()async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    return !(connectivityResult==ConnectivityResult.none);

  }
}
