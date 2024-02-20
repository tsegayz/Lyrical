// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'hexagon.dart';

class SignUp extends StatelessWidget {
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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 88, 88, 88),
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
              child: Text(
                'Mezmur debter',
                style: TextStyle(
                  fontFamily: 'OrelegaOne',
                  fontSize: 20,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
        body: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Stack(
                  children: [
                    Positioned(
                      left: 70,
                      top: 5,
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
                      left: 135,
                      top: 43,
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
                      left: 200,
                      top: 80,
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
                      left: 265,
                      top: 192,
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
              Expanded(
                flex: 8,
                child: Container(
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
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'Sign up',
                            style: TextStyle(
                              fontFamily: 'OrelegaOne',
                              fontSize: 30,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.grey[600]),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 18, 22, 58),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 209, 209, 209),
                                ),
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 248, 248, 248),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.grey[600]),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 18, 22, 58),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 209, 209, 209),
                                ),
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 248, 248, 248),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 7, 25, 46),
                              ),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}