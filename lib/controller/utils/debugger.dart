import 'package:flutter/cupertino.dart';

class Debugger {

  static void debugConsole({String title = "", String message= ""}) {
    debugPrint("$title : $message");
  }

  static void debugTitle({required String title}) {
    debugPrint(title);
  }

  static void debugMessage({required String message}) {
    debugPrint(message);
  }
}