import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/controller/providers/university_provider.dart';
import 'package:test_project/controller/utils/app_colors.dart';
import 'package:test_project/view/common/normal_text.dart';
import 'package:test_project/view/screens/widgets/university_details_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UniversityProvider>(context, listen: false).getUniversityList(country: "United States");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UniversityProvider>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          title: const NormalTextWidget(
            "Universities",
            color: AppColors.white,
            fontSize: 24,
          ),
        ),
        body: value.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : value.universityList.isEmpty
                ? Center(
                    child: InkWell(
                    onTap: () {
                      value.getUniversityList(country: "United States");
                    },
                    child: const NormalTextWidget("No data found."),
                  ))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    shrinkWrap: true,
                    itemBuilder: (con, index) {
                      return UniversityDetailTile(value.universityList[index]);
                    },
                    itemCount: value.universityList.length),
      );
    });
  }
}
