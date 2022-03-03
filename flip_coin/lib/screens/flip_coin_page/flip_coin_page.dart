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


  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      randomAnimation(),
      autoplay: false,
      onStop: () => setState(() {
        _isPlaying = false;
        if (randomAnimation() == 'CoinFlipReturnC') {

        }
      }),
      onStart: () => setState(() { 
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

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
            ],
          )
        ]
      )
    );
  }
}