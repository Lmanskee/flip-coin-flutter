import 'dart:math';

import 'package:flip_coin/controller/current_animation_controller.dart';
import 'package:flip_coin/default_value/default.dart';
import 'package:flip_coin/screens/skin_page/skin_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkinPage extends StatefulWidget {
  const SkinPage({ Key? key }) : super(key: key);

  @override
  State<SkinPage> createState() => _SkinPageState();
}

class _SkinPageState extends State<SkinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  bottom: 25
                ),
        
                child: TextButton(
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 28,
                        color: Colors.white,
                      ),
        
                      SizedBox(
                        width: 8,
                      ),
        
                      Text(
                        "Let's flip",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          letterSpacing: -1
                        ),
                      ),
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
                    Navigator.of(context).pushNamed('/flip');
                  },
                ),
              )
            ],
          ),
        
          SkinsButton(
            imagePath: 'assets/pngs/default.png',
            onPressed: () async {
              await context.read<CurrentAnimationController>().writeCurrentAnimation('assets/coinflip-default.riv');
              Navigator.of(context).pushReplacementNamed('/flip');
            },
            heigth: 280,
            width: 280,
          ),
          
          const SizedBox(
            height: 28,
          ),
        
          SkinsButton(
            imagePath: 'assets/pngs/half-dollar.png',
            onPressed: () async {
              await context.read<CurrentAnimationController>().writeCurrentAnimation('assets/coinflip-half-dollar.riv');
              Navigator.of(context).pushReplacementNamed('/flip');
            },
            heigth: 280,
            width: 280,
          ),
          
          const SizedBox(
            height: 28,
          ),
        
          SkinsButton(
            imagePath: 'assets/pngs/one-real.png',
            onPressed: () {
              context.read<CurrentAnimationController>().writeCurrentAnimation('assets/coinflip-one-real.riv');
              Navigator.of(context).pushReplacementNamed('/flip');
            },
            heigth: 280,
            width: 280,
          ),
          
          const SizedBox(
            height: 28,
          ),
        
          SkinsButton(
            imagePath: 'assets/pngs/default.png',
            onPressed: () {
              context.read<CurrentAnimationController>().writeCurrentAnimation('assets/coinflip-half-dollar.riv');
              Navigator.of(context).pushReplacementNamed('/flip');
            },
            heigth: 280,
            width: 280,
          ),

          const SizedBox(
            height: 45,
          ),
        ],
      )
    );
  }
}