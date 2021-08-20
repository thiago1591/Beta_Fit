import 'package:debate_place_flutter/core/app_text_styles.dart';
import 'package:debate_place_flutter/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget(user, qtt)
      : super(
            preferredSize: Size.fromHeight(280),
            child: Container(
              height: 280,
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/texture.png'),
                          fit: BoxFit.cover),
                    ),
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage(
                                    "${user.profileImage}"),
                                backgroundColor: Colors.transparent,
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Olá, ",
                                    style: AppTextStyles.hello,
                                    children: [
                                      TextSpan(
                                          text: "${user.firstName}",
                                          style: AppTextStyles.helloBold)
                                    ]),
                              ),
                            ],
                          ),
                          Container(
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment(0.0, 0.8), child: ScoreCardWidget(user:user, qtt:qtt))
                ],
              ),
            ));
}
