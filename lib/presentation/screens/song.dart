// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:go_router/go_router.dart';

class ImageData {
  final String image;
  final String title;
  final String artist;

  ImageData({required this.image, required this.title, required this.artist});
}

class BottomBar {
  final IconData icon;
  final String title;

  BottomBar({required this.icon, required this.title});
}

class Song extends StatefulWidget {
  @override
  _SongState createState() => _SongState();
}

class _SongState extends State<Song> {
  bool _isSearchExpanded = false;

  final List<ImageData> images = [
    ImageData(
      image: 'assets/img_1.jpg',
      artist: 'Azeb',
      title: 'sasebew',
    ),
    ImageData(
      image: 'assets/img_2.jpg',
      artist: 'Samuel',
      title: 'tilik nehe',
    ),
    ImageData(
      image: 'assets/img_3.jpg',
      artist: 'Yosef',
      title: 'abetu amlake',
    ),
    ImageData(
      image: 'assets/img_4.jpg',
      artist: 'Meskerem',
      title: 'melkam nehe',
    ),
    ImageData(
      image: 'assets/img_5.jpg',
      artist: 'Daniel',
      title: 'yenebse',
    ),
    ImageData(
      image: 'assets/img_6.jpg',
      artist: 'Lily',
      title: 'medhanit',
    ),
    ImageData(
      image: 'assets/img_7.jpg',
      artist: 'Mesfin',
      title: 'eyesus',
    ),
    ImageData(
      image: 'assets/img_8.jpg',
      artist: 'Dagmawi',
      title: 'amelkehalew',
    ),
    ImageData(
      image: 'assets/img_9.jpg',
      artist: 'Bethelhem',
      title: 'feker nehe',
    ),
  ];
  final List<BottomBar> bars = [
    BottomBar(icon: Icons.home_rounded, title: 'Home'),
    BottomBar(icon: Icons.album_outlined, title: 'Artists'),
    BottomBar(icon: Icons.music_note_rounded, title: 'Songs'),
    BottomBar(icon: Icons.album_outlined, title: 'Albums'),
    BottomBar(icon: Icons.person_outline, title: 'Account'),
  ];
  int selectedIndex = 2;

  final TextEditingController searchController = TextEditingController();
  List<ImageData> filteredImages = [];

  @override
  void initState() {
    super.initState();
    filteredImages = List.from(images);
  }

  void searchArtist(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredImages = List.from(images);
      } else {
        filteredImages = images.where((image) {
          final artistTitle = image.title.toLowerCase();
          final input = query.toLowerCase();

          return artistTitle.contains(input);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 10),
          child: Stack(
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromARGB(255, 88, 88, 88),
                      size: 17,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Mezmur debter',
                    style: TextStyle(
                      fontFamily: 'OrelegaOne',
                      fontSize: 20,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                top: 4,
                bottom: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_isSearchExpanded)
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            width: 125,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                  onChanged: searchArtist,
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    hintText: 'Search...',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: 14,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    Container(
                      width: 34,
                      height: 34,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: _isSearchExpanded
                            ? BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20),
                              )
                            : BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 3,
                            offset: Offset(2, 0),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 22,
                        ),
                        onPressed: () {
                          setState(() {
                            _isSearchExpanded = !_isSearchExpanded;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 5, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All Songs',
                style: TextStyle(
                  fontFamily: 'OrelegaOne',
                  fontSize: 17,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 8),
                child: SizedBox(
                  height: 630,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: filteredImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final imageData = filteredImages[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        offset: Offset(2, 3),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.music_note_rounded,
                                    size: 22,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      imageData.title,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Text(
                                      imageData.artist,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                size: 22,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isSearchExpanded = !_isSearchExpanded;
                                });
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        color: Color.fromARGB(255, 189, 192, 235),
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 100),
        items: bars
            .map((data) => CurvedNavigationBarItem(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(data.icon, size: 22, color: Colors.white),
                      Text(
                        data.title,
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ],
                  ),
                ))
            .toList(),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          context
              .go(['/home', '/artist', '/song', '/album', '/account'][index]);
        },
        index: selectedIndex,
      ),
    );
  }
}
