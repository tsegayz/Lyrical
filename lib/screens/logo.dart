// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/screens/home.dart';

class Logo extends StatefulWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, '/home');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(186, 14, 82, 114),
      body: Builder(
        builder: (BuildContext context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 130.0, 0, 0),
                child: Image.asset('assets/home.png'),
              ),
              RotatedBox(
                quarterTurns: -1,
                child: Text(
                  'Lyrical',
                  style: GoogleFonts.mrDeHaviland(
                    textStyle: TextStyle(
                      fontSize: 120,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
