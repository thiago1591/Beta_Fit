import 'dart:io';

import 'package:debate_place_flutter/bottomNavigation/bottom_navigation.dart';
import 'package:debate_place_flutter/core/app_colors.dart';
import 'package:debate_place_flutter/home/home_page.dart';
import 'package:debate_place_flutter/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class PreviewImageWidget extends StatefulWidget {
  final UserModel user;
  final Function(String imageUrl) onFileChanged;

  const PreviewImageWidget(
      {Key? key, required this.onFileChanged, required this.user})
      : super(key: key);

  @override
  _PreviewImageWidgetState createState() => _PreviewImageWidgetState();
}

class _PreviewImageWidgetState extends State<PreviewImageWidget> {
  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();

    String? imageUrl;

    Future _uploadFile(String path) async {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('users')
          .child('${widget.user.name}')
          .child('images')
          .child('${DateTime.now().toIso8601String()}');
      final result = await ref.putFile(File(path));
      final fileUrl = await result.ref.getDownloadURL();

      setState(() {
        imageUrl = fileUrl;
      });

      widget.onFileChanged(fileUrl);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavigation(user: widget.user)));
    }

    Future _pickImage(ImageSource source) async {
      final pickedFile =
          await _picker.pickImage(source: source, imageQuality: 50);
      if (pickedFile == null) {
        return;
      }

      var file = await ImageCropper.cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
      if (file == null) {
        return;
      }

      await _uploadFile(file.path);
    }

    Future _selectPhoto() async {
      await showModalBottomSheet(
        context: context,
        builder: (context) => BottomSheet(
          onClosing: () {},
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.filter),
                title: Text('Escolha uma imagem'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: FloatingActionButton(
          onPressed: _selectPhoto,
          backgroundColor: AppColors.black,
          child: Icon(Icons.add)),
    );
  }
}
