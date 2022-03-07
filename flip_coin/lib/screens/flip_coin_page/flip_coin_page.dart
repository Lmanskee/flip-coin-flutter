import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';


class FlipCoinPage extends StatefulWidget {
  const FlipCoinPage({ Key? key }) : super(key: key);

  @override
  _FlipCoinPageState createState() => _FlipCoinPageState();
}

class _FlipCoinPageState extends State< FlipCoinPage> { 
  // CoinFlipAnimation Inputs
  SMITrigger? _PlayInput;
  SMITrigger? _RestartInput;
  SMINumber? _randomNumberInput;

  // PlayPauseButtonAnimation Inputs
  SMIBool? _isPlayingInput; 

  bool _isRestartButton = false;

  // CoinFlipAnimationInit
  void _onCoinFlipInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard, 
      'CoinFlip',
    );
    artboard.addController(controller!);

    _PlayInput = controller.findInput<bool>('Play') as SMITrigger;
    _RestartInput = controller.findInput<bool>('Restart') as SMITrigger;
    _randomNumberInput = controller.findInput<double>('RandomNumber') as SMINumber;
  }

  void _playCoinFlipAnimation() {
    _randomNumberInput?.value = (1 + Random().nextInt(2).toDouble());
    
    if (_isRestartButton == false) {
      _PlayInput?.fire();
    } else {
      _RestartInput?.fire();
    }
  }

  // PlayPauseButtonInit
  void _onPlayPauseButtonInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard, 
      'PlayPauseButton',
    );
    artboard.addController(controller!);

    _isPlayingInput = controller.findInput<bool>('isPlaying') as SMIBool;
  }

  void _playPauseButtonAnimation() {
    if (_isPlayingInput?.value == false &&
        _isPlayingInput?.controller.isActive == false) {
      _isPlayingInput?.value = true;
      _isRestartButton = false;
    } else if (_isPlayingInput?.value == true &&
        _isPlayingInput?.controller.isActive == false) {
      _isPlayingInput?.value = false;
      _isRestartButton = true;
    }
  }
  
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
                height: 370,
                width: 370,
                child: RiveAnimation.asset(
                  'assets/coinflip.riv',
                  fit: BoxFit.cover,
                  onInit: _onCoinFlipInit,
                )
              ),
            ],
          ),

          GestureDetector(
            child: SizedBox(
              height: 150,
              width: 150  ,
              child: RiveAnimation.asset(
                'assets/playpausebutton.riv',
                fit: BoxFit.cover,
                onInit: _onPlayPauseButtonInit,
              ),
            ),
            onTap: () {
              setState(() {
                _playCoinFlipAnimation();
                _playPauseButtonAnimation();
              });
            })
        ]
      )
    );
  }
}