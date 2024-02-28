// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'hexagon.dart';

class Welcome extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/img_1.jpg',
    'assets/img_2.jpg',
    'assets/img_3.jpg',
    'assets/img_4.jpg',
    'assets/img_5.jpg',
    'assets/img_6.jpg',
    'assets/img_7.jpg',
    'assets/img_8.jpg',
    'assets/img_9.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      context.go('/signup');
    });

    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(80.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 199, 199, 199)
                            .withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 3,
                        offset: Offset(5, 5),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned(
                              left: 50,
                              top: 25,
                              child: SizedBox(
                                width: 75,
                                child: Column(
                                  children: [
                                    HexagonColumn(
                                      count: 2,
                                      imagePaths: imagePaths.sublist(0, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 115,
                              top: 63,
                              child: SizedBox(
                                width: 75,
                                child: Column(
                                  children: [
                                    HexagonColumn(
                                      count: 3,
                                      imagePaths: imagePaths.sublist(2, 5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 180,
                              top: 100,
                              child: SizedBox(
                                width: 75,
                                child: Column(
                                  children: [
                                    HexagonColumn(
                                      count: 3,
                                      imagePaths: imagePaths.sublist(5, 8),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 245,
                              top: 210,
                              child: SizedBox(
                                width: 75,
                                child: Column(
                                  children: [
                                    HexagonColumn(
                                      count: 1,
                                      imagePaths: imagePaths.sublist(8, 9),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 18, 0, 10),
                        child: SizedBox(
                          width: 250,
                          child: Text(
                            'Welcome to mezmur debter',
                            style: TextStyle(
                                fontFamily: 'OrelegaOne',
                                fontSize: 28,
                                color: Colors.grey[600]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 60, 60, 0),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    'assets/headphone.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 100),
                child: TextButton(
                  onPressed: () {
                    context.go('/home');
                  },
                  child: Text(
                    'click here to start',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
