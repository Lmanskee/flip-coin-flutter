import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:flip_coin/screens/flip_coin_page/random_animation.dart';
import 'package:flip_coin/screens/default.dart';

class FlipCoinPage extends StatefulWidget {
  const FlipCoinPage({ Key? key }) : super(key: key);

  @override
  _FlipCoinPageState createState() => _FlipCoinPageState();
}

class _FlipCoinPageState extends State<FlipCoinPage> { 
  SMIInput<bool>? _isPlayingInput;
  SMIInput<bool>? _isRestartingInput;
  SMIInput<bool>? _isNumberInput;
  Artboard? _coinFlipArtboard;

  void _playCoinFlipAnimation() {

  }

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/coinflip.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;

      var controller = StateMachineController.fromArtboard(
        artboard,
        'CoinFlipAnimation',
      );

      if (controller != null) {
        artboard.addController(controller);
        _isPlayingInput = controller.findInput('isPlaying');
        _isRestartingInput = controller.findInput('isRestarting');
        _isNumberInput = controller.findInput('Number');
      }

      setState(() => _coinFlipArtboard = artboard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _coinFlipArtboard == null
          ? const SizedBox()
          : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 370,
                width: 370,
                child: Rive(
                  artboard: _coinFlipArtboard!,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),

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
        ]
      )
    );
  }
}