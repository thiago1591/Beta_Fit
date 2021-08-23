import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:beta_fit/shared/models/user_model.dart';
import 'package:beta_fit/shared/services/get_first_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

class UsersController {

  Future<void> addUser(UserModel user) async {
      return users
        .doc('${user.id}')
        .set({
          'id': user.id,
          'name': user.name,
          'profileImage': user.profileImage,
          'images': [],
          'imagesQtt': 0,
        })
        .then((value) => print("Usuário adicionado"))
        .catchError(
            (error) => print("Ocorreu um erro ao adicionar o usuário: $error"));
    }


  Future<String> getUserLocal() async {
    final instance = await SharedPreferences.getInstance();
    final user = instance.get("user") as String;
    return user;
  }

  Future<int> getUserImagesQtt(UserModel user) async {
    var snapshot = await users.doc('${user.id}').get();
    int imagesQtt = snapshot.get('imagesQtt');
    return imagesQtt;
  }

  List<UserModel> orderUsers(snapshot) {
    List<UserModel> usersList = [];

    final snapshotData = (snapshot.data! as QuerySnapshot).docs;

    snapshotData.asMap().forEach((index, element) {
      final user = UserModel(
        id: snapshotData[index].get('id'),
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
