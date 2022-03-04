import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:flip_coin/screens/default.dart';

class FlipCoinPage extends StatefulWidget {
  const FlipCoinPage({ Key? key }) : super(key: key);

  @override
  _FlipCoinPageState createState() => _FlipCoinPageState();
}

class _FlipCoinPageState extends State< FlipCoinPage> { 
  SMIInput<bool>? _isPlayingInput;
  SMIInput<bool>? _isRestartingInput;
  SMIInput<double>? _randomNumberInput;
  Artboard? _coinFlipArtboard;

  bool _isButtonVisible = true;
  bool _isRestartButton = false;

  void _playCoinFlipAnimation() {
    _randomNumberInput?.value = (1 + Random().nextInt(2).toDouble());

    print(_isPlayingInput?.controller.isActive);
    print(_isRestartingInput?.controller.isActive);

    if (_isPlayingInput?.value == false &&
        _isPlayingInput?.controller.isActive == false &&
        _isRestartingInput?.value == false &&
        _isRestartingInput?.controller.isActive == false) { 

      _isPlayingInput?.value = true;
    }  
    else if (_isPlayingInput?.value == true &&
        _isPlayingInput?.controller.isActive == false &&
        _isRestartingInput?.value == false &&
        _isRestartingInput?.controller.isActive == false) {

      _isPlayingInput?.value = false;
      _isRestartingInput?.value = true;
      _isRestartButton = false;
    } 
    else if (_isPlayingInput?.value == false &&
        _isPlayingInput?.controller.isActive == false &&
        _isRestartingInput?.value == true &&
        _isRestartingInput?.controller.isActive == false) {

      _isPlayingInput?.value = true;
      _isRestartingInput?.value = false;
      _isRestartButton = true;
    }
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
        _randomNumberInput = controller.findInput('randomNumber');
        _isPlayingInput?.value = false;
        _isPlayingInput?.controller.isActive = false;
        _isRestartingInput?.value = false;
        _isRestartingInput?.controller.isActive = false;

        _randomNumberInput?.value = 0;
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
                  _isButtonVisible = false;
                  _playCoinFlipAnimation();
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