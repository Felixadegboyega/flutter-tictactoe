import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home.dart';
import 'package:tic_tac_toe/new_players.dart';
import 'package:tic_tac_toe/playground.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/new-players': (context) => const NewPlayers(),
        '/playground': (context) => const PlayGround(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(
        fontFamily: 'Tfont',
        primarySwatch: Colors.blue,
      ),
    );
  }
}
