import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debate_place_flutter/shared/models/user_model.dart';

Future<void> setUserCloud(UserModel user) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
      return users
      .doc(user.name)
          .set({
            'name': user.name,
            'profileImage': user.profileImage, 
            'imagesQtt': user.imagesQtt 
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
}

Future<void> updateImageQtt(String user, qtt) {

    CollectionReference users = FirebaseFirestore.instance.collection('users');

          final imagesQtt = users.doc(user).get();
          print(imagesQtt);
         return users
          .doc(user)
          .update({
            'imagesQtt': qtt+1
          })
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to add user: $error"));
}

Future<void> readUsers(UserModel user) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
      return users
          .doc(user.name)
          .set({
            'name': user.name, 
            'profileImage': user.profileImage, 
            'imagesQtt': user.imagesQtt 
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
}
