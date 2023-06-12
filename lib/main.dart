// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:practice/screens/albums.dart';
import 'package:practice/screens/home.dart';
import 'package:practice/screens/logo.dart';
import 'package:practice/screens/lyrics.dart';
import 'package:practice/screens/allSongs.dart';
import 'package:practice/screens/songsList.dart';
import 'package:practice/screens/singers.dart';
import 'package:practice/screens/kidsSong.dart';
import 'package:practice/screens/englishSong.dart';
import 'package:practice/screens/favorite.dart';
import 'package:practice/screens/menu.dart';
import 'package:practice/screens/newSongs.dart';
import 'package:practice/screens/searchAll.dart';

import 'package:go_router/go_router.dart';

void main() {
  runApp(Enzemer());
}

class Enzemer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        routeInformationProvider: _router.routeInformationProvider,
      );

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Logo(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => Home(),
      ),
      GoRoute(
        path: '/lyrics',
        builder: (context, state) => Lyrics(),
      ),
      GoRoute(
        path: '/songList',
        builder: (context, state) => SongList(),
      ),
      GoRoute(
        path: '/allSongs',
        builder: (context, state) => AllSongs(),
      ),
      GoRoute(
        path: '/englishsongs',
        builder: (context, state) => EnglishSong(),
      ),
      GoRoute(
        path: '/kidsSong',
        builder: (context, state) => KidsSong(),
      ),
      GoRoute(
        path: '/favorite',
        builder: (context, state) => Favorite(),
      ),
      GoRoute(
        path: '/singers',
        builder: (context, state) => Singers(),
      ),
      GoRoute(
        path: '/albums',
        builder: (context, state) => Albums(),
      ),
      GoRoute(
        path: '/menu',
        builder: (context, state) => Menu(),
      ),
      GoRoute(
        path: '/newSongs',
        builder: (context, state) => NewSongs(),
      ),
      GoRoute(
        path: '/searchAll',
        builder: (context, state) => SearchAll(),
      ),
    ],
  );
}
