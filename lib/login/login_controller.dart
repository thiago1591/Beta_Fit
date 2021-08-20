import 'package:debate_place_flutter/shared/auth/auth_controller.dart';
import 'package:debate_place_flutter/shared/models/user_model.dart';
import 'package:debate_place_flutter/shared/services/services.dart';
import 'package:debate_place_flutter/shared/services/cloudController.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final name = response!.displayName;
      final firstName = Services().getFirstName(name!);
      final user = UserModel(
        id: response.id,
        name: name,
        firstName: firstName,
        profileImage: response.photoUrl,
        imagesQtt: 0,
      );
      authController.setUser(context, user);
      setUserCloud(user);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}