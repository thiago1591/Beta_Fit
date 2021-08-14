import 'package:debate_place_flutter/bottomNavigation/bottom_navigation.dart';
import 'package:debate_place_flutter/login/login_page.dart';
import 'package:flutter/material.dart';

class AuthController {
  var _isAuthenticated = false;
  var _user;

  get user => _user;

  void setUser(BuildContext context, var user) {
    if (user != null) {
      _user = user;
      _isAuthenticated = true;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigation()));
    } else {
      _isAuthenticated = false;
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage())
      );
    }
  }
}