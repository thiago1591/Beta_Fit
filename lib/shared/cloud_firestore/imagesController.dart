import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debate_place_flutter/bottomNavigation/bottom_navigation.dart';
import 'package:debate_place_flutter/shared/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

class ImagesController {
//Faz o upload da imagem para o storage do firebase e cria uma URL de 
//acesso a imagem, que é passada para a função uploadImageURL
Future uploadImageFile(String path, context, UserModel user) async {
  try {                              
    firebase_storage.Reference ref = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('Thiago André')
        .child('${DateTime.now().toIso8601String()}');
    final result = await ref.putFile(File(path));
    String imgURL = await result.ref.getDownloadURL();
    print(imgURL);
    uploadImageURL(user.name, imgURL);
  } catch (e) {
    print(e);
  }

  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BottomNavigation(user: user)));
  }


//armazena a URL da imagem na coleção do user no cloud Firestore, 
//assim é mais facil de acessa-la pelo StreamBuilder
Future<void> uploadImageURL(userName, imageURL) {
return users
  .doc('$userName')
      .update({
        'images': FieldValue.arrayUnion(["$imageURL"])
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
  }

Future<List> getImages() async {
  var snapshot = await users.doc('Thiago André').get();
  List imagesList = snapshot.get(FieldPath(['images']));
  return imagesList;
}


Future<void> imageQttIncrement() {
  return FirebaseFirestore.instance.runTransaction((transaction) async {

  DocumentSnapshot snapshot = await transaction.get(users.doc('Thiago André'));

  if (!snapshot.exists) {
    throw Exception("User does not exist!");
  }

  dynamic data = snapshot.data();
  int newFollowerCount = data['images_qtt'] + 1;

  transaction.update(users.doc('Thiago André'), {'images_qtt': newFollowerCount});

  return newFollowerCount;
})
.then((value) => print("Follower count updated to $value"))
.catchError((error) => print("Failed to update user followers: $error"));
}
}