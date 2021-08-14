import 'package:debate_place_flutter/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginButtonWidget extends StatefulWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  _LoginButtonWidgetState createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Container(
        height: 50,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(2),
                child: Image.asset('assets/images/google-icon.png', width: 35,),
              ),
              SizedBox(width: 5),
              Text('Entrar com o Google',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ],
          ),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ))),
          onPressed: () {
            controller.googleSignIn(context);
          },
        ),
      ),
    );
  }
}
