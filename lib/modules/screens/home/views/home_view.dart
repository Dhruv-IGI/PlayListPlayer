//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

String? finalToken = '';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  //  void getRoute() async {
  //   await getValidationData().whenComplete(() async {
  //     if (finalToken == '') {
  //       return Get.toNamed(Routes.LOGIN);
  //     } else {
  //       return Get.toNamed(Routes.QUIZPAGE);
  //     }
  //   });
  // }
  //
  // Future getValidationData() async {
  //   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var obtainedToken = sharedPreferences.getString('token');
  //   finalToken = obtainedToken;
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading :Image.asset(
      //     'assets/images/logo.png',
      //     width: 300,
      //   ),
      //   title: const Text(
      //     'Skill Matrix',
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal : 30.0 , vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   'assets/images/logo.png',
                  //   width: 300,
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height *0.8,
              width: Get.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MaterialButton(
                      onPressed: () => Get.toNamed(Routes.REGISTRATION),
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text("Registration",
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () => Get.toNamed(Routes.LOGIN),
                      //onPressed: () => getRoute(),
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
