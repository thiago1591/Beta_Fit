import 'package:beta_fit/shared/auth/auth_controller.dart';
import 'package:beta_fit/shared/controllers/users_controller.dart';
import 'package:beta_fit/shared/models/user_model.dart';
import 'package:beta_fit/shared/services/get_first_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  final authController = AuthController();
  final usersController = UsersController();
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
      usersController.addUser(user);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}