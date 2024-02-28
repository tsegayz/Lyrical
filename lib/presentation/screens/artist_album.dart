// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, depend_on_referenced_packages
import 'package:chainoftrust/logic/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageData {
  final String image;
  final String album;

  ImageData({required this.image, required this.album});
}

class BottomBar {
  final IconData icon;
  final String title;

  BottomBar({required this.icon, required this.title});
}

class ArtistAlbum extends StatefulWidget {
  @override
  _ArtistAlbumState createState() => _ArtistAlbumState();
}

class _ArtistAlbumState extends State<ArtistAlbum> {
  bool _isSearchExpanded = false;
  final TextEditingController searchController = TextEditingController();

  int selectedIndex = 3;

  final List<ImageData> images = [
    ImageData(image: 'assets/img_1.jpg', album: 'Azeb'),
    ImageData(image: 'assets/img_2.jpg', album: 'Samuel'),
    ImageData(image: 'assets/img_3.jpg', album: 'Yosef'),
    ImageData(image: 'assets/img_4.jpg', album: 'Meskerem'),
    ImageData(image: 'assets/img_5.jpg', album: 'Daniel'),
    ImageData(image: 'assets/img_6.jpg', album: 'Lily'),
    ImageData(image: 'assets/img_7.jpg', album: 'Mesfin'),
    ImageData(image: 'assets/img_8.jpg', album: 'Dagmawi'),
    ImageData(image: 'assets/img_9.jpg', album: 'Bethelhem'),
  ];
  final List<BottomBar> bars = [
    BottomBar(icon: Icons.home_rounded, title: 'Home'),
    BottomBar(icon: Icons.album_outlined, title: 'Artists'),
    BottomBar(icon: Icons.music_note_rounded, title: 'Songs'),
    BottomBar(icon: Icons.album_outlined, title: 'Albums'),
    BottomBar(icon: Icons.person_outline, title: 'Account'),
  ];

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
          final artistTitle = image.album.toLowerCase();
          final input = query.toLowerCase();

          return artistTitle.contains(input);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final String artist = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Row(
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
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
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
              padding: const EdgeInsets.only(left: 20, right: 5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 2,
                                offset: Offset(1, 1),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              artist,
                              style: TextStyle(
                                fontFamily: 'OrelegaOne',
                                fontSize: 17,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 5),
                    child: SizedBox(
                      height: 420,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: filteredImages.length,
                        itemBuilder: (BuildContext context, int index) {
                          final imageData = filteredImages[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/albumSong',
                                arguments: images[index].image,
                              );
                            },
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    images[index].image,
                                    width: 80,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  imageData.album,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  'title one',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey[600],
                                  ),
                                ),
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
