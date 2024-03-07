// ignore_for_file: use_key_in_widget_constructors

import 'package:chainoftrust/presentation/screens/account.dart';
import 'package:chainoftrust/presentation/screens/artist_album.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/screens/signup.dart';
import 'presentation/screens/welcome.dart';
import 'presentation/screens/home.dart';
import 'presentation/screens/artist.dart';
import 'presentation/screens/song.dart';
import 'presentation/screens/album.dart';
import 'presentation/screens/album_song.dart';
import 'presentation/screens/lyrics.dart';
import 'logic/cubit/user_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Welcome(),
          '/signup': (context) => SignUp(),
          '/home': (context) => Home(),
          '/artist': (context) => Artist(),
          '/song': (context) => Song(),
          '/album': (context) => Album(),
          '/artistAlbum': (context) => ArtistAlbum(),
          '/albumSong': (context) => AlbumSong(),
          '/lyrics': (context) => Lyrics(),
          '/account': (context) => Account(),
        },
      ),
    );
  }
}
