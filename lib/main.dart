import 'package:flutter/material.dart';
import 'package:musicplayer_flutter/screens/home_screen.dart';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';
import 'package:musicplayer_flutter/screens/playlist_screen.dart';
import 'package:musicplayer_flutter/screens/song_screen.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white
          )),
      debugShowCheckedModeBanner: false,
      home:  MyHomeScreen(),
      getPages: [
        GetPage(name: '/', page: ()=>const MyHomeScreen()),
        GetPage(name: '/song', page: ()=>const SongScreen()),
        GetPage(name: '/playlist', page: ()=>const PlayListScreen()),

      ],
    );
  }
}




