import 'package:debate_place_flutter/core/app_colors.dart';
import 'package:debate_place_flutter/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class UploadImagePage extends StatelessWidget {
  const UploadImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Text('')),
            Padding(padding: EdgeInsets.all(8),
            child: Image.asset('assets/images/workout.png'),),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(children: [
                Text(
              'Enviar uma imagem',
              style: AppTextStyles.uploadTitle,
            ),
            SizedBox(height: 15,),
            Text(
              'Envie a sua próxima imagem para avançar no desafio, ter uma vida mais saudável e bater a pontuação dos seus amigos!',
              style: AppTextStyles.uploadSubtitle, textAlign: TextAlign.center,
            ),
              ],),
            ),
            Expanded(child: Text('')),
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: AppColors.black,
                  child: Icon(Icons.add)),
            )
          ],
        ),
      ),
    );
  }
}
