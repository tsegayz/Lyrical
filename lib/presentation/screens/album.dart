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

class Album extends StatefulWidget {
  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
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
              padding: const EdgeInsets.only(left: 28, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recently added',
                        style: TextStyle(
                          fontFamily: 'OrelegaOne',
                          fontSize: 17,
                          color: Colors.grey[600],
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
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
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 30),
                    child: SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 15),
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
                                  images[index].album,
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
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'All Album',
                              style: TextStyle(
                                fontFamily: 'OrelegaOne',
                                fontSize: 17,
                                color: Colors.grey[600],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 14,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isSearchExpanded = !_isSearchExpanded;
                                });
                              },
                            )
                          ],
                        ),
                        Positioned(
                          left: 88,
                          top: 0,
                          bottom: 0,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  borderRadius: _isSearchExpanded
                                      ? BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20),
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
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isSearchExpanded = !_isSearchExpanded;
                                    });
                                  },
                                ),
                              ),
                              if (_isSearchExpanded)
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 34,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 2,
                                          offset: Offset(2, 0),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(
                                        onChanged: searchArtist,
                                        controller: searchController,
                                        decoration: InputDecoration(
                                          hintText: 'Search...',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          border: InputBorder.none,
                                        ),
                                        style: TextStyle(
                                          fontSize: 14,
                                        )),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
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
