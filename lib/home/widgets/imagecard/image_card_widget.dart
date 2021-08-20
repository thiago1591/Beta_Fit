import 'package:flutter/material.dart';

class ImageCardWidget extends StatelessWidget {
  final String profileImage,date;
  const ImageCardWidget({Key? key, required this.profileImage, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Column(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('$profileImage'),fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
                      ),
                    ),
                  ),
                  
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '16/08',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
