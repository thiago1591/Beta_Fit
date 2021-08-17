import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debate_place_flutter/core/app_text_styles.dart';
import 'package:debate_place_flutter/home/widgets/appbar/app_bar_widget.dart';
import 'package:debate_place_flutter/home/widgets/imagecard/image_card_widget.dart';
import 'package:debate_place_flutter/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final UserModel user;

  const HomePage({required this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

List getList(int length) {
  List listNumbers = [];

  for (var i = 0; i < length; i++) {
    listNumbers.add(i);
  }

  return listNumbers;
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('${widget.user.name}').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if ((snapshot.data! as QuerySnapshot).docs.length == 0) {
            return Center(
              child: Scaffold(
                appBar: AppBarWidget(
                    widget.user, (snapshot.data! as QuerySnapshot).docs.length),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset('assets/images/workout2.png'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Adicione sua primeira imagem na aba',
                                  style: AppTextStyles.message,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.upload),
                                    Text(
                                      'Upload',
                                      style: AppTextStyles.heading,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'para iniciar o desafio!',
                                  style: AppTextStyles.message,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            );
          }

          return Scaffold(
              appBar: AppBarWidget(
                  widget.user, (snapshot.data! as QuerySnapshot).docs.length),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.count(
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        crossAxisCount: 2,
                        children: getList(
                                (snapshot.data! as QuerySnapshot).docs.length)
                            .map((e) => ImageCardWidget(
                                photoURL:
                                    "${(snapshot.data! as QuerySnapshot).docs[e].get('img_URL')}",
                                date: "a"))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
