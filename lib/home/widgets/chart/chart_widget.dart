import 'package:beta_fit/core/app_colors.dart';
import 'package:beta_fit/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final double percent;
  const ChartWidget({Key? key, required this.percent}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {


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
                  height: 75,
                  width: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    backgroundColor: AppColors.chartSecondary,
                    value: widget.percent/100,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${widget.percent.toInt()}%",
                 //"${(_animation.value * 100).toInt()}%",
                  style: AppTextStyles.heading,
                ),
              )
            ],
          ),
        );
  }
}