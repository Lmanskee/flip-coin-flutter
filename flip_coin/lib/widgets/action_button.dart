import 'package:flutter/material.dart';
import 'package:flip_coin/default_value/default.dart';
 
class FlipCoinActionButton extends StatefulWidget {
  final Function onPressed;
  final IconData icon;
  const FlipCoinActionButton({ Key? key, required this.onPressed, required this.icon}) : super(key: key);

  @override
  State<FlipCoinActionButton> createState() => _FlipCoinActionButtonState();
}

class _FlipCoinActionButtonState extends State<FlipCoinActionButton> {
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
        widget.onPressed;
      },
      
      child: Icon(
        widget.icon,
        color: Colors.white,
        size: 100,
      ),
    );
  }
}