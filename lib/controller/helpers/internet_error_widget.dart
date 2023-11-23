import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:test_project/view/screens/home_screen.dart';

import '../../view/common/custom_button.dart';
import '../../view/common/font_manager.dart';
import '../../view/common/normal_text.dart';
import '../utils/app_colors.dart';
import '../utils/app_utils.dart';
import 'check_internet_connection.dart';

class InternetErrorWidget extends StatefulWidget {
  final bool ismaindart;

  const InternetErrorWidget({
    Key? key,
    required this.ismaindart,
  }) : super(key: key);

  @override
  State<InternetErrorWidget> createState() => _InternetErrorWidgetState();
}

class _InternetErrorWidgetState extends State<InternetErrorWidget> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  var isloading = false;

  Future<dynamic> updateConnectivity() async {
    if (_connectionStatus == ConnectivityResult.none) {
    } else if (widget.ismaindart == true) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Text("No Internet"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "",
                  ),
                ),
                Text(
                  "",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "",
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 50,
                      width: 120,
                      child: isloading == true
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            )
                          : CustomElevatedButton(
                              buttonText: NormalTextWidget(
                                "Try Again",
                                fontSize: Utility.isTablet ? 22 : 16,
                                fontWeight: AFontWight.bold,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                setState(() {
                                  isloading = true;
                                });
                                if (widget.ismaindart == true) {
                                  _connectionStatus = await _connectivity.checkConnectivity();
                                  await updateConnectivity();
                                } else {
                                  await InterNetworkService(
                                    context,
                                  ).checklive(_connectionStatus, false, false);
                                }
                                setState(() {
                                  isloading = false;
                                });
                              },
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
