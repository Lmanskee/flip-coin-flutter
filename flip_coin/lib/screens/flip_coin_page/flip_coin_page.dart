import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flip_coin/screens/buttons.dart';

class FlipCoinPage extends StatefulWidget {
  const FlipCoinPage({ Key? key }) : super(key: key);

  @override
  _FlipCoinPageState createState() => _FlipCoinPageState();
}

class _FlipCoinPageState extends State< FlipCoinPage> { 
  // CoinFlipAnimation Inputs
  SMITrigger? _PlayInput;
  SMINumber? _RandomNumberInput;

  // CoinFlipAnimationInit
  void _onCoinFlipInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard, 
      'CoinFlip',
    );
    artboard.addController(controller!);

    _PlayInput = controller.findInput<bool>('Play') as SMITrigger;
    _RandomNumberInput = controller.findInput<double>('RandomNumber') as SMINumber;
  }

  _playAnimation() {
    _PlayInput?.fire();
    // Adicionar lógica para mudar de tela logo após a animação ter rodado.
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
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: RiveAnimation.asset(
                  'assets/coinflip.riv',
                  fit: BoxFit.cover,
                  onInit: _onCoinFlipInit,
                )
              ),
            ],
          ),

          Container(
            alignment: Alignment.center,
            child: PlayAnimationButton(
              icon: Icons.replay_rounded,
              onPressedFunction: _playAnimation(),
            ),
          ),
        ]
      )
    );
  }
}