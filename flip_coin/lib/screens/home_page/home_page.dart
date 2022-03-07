import 'package:flutter/material.dart';
import 'package:flip_coin/screens/default.dart';
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
                          fontSize: 55,
                          letterSpacing: -1,
                        )),
                
                        TextSpan(text: 'Flip', style: TextStyle(
                          fontFamily: "Montserrat", 
                          fontSize: 115,
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
            child: TextButton(
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
            )
          ),
        ],
      )
    );
  }
}