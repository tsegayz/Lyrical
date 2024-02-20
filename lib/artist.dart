// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, library_private_types_in_public_api
import 'package:flutter/material.dart';

class ImageData {
  final String image;
  final String title;

  ImageData({required this.image, required this.title});
}

class Artist extends StatefulWidget {
  @override
  _ArtistState createState() => _ArtistState();
}

class _ArtistState extends State<Artist> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        titleSpacing: 0,
        title: Stack(
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
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  hintStyle: TextStyle(color: Colors.grey[400]),
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
                ],
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/150',
            ),
            radius: 15,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 28, right: 5, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Artists',
              style: TextStyle(
                fontFamily: 'OrelegaOne',
                fontSize: 20,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 8),
              child: SizedBox(
                height: 650,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: images.length ,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: Offset(
                                          2, 4), 
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    images[index].image,
                                    width: 55,
                                    height: 45,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
