// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:lyrical/screens/albums.dart';
import 'package:lyrical/screens/home.dart';
import 'package:lyrical/screens/logo.dart';
import 'package:lyrical/screens/lyrics.dart';
import 'package:lyrical/screens/allSongs.dart';
import 'package:lyrical/screens/songsList.dart';
import 'package:lyrical/screens/singers.dart';
import 'package:lyrical/screens/kidsSong.dart';
import 'package:lyrical/screens/englishSong.dart';
import 'package:lyrical/screens/favorite.dart';
import 'package:lyrical/screens/menu.dart';
import 'package:lyrical/screens/newSongs.dart';
import 'package:lyrical/screens/searchAll.dart';

void main() {
  runApp(Lyrical());
}

class Lyrical extends StatelessWidget {
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
