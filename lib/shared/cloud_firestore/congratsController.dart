import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> setReceivedAwardTrue() {
  return users
  .doc('Thiago André')
      .update({
        'received_congrats': true})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<bool> checkCongratsIsReceived() async {
  var snapshot = await users.doc('Thiago André').get();
  bool congratsIsReceived = snapshot.get(FieldPath(['received_congrats']));
  print(congratsIsReceived);
  return congratsIsReceived;
}