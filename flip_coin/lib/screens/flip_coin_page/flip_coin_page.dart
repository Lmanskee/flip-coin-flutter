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
  SMIInput<bool>? _PlayInput;
  SMIInput<bool>? _RestartInput;
  SMIInput<double>? _randomNumberInput;
  Artboard? _coinFlipArtboard;
  
  bool _isButtonVisible = true;
  bool _isRestartButton = false;

  void _playCoinFlipAnimation() {
    _randomNumberInput?.value = (1 + Random().nextInt(2).toDouble());

    if (_PlayInput?.value == false &&
        _PlayInput?.controller.isActive == false &&
        _RestartInput?.value == false &&
        _RestartInput?.controller.isActive == false) {
      _PlayInput?.value = true; 
    } else if (_PlayInput?.value == true &&
               _PlayInput?.controller.isActive == false &&
               _RestartInput?.value == false &&
               _RestartInput?.controller.isActive == false) {
      _PlayInput?.value = false;
      _RestartInput?.value = true;
    } else if (_PlayInput?.value == false &&
               _PlayInput?.controller.isActive == false &&
               _RestartInput?.value == true &&
               _RestartInput?.controller.isActive == false) {
      _RestartInput?.value = true;
      _PlayInput?.value = false;
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
        'CoinFlip',
      );

      if (controller != null) {
        artboard.addController(controller);
        _PlayInput = controller.findInput('Play');
        _RestartInput = controller.findInput('Restart');
        _randomNumberInput = controller.findInput('RandomNumber');
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