import 'package:debate_place_flutter/core/app_text_styles.dart';
import 'package:debate_place_flutter/ranking/widgets/ranking_card_widget.dart';
import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/trofeu.png',
                      width: 50,
                    ),
                    Text(
                      'Ranking BetaFit',
                      style: AppTextStyles.rankingTitle,
                    )
                  ],
                ),
              ),
              RankingCardWidget(),
              RankingCardWidget(),
              RankingCardWidget(),
              RankingCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
