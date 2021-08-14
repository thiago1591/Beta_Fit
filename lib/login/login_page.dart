import 'package:debate_place_flutter/core/app_text_styles.dart';
import 'package:debate_place_flutter/login/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login-background2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset('assets/images/logo2.png'),
                SizedBox(
                  height: 20,
                ),
                Text('Por uma comunidade',
                    style: AppTextStyles.loginTitle,
                    textAlign: TextAlign.center),
                Text('dev mais saudável',
                    style: AppTextStyles.loginTitle,
                    textAlign: TextAlign.center),
                Expanded(flex: 1,child: Text(''),),  
                LoginButtonWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
