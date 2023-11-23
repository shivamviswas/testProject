import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:test_project/model/university_response.dart';

import '../api_config/api_methods.dart';

class UniversityProvider with ChangeNotifier {
  final ApiMethods _apiMethods = ApiMethods();
   List<UniversityResponse> universityList=[];

  bool isLoading = false;

  Future<List<UniversityResponse>> getUniversityList({required String country}) async {
    setIsLoading(true);
    try {
      universityList = await _apiMethods.getUniversities(countryName: country);
      setIsLoading(false);
    } catch (error) {
      setIsLoading(false);
      rethrow;
    }
    setIsLoading(false);
    return universityList;
  }

  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }
}
