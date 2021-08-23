import 'package:beta_fit/core/app_text_styles.dart';
import 'package:beta_fit/home/widgets/appbar/app_bar_widget.dart';
import 'package:beta_fit/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class BeginChallengeWidget extends StatelessWidget {
  final UserModel user;
  final int imagesQtt;
  const BeginChallengeWidget(
      {Key? key, required this.user, required this.imagesQtt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBarWidget(
          user,
          imagesQtt,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: 0.7,
                child: Image.asset('assets/images/workout2.png')),
              SizedBox(
                height: 15,
              ),
              Text(
                'Adicione sua primeira imagem na aba',
                style: AppTextStyles.message,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upload),
                  Text(
                    'Upload',
                    style: AppTextStyles.heading,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'para iniciar o desafio!',
                style: AppTextStyles.message,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
