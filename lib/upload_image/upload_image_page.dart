import 'package:beta_fit/core/app_text_styles.dart';
import 'package:beta_fit/shared/models/user_model.dart';
import 'package:beta_fit/upload_image/widgets/preview_image_widget.dart';
import 'package:flutter/material.dart';

class UploadImagePage extends StatefulWidget {
  final UserModel user;
  const UploadImagePage({Key? key, required this.user}) : super(key: key);

  @override
  _UploadImagePageState createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  String imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Text('')),
            Padding(
              padding: EdgeInsets.all(8),
              child: Image.asset('assets/images/workout.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text(
                    'Enviar uma imagem',
                    style: AppTextStyles.uploadTitle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Envie a sua próxima imagem para avançar no desafio, ter uma vida mais saudável e bater a pontuação dos seus amigos!',
                    style: AppTextStyles.uploadSubtitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(child: Text('')),
            PreviewImageWidget(
              user: widget.user,
              onFileChanged: (imageUrl) {
                setState(() {
                  this.imageUrl = imageUrl;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
