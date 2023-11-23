import 'dart:convert';

import 'package:http/http.dart' show Response;

import '../helpers/exceptions.dart';
import '../utils/debugger.dart';

mixin HttpResponseHelper {
  var _errorMsg = "Something doesn\'t seem right. Please try again later.";

   parseHttpResponse(Response response, [String requestBody = ""]) {

    dynamic responseJson = _parseToJson(response.body.toString());



    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 201:
        return responseJson;
      case 400:
        throw BadRequestException(_errorMsg);
      case 401:
        throw BadRequestException(_errorMsg);
      case 403:
        throw UnauthorisedException(_errorMsg);
      case 404:
      case 409:
      case 418:
      case 500:
        throw FetchDataException(_errorMsg);
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  dynamic _parseToJson(String responseBody) {
    return json.decode(responseBody);
  }

  void _logResponse(Response response, String requestBody) {
    Debugger.debugTitle(title: '--------- Request Details---------');
    Debugger.debugConsole(title: 'url', message: response.request!.url.toString());
    Debugger.debugConsole(title: 'method', message: response.request!.method);
    Debugger.debugConsole(title: 'headers',message: response.request!.headers.toString());
    Debugger.debugConsole(title: 'body',message: 'requestBody');
    Debugger.debugTitle(title: '------------------');

    Debugger.debugTitle(title: '--------- Response Details---------');
    Debugger.debugConsole(title: 'status code',message: response.statusCode.toString());
    Debugger.debugConsole(title: 'reason',message: response.reasonPhrase.toString());
    Debugger.debugConsole(title: 'request url: ${response.request}');
    // log('response body: ${_parseToJson(response.body.toString())}');
    printWrapped('response body: ${response.body.toString()}');
    Debugger.debugTitle(title: '------------------');
  }
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

