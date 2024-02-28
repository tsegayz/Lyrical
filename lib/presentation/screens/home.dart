// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, depend_on_referenced_packages
import 'package:chainoftrust/logic/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 26),
          child: Text(
            'Mezmur debter',
            style: TextStyle(
              fontFamily: 'OrelegaOne',
              fontSize: 20,
              color: Colors.grey[600],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(1, 1),
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    return Text(
                      state.email[0].toUpperCase(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 7, 39),
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Albums',
                    style: TextStyle(
                      fontFamily: 'OrelegaOne',
                      fontSize: 17,
                      color: Colors.grey[600],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/albumSong');
                    },
                    child: Row(
                      children: [
                        Text(
                          'see all',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(width: 7),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/albumSong',
                  arguments: images[1].image,
                );
              },
              child: Container(
                width: 330,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 119, 53, 53),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/img_2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 9),
                        child: Text(
                          'New Songs',
                          style: TextStyle(
                            fontFamily: 'OrelegaOne',
                            fontSize: 17,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 47, bottom: 0),
                    child: SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 18),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/lyrics',
                                  arguments: {
                                    'title': images[index].title,
                                    'image': images[index].image,
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      images[index].image,
                                      width: 90,
                                      height: 90,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 5),
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
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Song list',
                        style: TextStyle(
                          fontFamily: 'OrelegaOne',
                          fontSize: 17,
                          color: Colors.grey[600],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/song');
                        },
                        child: Row(
                          children: [
                            Text(
                              'see all',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(width: 7),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 4),
                    child: SizedBox(
                      height: 235,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 20, right: 25),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/lyrics',
                                  arguments: {
                                    'title': images[index].title,
                                    'image': images[index].image,
                                  },
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            images[index].artist,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          Text(
                                            images[index].title,
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
          Navigator.of(context).pushNamed(
              ['/home', '/artist', '/song', '/album', '/account'][index]);
        },
        index: selectedIndex,
      ),
    );
  }
}
