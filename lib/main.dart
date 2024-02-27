// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'presentation/screens/signup.dart';
import 'presentation/screens/welcome.dart';
import 'presentation/screens/home.dart';
import 'presentation/screens/artist.dart';
import 'presentation/screens/song.dart';
import 'presentation/screens/album.dart';
import 'presentation/screens/album_song.dart';
import 'presentation/screens/lyrics.dart';

void main() {
  final GoRouter _router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: '/',
        builder: ((context, state) => Welcome()),
      ),
      GoRoute(
        path: '/signup',
        builder: ((context, state) => SignUp()),
      ),
      GoRoute(
        path: '/home',
        builder: ((context, state) => Home()),
      ),
      GoRoute(
        path: '/artist',
        builder: ((context, state) => Artist()),
      ),
      GoRoute(
        path: '/song',
        builder: ((context, state) => Song()),
      ),
      GoRoute(
        path: '/album',
        builder: ((context, state) => Album()),
      ),
      GoRoute(
        path: '/albumSong',
        builder: ((context, state) => AlbumSong()),
      ),
      GoRoute(
        path: '/lyrics',
        builder: ((context, state) => Lyrics()),
      ),
    ],
  );

  runApp(MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: _router,
  ));
}
