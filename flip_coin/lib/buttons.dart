import 'package:flutter/material.dart';
import 'default.dart';
import 'flip_coin_page.dart';

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