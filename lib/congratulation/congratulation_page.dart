import 'package:debate_place_flutter/core/app_colors.dart';
import 'package:debate_place_flutter/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class CongratulationPage extends StatelessWidget {
  const CongratulationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Text('')),
            Text(
              'PARABÉNS!!!',
              style: AppTextStyles.congratsTitle,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Image.asset('assets/images/trofeu.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer totyscrambled it',
                    style: AppTextStyles.uploadSubtitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(child: Text('')),
            Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Continuar'),
                ))
          ],
        ),
      ),
    );
  }
}
