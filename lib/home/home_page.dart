import 'dart:convert';

import 'package:debate_place_flutter/congratulation/congratulation_page.dart';
import 'package:debate_place_flutter/home/widgets/appbar/app_bar_widget.dart';
import 'package:debate_place_flutter/home/widgets/begin_challenge/begin_challenge_widget.dart';
import 'package:debate_place_flutter/home/widgets/imagecard/image_card_widget.dart';
import 'package:debate_place_flutter/shared/cloud_firestore/imagesController.dart';
import 'package:debate_place_flutter/shared/models/user_model.dart';
import 'package:debate_place_flutter/shared/preferences/images_share_preferences.dart';
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
        future: getImagesList(context, widget.user.name),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List imagesList = jsonDecode(snapshot.data.toString());

          if (imagesList.length == 0) {
            return BeginChallengeWidget(
                user: widget.user, imagesQtt: 2);
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
                          .map((item) => ImageCardWidget(
                              profileImage: "$item",
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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:debate_place_flutter/core/app_text_styles.dart';
// import 'package:debate_place_flutter/home/widgets/appbar/app_bar_widget.dart';
// import 'package:debate_place_flutter/home/widgets/begin_challenge/begin_challenge_widget.dart';
// import 'package:debate_place_flutter/home/widgets/imagecard/image_card_widget.dart';
// import 'package:debate_place_flutter/shared/models/user_model.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   final UserModel user;

//   const HomePage({required this.user});
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// List getList(int length) {
//   List listNumbers = [];

//   for (var i = 0; i < length; i++) {
//     listNumbers.add(i);
//   }

//   return listNumbers;
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//            if ( (snapshot.data! as QuerySnapshot).docs.length == 0) {
//             return BeginChallengeWidget(
//                 user: widget.user, imagesQtt: 2);
//           }
//           List images = (snapshot.data! as QuerySnapshot).docs[8].get('images');
//           return Scaffold(
//               appBar: AppBarWidget(
//                   widget.user, (snapshot.data! as QuerySnapshot).docs.length),
//               body: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: GridView.count(
//                         crossAxisSpacing: 0,
//                         mainAxisSpacing: 0,
//                         crossAxisCount: 2,
//                         children: getList(
//                                 (snapshot.data! as QuerySnapshot).docs.length)
//                             .map((e) => ImageCardWidget(
//                                 profileImage:
//                                     "${images[e]}",
//                                 date: "a"))
//                             .toList(),
//                       ),
//                     )
//                   ],
//                 ),
//               ));
//         },
//       ),
//     );
//   }
// }

