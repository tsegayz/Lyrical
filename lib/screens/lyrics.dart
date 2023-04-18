// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Lyrics extends StatefulWidget {
  const Lyrics({Key? key}) : super(key: key);

  @override
  State<Lyrics> createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {
  int _index = 0;
  // ignore: non_constant_identifier_names
  get_icons(int index) {
    return index % 2 == 0 ? Icons.favorite_border : Icons.favorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
            ),
            Text('Enzemer',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    _index++;
                  });
                },
                child: Icon(get_icons(_index), color: Colors.grey))
          ],
        ),
        elevation: 0.0,
        // backgroundColor: Color.fromARGB(255, 254, 254, 254)
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(130.0, 20.0, 130.0, 10.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: Text(
                  "Thy Word",
                  style: TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(255, 7, 37, 62),
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black,
            height: 2,
            width: 200,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Thy word is a lamp unto my feet \n And a light unto my path \n Thy word is a lamp unto my feet \n And a light unto my path \n When i feel afraid \n And think i have lost my way \n Still, you are there right beside me \n Nothing will i fear \n As long as you are near; \n Please be near till the end \n I will not forget \n Your love for me and yet, \n My heart forever is wondering \n Jesus be my guide, \n And hold me to your side, \n And i will love you to the end \n Nothing will i fear \n As long as you are near; \n Please be near me to the end",
            style: TextStyle(
                height: 1.2,
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
