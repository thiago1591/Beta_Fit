import 'package:flutter/material.dart';

class ImageCardWidget extends StatelessWidget {
  const ImageCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
          Image.asset('assets/images/running.jpg'),
          Text('10/08')
          ],)
        );
  }
}
