import 'package:boli_app/utils/bottomnavigationBar.dart';
import 'package:boli_app/view/splashScreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, Orientation, ScreenType) {
      return const GetMaterialApp(
          title: 'Boli App',
          debugShowCheckedModeBanner: false,
          home: SplashScreen());
    });
  }
}
