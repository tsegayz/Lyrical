// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/card_model.dart';

// ignore: must_be_immutable
class Albums extends StatelessWidget {
 
  int index = 0;

  static List<CardModel> itemPack = [
    CardModel("2021", "Tourist ", "Album1"),
    CardModel("2021", "Tourist ", "Album2"),
    CardModel("2021", "Tourist ", "Album3"),
    CardModel("2021", "Tourist ", "Album4"),
    CardModel("2021", "Tourist ", "Album5"),
    CardModel("2021", "Tourist ", "Album6"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            GestureDetector(
              onTap: () => GoRouter.of(context).pop(),
              child: Icon(
                Icons.arrow_back,
                size: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 120,
            ),
            Text(
              "Albums",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
              child: Container(
                height: 36,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Hanna Tekle",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 25, 46),
                        ),
                      ),
                      Text(
                        "Hanna Tekle",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: () => GoRouter.of(context).go('/songList'),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    childAspectRatio: 1,
                  ),
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              )
                            ]),
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 70.0),
                                    child: Text(
                                      itemPack[index % 6].year,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Text(
                                    itemPack[index % 6].title,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 70.0),
                                    child: Text(
                                      itemPack[index % 6].album,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
