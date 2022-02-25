import 'package:image_sequence_animator/image_sequence_animator.dart';
import 'package:flutter/material.dart';

class FlipCoinPage extends StatefulWidget {
  const FlipCoinPage({ Key? key }) : super(key: key);

  @override
  _FlipCoinPageState createState() => _FlipCoinPageState();
}

class _FlipCoinPageState extends State<FlipCoinPage> {
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: Column(
        children: const[
          Expanded(
            flex: 4,
            child: ImageSequenceAnimator(
              "assets/coinSequence",
              "files_render",
              1,
              4,
              "png",
              20,
              fps: 60,
              isLooping: true,
              isBoomerang: false,
              isAutoPlay: false,
            ),
          )
        ],
      )
    );
  }
}