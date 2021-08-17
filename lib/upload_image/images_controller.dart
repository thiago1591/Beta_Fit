import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getImages(String user) async {
  List imagesList = [];
  
  firebase_storage.ListResult result =
      await firebase_storage.FirebaseStorage.instance.ref().child('$user').listAll();
 
    result.items.forEach((firebase_storage.Reference ref) async {
      String downloadURL = await firebase_storage.FirebaseStorage.instance
      .ref("${ref.fullPath}")
      .getDownloadURL();

      imagesList.add(downloadURL);
       sendToCloud(user, downloadURL);
  });
  
  return imagesList;
}



Future<void> sendToCloud(user, imgURL) {
CollectionReference userRef = FirebaseFirestore.instance.collection('$user');
return userRef
    .add({
      'img_URL': imgURL, 
    })
    .then((value) => print("Image Added"))
    .catchError((error) => print("Failed to add user: $error"));
}


 