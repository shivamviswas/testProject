import 'package:flutter/material.dart';
import 'package:test_project/controller/utils/app_colors.dart';
import 'package:test_project/model/university_response.dart';
import 'package:test_project/view/common/normal_text.dart';

class UniversityDetailTile extends StatelessWidget {
  final UniversityResponse university;
  const UniversityDetailTile(this.university, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Column(
        children: [
          Details(
            title: "Domain",
            value: university.domains.join(","),
          ),
          Details(
            title: "Alpha Code",
            value: university.alphaTwoCode.toString(),
          ),
          Details(
            title: "State Province",
            value: university.stateProvince.toString(),
          ),
          Details(
            title: "Name",
            value: university.name,
          ),
          Details(
            title: "Web pages",
            value: university.webPages.join(","),
          ),
        ],
      ),
    );
  }
}

class Details extends StatelessWidget {
  final String title;
  final String value;

  const Details({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: NormalTextWidget(title, textAlign: TextAlign.start),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: NormalTextWidget(":"),
        ),
        Expanded(
          flex: 3,
          child: NormalTextWidget(value, textAlign: TextAlign.start),
        )
      ],
    );
  }
}
