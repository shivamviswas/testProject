
import 'package:test_project/controller/utils/debugger.dart';

class SendOtpResponse {
  Data? data;
  String? timeStamp;
  bool? error;
  String? message;
  String? type;
  int? responseCode;
  String? httpStatus;

  SendOtpResponse(
      {this.data,
        this.timeStamp,
        this.error,
        this.message,
        this.type,
        this.responseCode,
        this.httpStatus});

  SendOtpResponse.fromJson(Map<String, dynamic> json) {
    try{
      data = json['data'] != null ? Data.fromJson(json['data']) : null;
      timeStamp = json['timeStamp'];
      error = json['error'];
      message = json['message'];
      type = json['type'];
      responseCode = json['responseCode'];
      httpStatus = json['httpStatus'];
    }catch(e,stacktrace) {
      Debugger.debugConsole(title: "SendOtp", message: "Exception ${stacktrace.toString()}");
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['timeStamp'] = timeStamp;
    data['error'] = error;
    data['message'] = message;
    data['type'] = type;
    data['responseCode'] = responseCode;
    data['httpStatus'] = httpStatus;
    return data;
  }
}

class Data {
  String? phone;
  bool? resend;
  int? resendTime;
  int? lockTime;
  String? type;

  Data({this.phone, this.resend, this.resendTime, this.lockTime, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    resend = json['resend'];
    resendTime = json['resendTime'];
    lockTime = json['lockTime'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['resend'] = resend;
    data['resendTime'] = resendTime;
    data['lockTime'] = lockTime;
    data['type'] = type;
    return data;
  }
}