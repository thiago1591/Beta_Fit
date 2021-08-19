import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debate_place_flutter/core/app_text_styles.dart';
import 'package:debate_place_flutter/ranking/widgets/ranking_card_widget.dart';
import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {

   List order() {

    return [];
  }
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //final usersList = users.orderBy('imagesQtt');
    
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/trofeu.png',
                          width: 50,
                        ),
                        Text(
                          'Ranking BetaFit',
                          style: AppTextStyles.rankingTitle,
                        ),
                      ],
                    ),
                  ),
                 Expanded(child:  ListView.builder(
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    shrinkWrap: true,
                    itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                    itemBuilder: (context, index) {
                      return RankingCardWidget(
                        pos: index+1,
                        photoURL: "${(snapshot.data! as QuerySnapshot).docs[index].get('photoURL')}", 
                        name: "${(snapshot.data! as QuerySnapshot).docs[index].get('name')}", 
                        imageQtt: (snapshot.data! as QuerySnapshot).docs[index].get('imagesQtt'));
                    },
                  ),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
