import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          height: 45,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.white),
            onPressed: () async {
              GoogleSignIn _googleSignIn = GoogleSignIn(
                scopes: [
                  'email',
                ],
              );
              try {
                  final response = await _googleSignIn.signIn();
                  print(response);
                  } catch (error) {
                    print(error);
                  }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Image.asset('assets/images/google-icon.png'),
                ),
                Text('Entrar com o Google',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
              ],
            ),
          )),
    );
  }
}
