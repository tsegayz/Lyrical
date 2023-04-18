// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/songs_model.dart';

class SearchAll extends StatefulWidget {
  @override
  State<SearchAll> createState() => _SearchAllState();
}

class _SearchAllState extends State<SearchAll> {

  int _index = 0;

  static List<SongsModel> items = [
    SongsModel(
      "Hana Tekle",
      "Agezege ",
    ),
    SongsModel(
      "Endale W/georigis",
      "Mematsega ",
    ),
    SongsModel(
      "Dawit",
      "Oh nefse ",
    ),
  ];

  static List<SongsModel> items2 = [
    SongsModel(
      "Thy word",
      "Amy Grant ",
    ),
    SongsModel(
      "promises",
      "Trible ",
    ),
    SongsModel(
      "Agradecdo",
      "Danny Gokey ",
    ),
  ];
  get_icons(int index) {
    return index % 2 == 0 ? Icons.favorite_border : Icons.favorite;
  }

  final PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 2;
  // final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                _pageController.animateToPage(
                  0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
                setState(() {
                  _selectedIndex = 0;
                });
              },
              child: Container(
                width: 140,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color:
                          _selectedIndex == 0 ? Colors.red : Colors.transparent,
                      width: 3.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Amharic',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _pageController.animateToPage(
                  1,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
                setState(() {
                  _selectedIndex = 1;
                });
              },
              child: Container(
                width: 140,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color:
                          _selectedIndex == 1 ? Colors.red : Colors.transparent,
                      width: 3.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'English',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Column(
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
                      constraints:
                          BoxConstraints.tightFor(width: 400, height: 50),
                      hintText: "Search Song by name or artist",
                      prefixIcon: Icon(
                        Icons.search,
                        size: 24,
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
                        onTap: () => GoRouter.of(context).go('/lyrics'),
                        child: Stack(
                          children: [
                            Container(
                              width: 400,
                              height: 65,
                              decoration: BoxDecoration(
                                  // color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(13.0)),
                            ),
                            Positioned(
                              top: 46,
                              child: Container(
                                width: 4000,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20.0, right: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(
                                          items[index].song,
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.black),
                                        ),
                                        Text(items[index].artist,
                                            style: TextStyle(
                                                fontSize: 14, color: Colors.black))
                                      ],
                                    ),
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
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
          Container(
            child: Column(
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
                        constraints:
                            BoxConstraints.tightFor(width: 400, height: 50),
                        hintText: "Search Song by name or artist",
                        prefixIcon: Icon(
                          Icons.search,
                          size: 24,
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
                          onTap: () => GoRouter.of(context).go('/lyrics'),
                          child: Stack(
                            children: [
                              Container(
                                width: 400,
                                height: 65,
                                decoration: BoxDecoration(
                                    // color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(13.0)),
                              ),
                              Positioned(
                                top: 46,
                                child: Container(
                                  width: 4000,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              Padding(
                              padding: const EdgeInsets.only(left:20.0, right: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(
                                          items2[index].song,
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.black),
                                        ),
                                        Text(items2[index].artist,
                                            style: TextStyle(
                                                fontSize: 14, color: Colors.black))
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          _index++;
                                      });
                                    },
                                    child: Icon(get_icons(_index),color: Colors.grey)),
                                ],
                              ),
                            ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          // ignore: prefer_const_literals_to_create_immutables
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
                color: Color.fromARGB(255, 0, 27, 50),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.music_note,
                size: 25,
                color: Color.fromARGB(255, 0, 27, 50),
              ),
              label: 'New Songs',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 25,
                color: Color.fromARGB(255, 0, 27, 50),
              ),
              label: 'All Songs',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 25,
                color: Color.fromARGB(255, 0, 27, 50),
              ),
              label: 'Menu',
              // backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 0, 27, 50),
          onTap: (index) {
            switch (index) {
              case 0:
                GoRouter.of(context).go('/');
                break;
              case 1:
                GoRouter.of(context).go('/newSongs');
                break;
              case 2:
                GoRouter.of(context).go('/searchAll');
                break;
              case 3:
                GoRouter.of(context).go('/menu');
                break;
            }
            _selectedIndex = index;
            index = 2;
          }),
    );
  }
}
