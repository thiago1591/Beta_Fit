import 'package:beta_fit/bottomNavigation/bottom_navigation.dart';
import 'package:beta_fit/login/login_page.dart';
import 'package:beta_fit/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigation(user:user)));
    } else {
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage())
      );
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance =  await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance =  await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds:2));
    if(instance.containsKey("user")) {
          final json = instance.get("user") as String;
    setUser(context, UserModel.fromJson(json));
    return;
    } else {
      setUser(context, null);
    }

    return;
  }
}