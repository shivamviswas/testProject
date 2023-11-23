import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'package:test_project/model/university_response.dart';

import '../helpers/exceptions.dart';
import 'api_config.dart';
import 'api_constant.dart';
import 'api_headers_constants.dart';
import 'api_response_handler.dart';

class ApiMethods with HttpResponseHelper {
  //Initiate all the api methods GET, POST, PUT, DELETE
  final Client _http = Client();

  static final _baseUrl = ApiConfig.serverUrl;
  static final _apiKey = ApiConfig.serverKey;

  Map<String, String> get _apiHeaders {
    return {
      ApiHeadersConstant.xApiKey: _apiKey,
      ApiHeadersConstant.xDeviceId: "1234567890", // device id from utils method
      ApiHeadersConstant.xOs: "Android", // Either android or ios
      ApiHeadersConstant.xOsVersion: "13", // Os Version for android and ios
      ApiHeadersConstant.contentType: ApiHeadersConstant.contentTypeValue,
    };
  }

  ///send Otp
  Future<List<UniversityResponse>> getUniversities({required String countryName}) async {
    try {
      var params = {
        ApiConstant.country: countryName,
      };
      var url =Uri.parse("$_baseUrl/${ApiConstant.search}").replace(queryParameters: params);

      if (kDebugMode) {
        print("Url : $url");
      }

      final response = await _http.get(
        url,
      );
      List<UniversityResponse> list = universityResponseFromJson(response.body.toString());

      return list;
    } on SocketException catch (error) {
      if (kDebugMode) {
        print("Socket exception $error");
      }
      throw InternetException();
    } catch (error) {
      if (kDebugMode) {
        print("Exception $error");
      }
      if (error.toString().contains("XMLHttpRequest")) {
        throw InternetException();
      } else {
        rethrow;
      }
    }
  }
}
