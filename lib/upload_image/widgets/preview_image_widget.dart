import 'package:debate_place_flutter/core/app_colors.dart';
import 'package:debate_place_flutter/shared/controllers/images_controller.dart';
import 'package:debate_place_flutter/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

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

    Future _pickImage(ImageSource source) async {
      final imageController = ImagesController();

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

      await imageController.uploadImageFile(file.path, context, widget.user);
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
          //onPressed: () {print(widget.user.id);},
          onPressed: _selectPhoto,
          backgroundColor: AppColors.black,
          child: Icon(Icons.add)),
    );
  }
}
