import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
  late final UserCubit _userCubit;
  late final GoRouter _router;

  @override
  void initState() {
    _userCubit = UserCubit();
    _router = GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
          path: '/',
          builder: ((context, state) => Welcome()),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => BlocProvider.value(
            value: _userCubit,
            child: SignUp(),
          ),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => BlocProvider.value(
            value: _userCubit,
            child: Home(),
          ),
        ),
        GoRoute(
          path: '/artist',
          builder: (context, state) => BlocProvider.value(
            value: _userCubit,
            child: Artist(),
          ),
        ),
        GoRoute(
          path: '/song',
          builder: ((context, state) => Song()),
        ),
        GoRoute(
          path: '/album',
           builder: (context, state) => BlocProvider.value(
            value: _userCubit,
            child: Album(),
          ),
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
    super.initState();
  }

  @override
  void dispose() {
    _userCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
