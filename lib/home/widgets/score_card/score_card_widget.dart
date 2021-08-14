import 'package:debate_place_flutter/core/app_text_styles.dart';
import 'package:debate_place_flutter/home/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  const ScoreCardWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 106,
        decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.circular(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ChartWidget(percent: 10)
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Vamos começar", style: AppTextStyles.heading,),
                  SizedBox(height: 5,),
                  Text("Você enviou 30/30 imagens", style: AppTextStyles.body,)
                ],),
              ),
            )
          ],
        )
      ),
    );
  }
}
