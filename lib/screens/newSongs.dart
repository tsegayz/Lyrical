// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewSongs extends StatelessWidget {

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        elevation: 0.0,
        title: Center(
          child: Text(
            "New Songs",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [],
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          // ignore: prefer_const_literals_to_create_immutables
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
                color: Color.fromARGB(255, 0, 27, 50),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.music_note,
                size: 25,
                color: Color.fromARGB(255, 0, 27, 50),
              ),
              label: 'New Songs',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 25,
                color: Color.fromARGB(255, 0, 27, 50),
              ),
              label: 'All Songs',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 25,
                color: Color.fromARGB(255, 0, 27, 50),
              ),
              label: 'Menu',
              // backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 0, 27, 50),
          onTap: (index) {
            switch (index) {
              case 0:
                GoRouter.of(context).go('/');
                break;
              case 1:
                GoRouter.of(context).go('/newSongs');
                break;
              case 2:
                GoRouter.of(context).go('/searchAll');
                break;
              case 3:
                GoRouter.of(context).go('/menu');
                break;
            }
            _selectedIndex = index;
          }),
    );
  }
}
