import 'package:flutter/material.dart';
import 'package:flip_coin/screens/default.dart';

class PlayButton extends StatefulWidget {
  const PlayButton({ Key? key }) : super(key: key);

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
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
        Navigator.of(context).pushNamed('/flip');
      },
      
      child: const Icon(
        Icons.play_arrow_rounded,
        color: Colors.white,
        size: 100,
      ),
    );
  }
}