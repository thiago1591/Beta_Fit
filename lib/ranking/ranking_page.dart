import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:beta_fit/core/app_text_styles.dart';
import 'package:beta_fit/ranking/widgets/ranking_card_widget.dart';
import 'package:beta_fit/shared/controllers/users_controller.dart';
import 'package:beta_fit/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    final usersController = UsersController();

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<UserModel> usersList = usersController.orderUsers(snapshot);
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
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      shrinkWrap: true,
                      itemCount: usersList.length,
                      itemBuilder: (context, index) {
                        return RankingCardWidget(
                          pos: index + 1,
                          profileImage: "${usersList[index].profileImage}",
                          name: "${usersList[index].firstName}",
                          imageQtt: "${usersList[index].imagesQtt}",
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
