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
      appBar: AppBar(
        title: Text("Lottie Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Lottie.asset(
                  'assets/coin.json'),
            ),
          ],
        ),
      ),
    );
  }
}
