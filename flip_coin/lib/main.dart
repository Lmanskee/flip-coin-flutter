import 'package:flutter/material.dart';
import 'package:flip_coin/screens/home_page/home_page.dart';
import 'package:flip_coin/screens/flip_coin_page/flip_coin_page.dart';
import 'package:flip_coin/screens/default.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: mainAppColor,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const HomePage(),
        '/flip':(context) => const FlipCoinPage(),
      },
    );
  }
}