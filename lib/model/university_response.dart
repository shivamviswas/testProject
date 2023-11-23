import 'dart:convert';

List<UniversityResponse> universityResponseFromJson(String str) => List<UniversityResponse>.from(json.decode(str).map((x) => UniversityResponse.fromJson(x)));

String universityResponseToJson(List<UniversityResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UniversityResponse {
  String country;
  dynamic stateProvince;
  List<String> webPages;
  String name;
  List<String> domains;
  String alphaTwoCode;

  UniversityResponse({
    required this.country,
    required this.stateProvince,
    required this.webPages,
    required this.name,
    required this.domains,
    required this.alphaTwoCode,
  });

  factory UniversityResponse.fromJson(Map<String, dynamic> json) => UniversityResponse(
    country: json["country"],
    stateProvince: json["state-province"],
    webPages: List<String>.from(json["web_pages"].map((x) => x)),
    name: json["name"],
    domains: List<String>.from(json["domains"].map((x) => x)),
    alphaTwoCode: json["alpha_two_code"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "state-province": stateProvince,
    "web_pages": List<dynamic>.from(webPages.map((x) => x)),
    "name": name,
    "domains": List<dynamic>.from(domains.map((x) => x)),
    "alpha_two_code": alphaTwoCode,
  };
}
