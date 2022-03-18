import 'dart:math';
import 'package:flip_coin/screens/default.dart';
import 'package:flip_coin/screens/skin_page/skin_page.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';



String _riveAnimation = 'assets/coins/coinflip-default.riv'; 

class FlipCoinPage extends StatefulWidget {
  const FlipCoinPage({ Key? key }) : super(key: key);

  @override
  _FlipCoinPageState createState() => _FlipCoinPageState();
}

class _FlipCoinPageState extends State< FlipCoinPage> { 
  SMITrigger? _playInput;
  SMITrigger? _restartInput;
  SMINumber? _randomNumberInput;
  
  // Valores booleanos que lidam com a lógica da animação feita com Rive (novo Flare)
  // e com as funções empregadas pelos botões que alteram o State da animação no StateMachine.
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
          await Future.delayed(const Duration(milliseconds: 1300));
          Navigator.of(context).pushNamed('/flip');
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
                  _riveAnimation, // Add function that returns a link for a coin skin
                  fit: BoxFit.cover,
                  onInit: _onCoinFlipInit,
                )
              ),
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
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/skins');
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}