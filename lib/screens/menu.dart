// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Menu extends StatelessWidget {

  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        elevation: 0.0,
        title: Center(
          child: Text(
            "Menu",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                "Connect with us",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
            Row(
              children: [
                Icon(Icons.library_music_rounded),
                SizedBox(
                  width: 15,
                ),
                Text("Send us lyrics")
              ],
            ),
            SizedBox(
              height: 28,
            ),
            Row(
              children: [
                Icon(Icons.feedback_rounded),
                SizedBox(
                  width: 15,
                ),
                Text("Feedback")
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, bottom: 15),
              child: Text(
                "Policies",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
            Row(
              children: [
                Icon(Icons.privacy_tip),
                SizedBox(
                  width: 15,
                ),
                Text("Privacy policy")
              ],
            ),
            SizedBox(
              height: 28,
            ),
            Row(
              children: [
                Icon(Icons.info_outline),
                SizedBox(
                  width: 15,
                ),
                Text("About")
              ],
            ),
            SizedBox(
              height: 28,
            ),
            Row(
              children: [
                Icon(Icons.share),
                SizedBox(
                  width: 15,
                ),
                Text("Share app")
              ],
            ),
            SizedBox(
              height: 28,
            ),
            Row(
              children: [
                Icon(Icons.star_border_outlined),
                SizedBox(
                  width: 15,
                ),
                Text("Rate and preview")
              ],
            ),
          ],
        ),
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
