import 'package:boli_app/constants/constant_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api_services/my_shared_preferance.dart';
import '../../utils/bottomnavigationBar.dart';
import '../onboard_screens/onboard_screen1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
final MySharedPreferanse mySharedPreferanse=MySharedPreferanse();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    mySharedPreferanse. getUserLoginToken();

    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.to(() => mySharedPreferanse.gettoken!=null? const BottomNavBar(
      commingIndex: 0,
    ) :const OnBoardScreenFirst()));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text('BOLI', style: CustomTextStyles.splashHeadingStyle)),
    );
  }
}
