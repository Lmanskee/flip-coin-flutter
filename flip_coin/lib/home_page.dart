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
                  color: mainAppColor,
                  height: 400,
                )
              ),
            ]
          ),

          Container(
            alignment: Alignment.center,
            width: double.infinity,
            margin: EdgeInsets.only(top: 160),
            child: Stack(
              children: [
                PlayButton(),
              ],
            ),
          )
        ],
      )
    );
  }
}