import 'package:debate_place_flutter/home/widgets/appbar/app_bar_widget.dart';
import 'package:debate_place_flutter/home/widgets/begin_challenge/begin_challenge_widget.dart';
import 'package:debate_place_flutter/home/widgets/imagecard/image_card_widget.dart';
import 'package:debate_place_flutter/shared/cloud_firestore/imagesController.dart';
import 'package:debate_place_flutter/shared/models/user_model.dart';
import 'package:debate_place_flutter/shared/services/snapshotToList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final UserModel user;

  const HomePage({required this.user});
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ImagesController().getImages(widget.user.name),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
   
          List imagesList = snapshotToList(snapshot);        

          if (imagesList.length == 0) {
            return BeginChallengeWidget(
              user: widget.user, imagesQtt: imagesList.length
            );
          }
          print(widget.user.firstName);
          return Scaffold(
            appBar: AppBarWidget(
                widget.user, imagesList.length),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      crossAxisCount: 2,
                      children: imagesList
                          .map((item) => ImageCardWidget(
                              profileImage:
                                  "$item",
                              date: "nao implementado ainda"))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
