import 'package:flutter/material.dart';
import 'package:flip_coin/screens/home_page/home_page.dart';
import 'package:flip_coin/screens/flip_coin_page/flip_coin_page.dart';
import 'package:flip_coin/screens/restart_page/restart_page.dart';

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