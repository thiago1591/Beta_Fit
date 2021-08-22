import 'package:beta_fit/core/app_text_styles.dart';
import 'package:beta_fit/home/widgets/chart/chart_widget.dart';
import 'package:beta_fit/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  final int qtt;
  final UserModel user;
  const ScoreCardWidget({ Key? key, required this.user, required this.qtt }) : super(key: key);

  double getPorcentage(int qtt) {
    final double porcentage = (qtt/30 * 100);
    final String porcentageString = porcentage.toStringAsFixed(0);
    final double porcentageFixed = double.parse(porcentageString);
    return porcentageFixed;
  }

  String setMessage(int qtt) {
    final double percentage = getPorcentage(qtt); 
    if(percentage < 30) {
      return "Vamos começar";
    }
    else if(percentage < 50) {
      return "Você está indo bem!";
    }
    else if(percentage < 70) {
      return "Bom progresso!";
    }
    else {
      return "Você está quase lá!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 106,
        decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ChartWidget(percent: getPorcentage(qtt))
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("${setMessage(qtt)}", style: AppTextStyles.heading,),
                    SizedBox(height: 5,),
                    Text("Você enviou $qtt/30 imagens", style: AppTextStyles.body,)
                  ],),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
