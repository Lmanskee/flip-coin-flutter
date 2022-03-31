import 'package:flip_coin/default_values/default.dart';

import 'package:flutter/material.dart';

class SkinsButton extends StatefulWidget {
  final Function() onPressed;
  final double width;
  final double heigth;
  final String imagePath;

  const SkinsButton({ 
    Key? key,
    required this.onPressed,
    required this.width,
    required this.heigth,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<SkinsButton> createState() => _SkinsButtonState();
}

class _SkinsButtonState extends State<SkinsButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: mainAppColorDarker,
        elevation: 28,
        borderRadius: BorderRadius.circular(80),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          splashColor: buttonColor,
          onTap: widget.onPressed,
          child: Ink.image(
            image: AssetImage(
              widget.imagePath
            ),
            height: widget.heigth,
            width: widget.width,
            fit: BoxFit.cover 
          ), 
        ),
      ),
    );
  }
}