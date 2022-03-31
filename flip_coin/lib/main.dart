import 'package:flip_coin/current_animation_manager/controller/current_animation_controller.dart';
import 'package:flip_coin/screens/home_page/home_page.dart';
import 'package:flip_coin/screens/flip_coin_page/flip_coin_page.dart';
import 'package:flip_coin/screens/skin_page/skin_page.dart';
import 'package:flip_coin/default_values/default.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart'; 

void main() { 
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CurrentAnimationController())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: mainAppColor,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const HomePage(),
        '/flip':(context) => const FlipCoinPage(),
        '/skins':(context) => const SkinPage()
      },
    );
  }
}