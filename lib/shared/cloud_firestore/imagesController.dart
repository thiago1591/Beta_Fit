import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debate_place_flutter/bottomNavigation/bottom_navigation.dart';
import 'package:debate_place_flutter/congratulation/congratulation_page.dart';
import 'package:debate_place_flutter/shared/models/user_model.dart';
import 'package:debate_place_flutter/upload_image/widgets/loading_widget.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

class ImagesController {
//Faz o upload da imagem para o storage do firebase e cria uma URL de 
//acesso a imagem, que é passada para a função uploadImageURL
Future uploadImageFile(String path, context, UserModel user) async {
  
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LoadingWidget()));
  try {                              
    firebase_storage.Reference ref = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('${user.name}')
        .child('${DateTime.now().toIso8601String()}');
    final result = await ref.putFile(File(path));
    String imgURL = await result.ref.getDownloadURL();
    print(imgURL);
    uploadImageURL(user, imgURL, context);
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
Future<void> uploadImageURL(UserModel user, imageURL, context) {
return users
  .doc('${user.name}')
      .update({
        'images': FieldValue.arrayUnion(["$imageURL"])
      })
      .then((value) => imageQttIncrement(user, context))
      .catchError((error) => print("Ocorreu um erro ao inserir a URL da imagem no banco: $error"));
  }

Future<List> getImages(userName) async {
  var snapshot = await users.doc('$userName').get();
  List imagesList = snapshot.get(FieldPath(['images']));
  imagesList = List.from(imagesList.reversed);
  return imagesList;
}


Future<void> imageQttIncrement(UserModel user, context) {
  return FirebaseFirestore.instance.runTransaction((transaction) async {

  DocumentSnapshot snapshot = await transaction.get(users.doc('${user.name}'));

  if (!snapshot.exists) {
    throw Exception("Não foi possível obter informações do usuário");
  }

  dynamic data = snapshot.data();
  int newFollowerCount = data['imagesQtt'] + 1;

  transaction.update(users.doc('${user.name}'), {'imagesQtt': newFollowerCount});

  if(newFollowerCount == 30) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CongratulationPage(user:user)));
  }

  return newFollowerCount;
})
.then((value) => print("Contador atualizado para $value"))
.catchError((error) => print("Ocorreu um erro ao atualizar o contador: $error"));
}
}