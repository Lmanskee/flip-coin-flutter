import 'package:flutter/material.dart';
import 'package:flip_coin/screens/default.dart';

class RouteChangeButton extends StatelessWidget {
  final icon;
  final onPressed;
  
  const RouteChangeButton({ 
    Key? key, 
    this.icon, 
    this.onPressed 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        fixedSize: buttonSize,
      ),

      onPressed: () {
        Navigator.of(context).pushNamed(onPressed);
      },
      
      child: Icon(
        icon,
        color: Colors.white,
        size: 100,
      ),
    );
  }
}


class PlayAnimationButton extends StatelessWidget {
  final icon;
  final onPressedFunction;
  
  const PlayAnimationButton({ 
    Key? key, 
    this.icon, 
    this.onPressedFunction 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        fixedSize: buttonSize,
      ),

      onPressed: () {
        onPressedFunction();
      },
      
      child: Icon(
        icon,
        color: Colors.white,
        size: 100,
      ),
    );
  }
}