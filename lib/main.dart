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

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserCubit _userCubit = UserCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(),
        '/signup': (context) => BlocProvider.value(
              value: _userCubit,
              child: SignUp(),
            ),
        '/home': (context) => BlocProvider.value(
              value: _userCubit,
              child: Home(),
            ),
        '/artist': (context) => BlocProvider.value(
              value: _userCubit,
              child: Artist(),
            ),
        '/song': (context) => Song(),
        '/album': (context) => BlocProvider.value(
              value: _userCubit,
              child: Album(),
            ),
        '/artistAlbum': (context) => BlocProvider.value(
              value: _userCubit,
              child: ArtistAlbum(),
            ),
        '/albumSong': (context) => AlbumSong(),
        '/lyrics': (context) => Lyrics(),
        '/account': (context) => BlocProvider.value(
              value: _userCubit,
              child: Account(),
            ),
      },
    );
  }

  @override
  void dispose() {
    _userCubit.close();
    super.dispose();
  }
}
