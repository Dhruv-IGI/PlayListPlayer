import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'package:udemyplayer/routes/app_pages.dart';
import 'package:udemyplayer/themes/theme.dart';


Future<void> main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(Sizer(
    builder : (context, orientation, deviceType) =>
        GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Skill Matrix",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: getBlackWhiteTheme(),
        ),
  ));
}

