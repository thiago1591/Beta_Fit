import 'package:beta_fit/home/widgets/appbar/app_bar_widget.dart';
import 'package:beta_fit/home/widgets/begin_challenge/begin_challenge_widget.dart';
import 'package:beta_fit/shared/services/map_indexed.dart';
import 'package:beta_fit/home/widgets/imagecard/image_card_widget.dart';
import 'package:beta_fit/shared/controllers/images_controller.dart';
import 'package:beta_fit/shared/models/user_model.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final UserModel user;

  const HomePage({required this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final imagesController = ImagesController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder( 
        future: imagesController.getImagesFirebase(widget.user),
        builder: (context, snapshot) {
          
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List imagesList = snapshot.data! as List;

          if (imagesList.length == 0) {
            return BeginChallengeWidget(
                user: widget.user, imagesQtt: 0);
          }

          return Scaffold(
            appBar: AppBarWidget(widget.user, imagesList.length),
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
                          .mapIndexed((index,item) => ImageCardWidget(
                              profileImage: "${item['imageURL']}",
                              date: "${item['date']}"))
                          .toList(),
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
