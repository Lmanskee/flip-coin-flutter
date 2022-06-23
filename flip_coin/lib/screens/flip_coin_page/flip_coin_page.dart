import 'package:flip_coin/current_animation_manager/controller/current_animation_controller.dart';
import 'package:flip_coin/default_values/default.dart';

import 'dart:math';

import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlipCoinPage extends StatefulWidget {
  const FlipCoinPage({ Key? key }) : super(key: key);

  @override
  _FlipCoinPageState createState() => _FlipCoinPageState();
}

class _FlipCoinPageState extends State<FlipCoinPage> { 
  SMITrigger? _playInput;
  SMITrigger? _restartInput;
  SMINumber? _randomNumberInput;

  bool _isButtonVisible = true;
  bool _isRestartButton = false;
  bool _isPlayButtonDisabled = false;
  bool _isRestartButtonDisabled = false;


  void _onCoinFlipInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard, 
      'CoinFlip',
    );
    artboard.addController(controller!);

    _playInput = controller.findInput<bool>('Play') as SMITrigger;
    _restartInput = controller.findInput<bool>('Restart') as SMITrigger;
    _randomNumberInput = controller.findInput<double>('RandomNumber') as SMINumber;
  }


  _playAnimation() {
    _randomNumberInput?.value = (1 + Random().nextInt(2).toDouble());
    _playInput?.fire();
    /* Play an audio file. Exc.: finish audio */
  }


  _restartAnimation() {
    _restartInput?.fire();
  }


  _showRestartButton() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _isButtonVisible ? 1.0 : 0.0, 
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          fixedSize: buttonSize,
        ),

        onPressed: _isRestartButtonDisabled
        ? null
        : () async {
          _restartAnimation();
          setState(() {
            _isRestartButtonDisabled = true;
            _isButtonVisible = false;
          });
          await Future.delayed(const Duration(milliseconds: 1000));
          Navigator.of(context).pushReplacementNamed('/flip');
        },

        child: const Icon(
          Icons.replay_rounded,
          color: Colors.white,
          size: 100,
        )
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    context.read<CurrentAnimationController>().readCurrentAnimation();
    return Scaffold(
      body: Column(
        children: [
          // Change coin button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  right: 30
                ),
    
                child: TextButton(
                  child: Row(
                    children: const [
                      Text(
                        "Change coin",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          letterSpacing: -1
                        ),
                      ),

                      SizedBox(
                        width: 8,
                      ),

                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 28,
                        color: Colors.white,
                      )
                    ],
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: buttonColor,
                    padding: const EdgeInsets.all(16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40)
                      )
                    ),       
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/skins');
                  },
                ),
              )
            ],
          ),
    
    
          Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: RiveAnimation.asset(
                  context.select(
                    (CurrentAnimationController controller) => controller.curAnimation != null 
                      ? controller.curAnimation!.currentAnimation
                      : 'assets/rivs/default-coin-animation.riv'
                  ), 
                  fit: BoxFit.cover,
                  onInit: _onCoinFlipInit,
                )
              )
            ],
          ),

    
          _isRestartButton? 
          _showRestartButton()
          : AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _isButtonVisible ? 1.0 : 0.0,
            child: TextButton(
              
              style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                fixedSize: buttonSize,
              ),
    
              onPressed: _isPlayButtonDisabled 
              ? null
              : () async {
                _playAnimation();
                setState(() {
                  _isButtonVisible = false;
                  _isPlayButtonDisabled = true;                  
                });
              
                await Future.delayed(const Duration(milliseconds: 5200));
                _isRestartButton = true;
                setState(() {
                  _isButtonVisible = true;
                });
              },
              
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 100,
              ),
            )
          ),
        ]           
      )
    );
  }
}