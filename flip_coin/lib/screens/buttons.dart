import 'package:flutter/material.dart';
import 'default.dart';

class PlayButton extends StatefulWidget {
  const PlayButton({ Key? key }) : super(key: key);

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      // Style: Rounded shape
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        fixedSize: buttonSize,
      ),

      // OnPressed required value => flip_coin_page
      onPressed: () {
        Navigator.of(context).pushNamed('/flip');
      },
      
      // Play Rounded Icon: button
      child: const Icon(
        Icons.play_arrow_rounded,
        color: Colors.white,
        size: 100,
      ),
    );
  }
}

class RestartButton extends StatefulWidget {
  const RestartButton({ Key? key }) : super(key: key);

  @override
  _RestartButtonState createState() => _RestartButtonState();
}

class _RestartButtonState extends State<RestartButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      // Style: Rounded shape
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        fixedSize: buttonSize,
      ),

      // OnPressed required value => flip_coin_page
      onPressed: () {
        Navigator.of(context).pushNamed('/flip');
      },
      
      // Restart Rounded Icon: button
      child: const Icon(
        Icons.restart_alt_rounded,
        color: Colors.white,
        size: 100,
      ),
    );
  }
}