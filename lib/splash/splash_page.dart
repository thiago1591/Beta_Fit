import 'package:beta_fit/core/app_text_styles.dart';
import 'package:beta_fit/shared/auth/auth_controller.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/texture.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            Padding(padding: EdgeInsets.all(25),
            child: Text('Por uma comunidade dev mais saudável',style: AppTextStyles.splashTitle,textAlign: TextAlign.center),)
        ],) 
      ),
    );
  }
}