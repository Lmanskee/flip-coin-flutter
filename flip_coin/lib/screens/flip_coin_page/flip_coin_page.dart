import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flip_coin/screens/flip_coin_page/random_animation.dart';
import 'package:flip_coin/screens/default.dart';

class FlipCoinPage extends StatefulWidget {
  const FlipCoinPage({ Key? key }) : super(key: key);

  @override
  _FlipCoinPageState createState() => _FlipCoinPageState();
}

class _FlipCoinPageState extends State<FlipCoinPage> { 
  late RiveAnimationController _startAnimationController;
  late RiveAnimationController _restartAnimationController;

  bool _isAnimationPlaying = false;
  bool _isButtonVisible = true;
  bool _isRestartButton = false;

  var currentAnimation = randomAnimation();

  @override
  void initState() {
    super.initState();
    _startAnimationController = OneShotAnimation(
      currentAnimation,
      autoplay: false,
      onStop: () => setState(() {
        _isAnimationPlaying = false;
        _isButtonVisible = true;
        if (currentAnimation == 'CoinFlipStartsSReturnC') {
          _isRestartButton = true;
        }
      }),
      onStart: () => setState(() { 
        _isAnimationPlaying = true;
        _isButtonVisible = false;
      }),
    );

    _restartAnimationController = OneShotAnimation(
      'RestartFromCToS',
      autoplay: false,
      onStop: () => setState(() {
        _isButtonVisible = true;
        _isRestartButton = false;
      }),
      onStart: () => setState(() { 
        _isButtonVisible = false;
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
                child: RiveAnimation.asset(
                  'assets/coinflip.riv',
                  controllers: [_startAnimationController, _restartAnimationController],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: _isButtonVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    fixedSize: buttonSize,
                  ),
              
                  onPressed: () {
                    setState(() {
                      if (_isRestartButton) {
                        _restartAnimationController.isActive = true;
                      } else {
                        _startAnimationController.isActive = true;
                      }
                    });
                  },

                  child: Icon(
                    _isRestartButton? Icons.restart_alt_rounded: Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              )
            ],
          ),
        ]
      )
    );
  }
}