import 'package:debate_place_flutter/core/app_colors.dart';
import 'package:debate_place_flutter/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final double percent;
  const ChartWidget({Key? key, required this.percent}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        child: 
          Stack(
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    backgroundColor: AppColors.chartSecondary,
                    value: .75,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "75%",
                 //"${(_animation.value * 100).toInt()}%",
                  style: AppTextStyles.heading,
                ),
              )
            ],
          ),
        );
  }
}