import 'package:flutter/material.dart';
import 'home_page.dart';
import 'flip_coin_page.dart';
import 'restart_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      initialRoute: '/',
      routes: {
        '/':(context) => const HomePage(),
        '/flip':(context) => const FlipCoinPage(),
        '/restart':(context) => const RestartPage(),
      },
    );
  }
}