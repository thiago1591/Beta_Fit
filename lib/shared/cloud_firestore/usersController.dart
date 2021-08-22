import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debate_place_flutter/shared/models/user_model.dart';
import 'package:debate_place_flutter/shared/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

class UsersController {
  Future<void> addUser() {
    return users
        .doc('Thiago André')
        .set({
          'id': 12,
          'name': 'Thiago André',
          'photoURL': '',
          'first_name': 'Thiago',
          'profile_image': 'teste',
          'images': [],
          'imagesQtt': 0,
          'received_congrats': false
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<String> getUser() async {
    final instance = await SharedPreferences.getInstance();
    final user = instance.get("user") as String;
    return user;
  }

  List<UserModel> orderUsers(snapshot) {
    List<UserModel> usersList = [];

    final snapshotData = (snapshot.data! as QuerySnapshot).docs;

    snapshotData.asMap().forEach((index, element) {
      final user = UserModel(
        id: "1", 
        congratsReceived: false,
        name: snapshotData[index].get('name'),
        firstName: Services().getFirstName(snapshotData[index].get('name')),
        profileImage: snapshotData[index].get('profileImage'),
        imagesQtt: snapshotData[index].get('imagesQtt'),
      );

      usersList.add(user);
    });

    usersList.sort((b, a) => a.imagesQtt.compareTo(b.imagesQtt));

    return usersList;
  }
}
