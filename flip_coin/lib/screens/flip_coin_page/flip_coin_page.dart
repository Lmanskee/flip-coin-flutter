import 'dart:math';
import 'package:flip_coin/screens/default.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class FlipCoinPage extends StatefulWidget {
  const FlipCoinPage({ Key? key }) : super(key: key);

  @override
  _FlipCoinPageState createState() => _FlipCoinPageState();
}

class _FlipCoinPageState extends State< FlipCoinPage> { 
  // CoinFlipAnimation Inputs
  SMITrigger? _playInput;
  SMINumber? _randomNumberInput;
  
  bool _isButtonVisible = true;
  
  // CoinFlipAnimationInit
  void _onCoinFlipInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard, 
      'CoinFlip',
    );
    artboard.addController(controller!);

    _playInput = controller.findInput<bool>('Play') as SMITrigger;
    _randomNumberInput = controller.findInput<double>('RandomNumber') as SMINumber;
  }

  _playAnimation() {
    _randomNumberInput?.value = (1 + Random().nextInt(2).toDouble());
    _playInput?.fire();
    // Adicionar lógica para mudar de tela logo após a animação ter rodado.
  }

  _navigateToRestartPage() async {
    await Future.delayed(const Duration(milliseconds: 5500), () {});
    Navigator.of(context).pushNamed('/');
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

          AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: _isButtonVisible ? 1.0 : 0.0,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                fixedSize: buttonSize,
              ),

              onPressed: () {
                _playAnimation();
                _navigateToRestartPage();
                _isButtonVisible = !_isButtonVisible;
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