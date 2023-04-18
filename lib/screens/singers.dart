// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/singer_model.dart';

class Singers extends StatelessWidget {

  int index = 0;

  static List<SingerModel> items = [
    SingerModel(
      "Hana",
      "hana ",
    ),
    SingerModel(
      "Endale",
      "endale ",
    ),
    SingerModel(
      "Dawit",
      "dawit ",
    ),
  ];

  get_icons(int index) {
    return index % 2 == 0 ? Icons.favorite_border : Icons.favorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Singers",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 20),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  constraints: BoxConstraints.tightFor(width: 400, height: 50),
                  hintText: "Enter Singer name ",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                  )),
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => GoRouter.of(context).go('/albums'),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 400,
                              height: 65,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0)),
                            ),
                            Positioned(
                              top: 50,
                              child: Container(
                                width: 4000,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      items[index].singerA,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                    Text(items[index].singerE,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black))
                                  ],
                                ),
                                SizedBox(
                                  width: 200,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  size: 25,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
