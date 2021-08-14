import 'package:debate_place_flutter/core/app_colors.dart';
import 'package:debate_place_flutter/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class RankingCardWidget extends StatefulWidget {
  const RankingCardWidget({Key? key}) : super(key: key);

  @override
  _RankingCardWidgetState createState() => _RankingCardWidgetState();
}

class _RankingCardWidgetState extends State<RankingCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
        decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('1º', style: AppTextStyles.rankingCard1,),
            SizedBox(width: 15,),
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/66754516?v=4'),
              backgroundColor: Colors.transparent,
            ),
             SizedBox(width: 5,),
            Column(children: [
              Text('Thiago André', style: AppTextStyles.rankingCard2,),
              Text('24/30 imagens', style: AppTextStyles.rankingCard3,)
            ],)
          ],
        ),
      ),
    );
  }
}
