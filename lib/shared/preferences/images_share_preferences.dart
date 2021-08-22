import 'dart:convert';
import 'package:debate_place_flutter/shared/cloud_firestore/imagesController.dart';
import 'package:debate_place_flutter/shared/services/snapshotToList.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


  Future<String> getImagesList(BuildContext context, userName) async {
    final instance =  await SharedPreferences.getInstance();
    if(instance.containsKey("imagesList")) {
          final json = instance.get("imagesList") as String;
    return json;
    } 
      List imagesList = await ImagesController().getImages(userName);
      await instance.setString("imagesList", jsonEncode(imagesList));
     final json = instance.get("imagesList") as String;
    return json;
  }
