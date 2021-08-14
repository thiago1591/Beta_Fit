import 'package:debate_place_flutter/core/app_colors.dart';
import 'package:debate_place_flutter/home/home_page.dart';
import 'package:debate_place_flutter/login/login_page.dart';
import 'package:debate_place_flutter/ranking/ranking_page.dart';
import 'package:debate_place_flutter/upload_image/upload_image_page.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({ Key? key }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _indiceAtual = 0;

  final List<Widget> _telas = [
    HomePage(),
    UploadImagePage(),
    RankingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Rank',
          ),
        ],
        currentIndex: _indiceAtual,
        selectedItemColor: AppColors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
