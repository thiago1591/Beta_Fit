import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:beta_fit/bottom_navigation/bottom_navigation.dart';
import 'package:beta_fit/congratulation/congratulation_page.dart';
import 'package:beta_fit/shared/models/user_model.dart';
import 'package:beta_fit/upload_image/widgets/loading_widget.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

class ImagesController {
  //Faz o upload da imagem para o storage do firebase e cria uma URL de
  //acesso a imagem, que é passada para a função uploadImageURL
  Future uploadImageFile(String path, context, UserModel user) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoadingWidget()));
    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('${user.id}')
          .child('${DateTime.now().toIso8601String()}');
      final result = await ref.putFile(File(path));
      String imgURL = await result.ref.getDownloadURL();
      uploadImageURL(user, imgURL, context);
    } catch (e) {
      print(e);
    }

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => BottomNavigation(user: user)));
  }

  //armazena a URL da imagem na coleção do user no cloud Firestore,
  //assim é mais facil de acessa-la pelo StreamBuilder
  Future<void> uploadImageURL(UserModel user, imageURL, context) {
    Map imageMap = {"date": "${DateTime.now()}", "imageURL": "$imageURL"};
    return users
        .doc('${user.id}')
        .update({
          'images': FieldValue.arrayUnion([imageMap])
        })
        .then((value) => imageQttIncrement(user, context))
        .catchError((error) => print(
            "Ocorreu um erro ao inserir a URL da imagem no banco: $error"));
  }

  Future<List> getImagesFirebase(UserModel user) async {
    var snapshot = await users.doc('${user.id}').get();
    List imagesList = snapshot.get(FieldPath(['images']));
    imagesList = List.from(imagesList.reversed);
    return imagesList;
  }

  Future<void> imageQttIncrement(UserModel user, context) {
    return FirebaseFirestore.instance
        .runTransaction((transaction) async {
          DocumentSnapshot snapshot =
              await transaction.get(users.doc('${user.id}'));

          if (!snapshot.exists) {
            throw Exception("Não foi possível obter informações do usuário");
          }

          dynamic data = snapshot.data();
          int newFollowerCount = data['imagesQtt'] + 1;

          transaction
              .update(users.doc('${user.id}'), {'imagesQtt': newFollowerCount});

          if (newFollowerCount % 30 == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CongratulationPage(user: user),
              ),
            );
          }

          return newFollowerCount;
        })
        .then((value) => print("Contador atualizado para $value"))
        .catchError((error) =>
            print("Ocorreu um erro ao atualizar o contador: $error"));
  }
}
