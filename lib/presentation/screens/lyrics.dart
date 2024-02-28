// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, library_private_types_in_public_api
import 'package:flutter/material.dart';

class ImageData {
  final String image;
  final String title;

  ImageData({required this.image, required this.title});
}

class Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String? title = arguments['title'];
    final String? image = arguments['image'];

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 400,
                    child: ClipRRect(
                      child: Image.asset(
                        image ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      color: Color.fromARGB(255, 22, 22, 22).withOpacity(0.5),
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
              Container(
                margin: EdgeInsets.only(top: 320),
                width: 412,
                height: 495,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(90.0),
                    topRight: Radius.circular(90),
                    bottomLeft: Radius.circular(0),
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
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 221, 239, 255),
                      Color.fromARGB(255, 255, 255, 255),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),
                    Text(
                      '$title',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 7, 17, 36),
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(80, 0, 80, 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Hiyaw Amlak Nehe' * 50,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 7, 17, 36),
                                  height: 2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 265,
                left: 120,
                child: Stack(
                  children: [
                    SizedBox(
                      width: 190,
                      height: 110,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          image ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 173, 173, 173)
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
