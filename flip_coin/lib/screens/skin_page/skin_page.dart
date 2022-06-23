import 'package:flip_coin/current_animation_manager/controller/current_animation_controller.dart';
import 'package:flip_coin/default_values/default.dart';
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
          
          // SkinsButton repetidos...
          // Criar um for loop passando arquivo PNG + arquivo RIV

          SkinsButton(
            imagePath: 'assets/pngs/default-coin.png',
            onPressed: () async {
              await context.read<CurrentAnimationController>().writeCurrentAnimation('assets/rivs/default-coin-animation.riv');
              Navigator.of(context).pushReplacementNamed('/flip');
            },
            heigth: 280,
            width: 280,
          ),
          
          const SizedBox(
            height: 28,
          ),
        
          SkinsButton(
            imagePath: 'assets/pngs/heart-coin.png',
            onPressed: () async {
              await context.read<CurrentAnimationController>().writeCurrentAnimation('assets/rivs/heart-coin-animation.riv');
              Navigator.of(context).pushReplacementNamed('/flip');
            },
            heigth: 280,
            width: 280,
          ),
          
          const SizedBox(
            height: 28,
          ),
        
          SkinsButton(
            imagePath: 'assets/pngs/one-real-coin.png',
            onPressed: () {
              context.read<CurrentAnimationController>().writeCurrentAnimation('assets/rivs/one-real-animation.riv');
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
            onPressed: () {
              context.read<CurrentAnimationController>().writeCurrentAnimation('assets/rivs/half-dollar-animation.riv');
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
