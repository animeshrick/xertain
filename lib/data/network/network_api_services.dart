import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../resources/components/popup_items.dart';
import '../../utils/app_log.dart';
import '../exception/app_exception.dart';
import '../request_builder.dart';
import 'base_api_service.dart';

class NetworkApiService extends BaseApiServices {
  var appLog = AppLog();

  ///  ------ [GET] api ------
  @override
  Future getGetApiResponse(String requestTag, String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url)); //.timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
      appLog.log("requestTag = $requestTag  ${DateTime.now()}");
      appLog.log("url = $url");
      appLog.log("responseJson = $responseJson");
    } on SocketException {
      throw FetchDataException("No internet connection");
    }

    return responseJson;
  }

  ///  ------ [POST] api ------
  @override
  Future getPostApiResponseV2(
      String requestTag, String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response =
          await post(Uri.parse(url), body: data, headers: apiHeaders());
      //.timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
      appLog.log("requestTag = $requestTag  ${DateTime.now()}");
      appLog.log("url = $url");
      appLog.log("data = ${jsonDecode(data)}");
      appLog.log("responseJson = $responseJson");
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }

  ///  ------ [POST] api- www-form-urlencoded ------

  @override
  Future getPostEncodedApiResponse(
    String requestTag,
    String url,
    Map body,
  ) async {
    dynamic responseJson;
    try {
      var parts = [];
      body.forEach((key, value) {
        parts.add('${Uri.encodeQueryComponent(key)}='
            '${Uri.encodeQueryComponent(value)}');
      });
      var formData = parts.join('&');
      Response response = await post(
        Uri.parse(url),
        body: formData,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
      ); //.timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
      appLog.log("url = $url  ${DateTime.now()}");
      appLog.log("$requestTag => $responseJson");
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }

  ///  ------ [POST] api- Multipart ------

  @override
  Future getPostMultipartApiResponse(String? requestTag, String? url,
      String? arrayName, String? image, String? imageFileName) async {
    dynamic respData;
    try {
      var request = http.MultipartRequest("POST", Uri.parse(url!));
      request.files.add(await http.MultipartFile.fromPath(
        arrayName!,
        image!,
        filename: imageFileName,
      ));
      var resp = await request.send();
      var responsed = await http.Response.fromStream(resp);
      final responseData = json.decode(responsed.body);
      respData = responseData;
      if (resp.statusCode == 200) {
        appLog.log(
            "${DateTime.now()}  $requestTag => ${resp.statusCode} ${resp.reasonPhrase}");
        appLog.log("url = $url");
        appLog.log("arrayName = $arrayName");
        appLog.log("image = $image");
        AppLog().log("responseData $responseData");
      } else {
        PopUpItems().toastMessage(
            "${resp.reasonPhrase} ${resp.statusCode}", Colors.red);
      }
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return respData;
  }

  /// ----------- handling response -----------
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      case 504:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            "Error in server with status code of: ${response.statusCode.toString()}");
    }
  }
}
