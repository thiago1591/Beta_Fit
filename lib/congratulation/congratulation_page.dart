import 'package:beta_fit/bottom_navigation/bottom_navigation.dart';
import 'package:beta_fit/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:beta_fit/core/app_text_styles.dart';

import 'next_button/next_button_widget.dart';

class CongratulationPage extends StatelessWidget {
  final UserModel user;
  const CongratulationPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/trofeu2.png'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Parabéns!",
                    style: AppTextStyles.congratsTitle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Você enviou 30 imagens com sucesso!",
                    style: AppTextStyles.congratsTxt,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Compartilhe com algum coordenador da BetaBit para receber um brinde",
                    style: AppTextStyles.congratsTxt,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                                'BetaFit - O usuário $user acaba de completar 30 imagens enviadas, concluindo o desafio com sucesso!');
                          }),
                    )),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.white(
                          label: "Voltar ao início",
                          onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigation(user:user)));
                          }),
                    )),
                  ],
                ) 
              ],
            )
          ],
        ),
      ),
    );
  }
}
