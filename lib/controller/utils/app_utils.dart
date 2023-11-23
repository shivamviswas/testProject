import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

enum DeviceType { phone, tablet }

class Utility {
  static bool isTablet = getDeviceType() == DeviceType.tablet;
  static bool isIos = Platform.isIOS ? true : false;

  static DeviceType getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550 ? DeviceType.phone : DeviceType.tablet;
  }

  static Future<String> getDeviceModel() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (isIos) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine;
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    }
  }

  static Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (isIos) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    }
  }

  static Future<String?> getDeviceOsVersion() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (isIos) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.systemVersion;
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.version.release;
    }
  }

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void showSnackBar(BuildContext context, String? message) {
    if (message != null) {
      final snackBar = SnackBar(
        content: Text(message.isEmpty ? "Something went wrong!!!" : message),
        duration: const Duration(seconds: 2),


      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

