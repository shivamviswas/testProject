//Implements validation functions sample example like email

import 'app_strings.dart';

class Validator {
  static String? validateEmail(value) {
    if (value.isEmpty) {
      return AuthenticationMessages.enterEmail;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return AuthenticationMessages.enterValidEmail;
    }
    return null;
  }

  String? validateEmp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }

    // Define the regular expression for the desired format
    RegExp format = RegExp(r'^[A-Z]{3}-\d{2}-\d{3}$');

    if (!format.hasMatch(value)) {
      return 'Invalid format. Expected format: MMW-02-010';
    }

    return null; // Return null if the value is valid
  }

  String? validateEmpCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }

    // Define the regular expression for the desired format
    RegExp format = RegExp(r'^[A-Z]{3}-\d{2}-\d{3}$');

    if (!format.hasMatch(value)) {
      return 'Invalid format. Expected format: MMW-02-010';
    }

    return null; // Return null if the value is valid
  }
}
