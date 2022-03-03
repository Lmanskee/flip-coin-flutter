import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flip_coin/screens/flip_coin_page/random_animation.dart';

class FlipCoinPage extends StatefulWidget {
  const FlipCoinPage({ Key? key }) : super(key: key);

  @override
  _FlipCoinPageState createState() => _FlipCoinPageState();
}

class _FlipCoinPageState extends State<FlipCoinPage> { 
  late RiveAnimationController _startAnimationController;

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _startAnimationController = OneShotAnimation(
      randomAnimation(),
      autoplay: false,
      onStop: () => setState(() {
        _isPlaying = false;
      }),
      onStart: () => setState(() { 
        _isPlaying = true;      
      }),
    );
  }

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 370,
                height: 370,
                child: GestureDetector(
                  onTap: () => _isPlaying ? null : _startAnimationController.isActive = true,
                  child: RiveAnimation.asset(
                    'assets/coinflip.riv',
                    controllers: [_startAnimationController],
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