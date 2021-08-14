import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        child: Image.network(
            'https://avatars.githubusercontent.com/u/66754516?v=4'),
      ),
    );
  }
}
