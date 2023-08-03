import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getx_mvvm_pattern/data/app_exceptions.dart';
import 'package:getx_mvvm_pattern/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOutException {
      throw RequestTimeOutException('');
    }
    // catch (e) {}
    return responseJson;
  }

  Future<dynamic> postApi(var data, String url) async {
    debugPrint("The Url is : ${url.toString()}");
    debugPrint("The Data is : ${data.toString()}");

    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(data))
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOutException {
      throw RequestTimeOutException('');
    }
    // catch (e) {}
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw InvalidUrlException;

      default:
        throw FetchDataException(response.statusCode.toString());
    }
  }
}
