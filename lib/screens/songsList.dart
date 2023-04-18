// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/song_list_model.dart';

class SongList extends StatefulWidget {
  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  int index = 0;
  int _index = 0;

  static List<SongsListModel> items = [
    SongsListModel(
      "Hana",
      "yezelalem fetrai ",
    ),
    SongsListModel(
      "Endale",
      "yezelalem fetrai ",
    ),
    SongsListModel(
      "Dawit",
      "yezelalem fetrai ",
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
              "Songs",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: ListView.builder(
            itemCount: items.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => GoRouter.of(context).go('/lyrics'),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 400,
                          height: 55,
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
                                  items[index].song,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                Text(items[index].album,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black))
                              ],
                            ),
                            SizedBox(
                              width: 200,
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _index++;
                                  });
                                },
                                child: Icon(get_icons(_index),
                                    color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
