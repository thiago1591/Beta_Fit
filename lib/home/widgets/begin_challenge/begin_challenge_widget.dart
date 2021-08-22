import 'package:beta_fit/core/app_text_styles.dart';
import 'package:beta_fit/home/widgets/appbar/app_bar_widget.dart';
import 'package:beta_fit/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class BeginChallengeWidget extends StatelessWidget {
  final UserModel user;
  final int imagesQtt;
  const BeginChallengeWidget({ Key? key, required this.user, required this.imagesQtt }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBarWidget(
          user,
          imagesQtt,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset('assets/images/workout2.png'),
                        SizedBox(
                          height: 10,
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
                  )),
            ),
          ),
        ),
      ),
    );
  }
}