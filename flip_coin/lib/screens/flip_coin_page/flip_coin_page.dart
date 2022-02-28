import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FlipCoinPage extends StatefulWidget {
  const FlipCoinPage({ Key? key }) : super(key: key);

  @override
  _FlipCoinPageState createState() => _FlipCoinPageState();
}

class _FlipCoinPageState extends State<FlipCoinPage> {
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: ListView(
        children: [
          Lottie.asset('assets/coin.json'),
          
        ],
      ),
    );
  }
}