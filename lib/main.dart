// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'signup.dart';
import 'welcome.dart';
import 'home.dart';
import 'artist.dart';
import 'song.dart';
import 'album.dart';
import 'albumSong.dart';
import 'lyrics.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Lyrics(),
  ));
}
