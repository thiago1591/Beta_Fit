import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> addUser() {
  return users
  .doc('Thiago André')
      .set({
        'name': 'Thiago André',
        'photoURL': '',
        'first_name':'Thiago',
        'profile_image': 'teste',
        'images': [],
        'imagesQtt':0,
        'received_congrats':false
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<String> getUser() async {
  final instance =  await SharedPreferences.getInstance();
  final user = instance.get("user") as String;
  return user;
}

Future <List> getUsersOrded() async{
  var list2 = [];
  QuerySnapshot snapshot =  await users.orderBy('imagesQtt').get();
  var list = snapshot.docs;
  list.forEach((element) {
    list2.add(element.data());
    }
  );
  print(list2);
  return list2;
}