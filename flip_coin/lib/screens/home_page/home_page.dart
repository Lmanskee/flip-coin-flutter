import 'package:flip_coin/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flip_coin/default_value/default.dart';
import 'package:flip_coin/screens/home_page/custom_rounded_clipper.dart';

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
                          letterSpacing: -3,
                        )),
                
                        TextSpan(text: 'Flip', style: TextStyle(
                          fontFamily: "Montserrat", 
                          fontSize: 140,
                          letterSpacing: -10,
                          height: .9,
                        )),
                      ]
                    ),
                  ),
                )
              )
            ]
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height*.1,
          ),

          Container(
            alignment: Alignment.center,
            child: FlipCoinActionButton(
                  icon: Icons.play_arrow_rounded, 
                  onPressed: () => Navigator.of(context).pushReplacementNamed('/flip'),
            )
          ),
        ],
      )
    );
  }
}