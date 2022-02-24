import 'package:flutter/material.dart';
import 'buttons.dart';
import 'default.dart';
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
                      children: <TextSpan>[
                        TextSpan(text: 'Coin\n', style: TextStyle(
                          fontFamily: "Montserrat", 
                          fontSize: 25
                        )),
                        TextSpan(text: 'Flip', style: TextStyle(
                          fontFamily: "Montserrat", 
                          fontSize: 60
                        )),
                      ]
                    ),
                  )
                )
              ),
            ]
          ),

          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(60),
            child: PlayButton(),
          ),
        ],
      )
    );
  }
}