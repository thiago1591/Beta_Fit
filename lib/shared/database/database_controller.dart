import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
      return users
          .add({
            'Nome': "Thiago André",
            'company': "Ramo", 
            'age': "20" 
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    Future<String> getUser() async {
     final instance =  await SharedPreferences.getInstance();
      final user = instance.get("user") as String;
      print(user);
      return user;
    }


 
    


  
}