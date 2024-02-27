// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, library_private_types_in_public_api
import 'package:flutter/material.dart';

class ImageData {
  final String image;
  final String title;

  ImageData({required this.image, required this.title});
}

class AlbumSong extends StatefulWidget {
  @override
  _AlbumSongState createState() => _AlbumSongState();
}

class _AlbumSongState extends State<AlbumSong> {
  bool _isSearchExpanded = false;

  final List<ImageData> images = [
    ImageData(image: 'assets/img_1.jpg', title: 'Aeb'),
    ImageData(image: 'assets/img_2.jpg', title: 'Samuel'),
    ImageData(image: 'assets/img_3.jpg', title: 'Yosef'),
    ImageData(image: 'assets/img_4.jpg', title: 'Meskerem'),
    ImageData(image: 'assets/img_5.jpg', title: 'Daniel'),
    ImageData(image: 'assets/img_6.jpg', title: 'Lily'),
    ImageData(image: 'assets/img_7.jpg', title: 'Mesfin'),
    ImageData(image: 'assets/img_8.jpg', title: 'Dagmawi'),
    ImageData(image: 'assets/img_9.jpg', title: 'Bethelhem'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 400,
                      child: ClipRRect(
                        child: Image.asset(
                          'assets/img_1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 20,
                  left: 30,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 85, 82, 82),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 14,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 160,
                  left: 130,
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Color.fromARGB(220, 66, 82, 100),
                            width: 5,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/img_1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Hiyaw Amlak Nehe',
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 235, 235, 235),
                        ),
                      ),
                      Text(
                        '12 Songs',
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 235, 235, 235),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 5, top: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Song list',
                        style: TextStyle(
                          fontFamily: 'OrelegaOne',
                          fontSize: 20,
                          color: Colors.grey[600],
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.shuffle_rounded,
                          size: 18,
                        ),
                        onPressed: () {
                          setState(() {
                            _isSearchExpanded = !_isSearchExpanded;
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 4),
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 20, right: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        images[index].image,
                                        width: 55,
                                        height: 45,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          images[index].title,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(
                                          'title one',
                                          style: TextStyle(
                                            fontSize: 12,
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
          ],
        ),
      ),
    );
  }
}
