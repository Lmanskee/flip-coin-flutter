import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flip_coin/screens/flip_coin_page/random_animation.dart';

class FlipCoinPage extends StatefulWidget {
  const FlipCoinPage({ Key? key }) : super(key: key);

  @override
  _FlipCoinPageState createState() => _FlipCoinPageState();
}

class _FlipCoinPageState extends State<FlipCoinPage> { 
  late RiveAnimationController _controller;

  bool _isPlaying = false;

  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      randomAnimation(),
      autoplay: false,
      onStop: () => setState(() {
        _visible = true;
        _isPlaying = false;
      }),
      onStart: () => setState(() { 
        _visible = false;
        _isPlaying = true;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    textShow(),
                    style: const TextStyle(
                      fontSize: 40
                    ),
                  )
                )
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 370,
                height: 370,
                child: GestureDetector(
                  onTap: () => _isPlaying ? null : _controller.isActive = true,
                  child: RiveAnimation.asset(
                    'assets/coinflip.riv',
                    controllers: [_controller],
                  ),
                ),
              ),
            ],
          ),
        ]
      )
    );
  }
}

String textShow() {
  if (randomAnimation() == 'CoinFlipReturnS') {
    return 'CARA';
  } else {
    return 'COROA';
  }
}