import 'package:debate_place_flutter/home/widgets/appbar/app_bar_widget.dart';
import 'package:debate_place_flutter/home/widgets/imagecard/image_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    if (0 == 0) {
      return Scaffold(
        appBar: AppBarWidget(),
        body: GridView.count(
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: 2,
          children: [1, 2, 3, 4, 5,6,7,8].map((e) => ImageCardWidget()).toList(),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        )),
      );
    }
  }
}
