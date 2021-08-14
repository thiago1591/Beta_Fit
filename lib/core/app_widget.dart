import 'package:debate_place_flutter/bottomNavigation/bottom_navigation.dart';
import 'package:debate_place_flutter/congratulation/congratulation_page.dart';
import 'package:debate_place_flutter/home/home_page.dart';
import 'package:debate_place_flutter/login/login_page.dart';
import 'package:debate_place_flutter/ranking/ranking_page.dart';
import 'package:debate_place_flutter/splash/splash_page.dart';
import 'package:debate_place_flutter/upload_image/upload_image_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beta_Fit',
      home: LoginPage(),
    );
  }
}