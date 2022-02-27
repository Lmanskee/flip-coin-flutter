import 'package:flutter/material.dart';
import '../buttons.dart';
import '../default.dart';
import 'custom_rounded_clipper.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CustomRoundedClipper(),
                child: Container(
                  color: buttonColor,
                  height: 400,
                  alignment: Alignment.center,
                  child: RichText(
                    text: const TextSpan(
                      children: 
                      <TextSpan>[
                        TextSpan(text: 'Coin\n', style: TextStyle(
                          fontFamily: "Montserrat", 
                          fontSize: 56,
                          letterSpacing: -1,
                          fontWeight: FontWeight.bold,
                        )),
                
                        TextSpan(text: 'Flip', style: TextStyle(
                          fontFamily: "Montserrat", 
                          fontSize: 110,
                          letterSpacing: -1,
                          height: .9,
                        )),
                      ]
                    ),
                  ),
                )
              )
            ]
          ),

          const SizedBox(height: 60),

          Container(
            alignment: Alignment.center,
            child: PlayButton(),
          ),
        ],
      )
    );
  }
}