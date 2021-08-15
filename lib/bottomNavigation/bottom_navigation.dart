import 'package:debate_place_flutter/core/app_colors.dart';
import 'package:debate_place_flutter/home/home_page.dart';
import 'package:debate_place_flutter/ranking/ranking_page.dart';
import 'package:debate_place_flutter/shared/models/user_model.dart';
import 'package:debate_place_flutter/upload_image/upload_image_page.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final UserModel user;
  const BottomNavigation({ Key? key, required this.user }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState(user);
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _indiceAtual = 0;
  UserModel user;
  _BottomNavigationState(this.user);
  

  void _onItemTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  Widget getPage(int index) {
    switch (index){
        case 0:
            return HomePage(user: user);
        case 1:
            return UploadImagePage();
            
        default:
            return RankingPage();
    }
  }



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPage(_indiceAtual),
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

