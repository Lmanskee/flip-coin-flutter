import 'package:flutter/material.dart';

class FlipCoinPage extends StatefulWidget {
  const FlipCoinPage({ Key? key }) : super(key: key);

  @override
  _FlipCoinPageState createState() => _FlipCoinPageState();
}

class _FlipCoinPageState extends State<FlipCoinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Tela 2')
        ],
      )
    );
  }
}