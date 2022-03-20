import 'package:flutter/material.dart';

class SkinPage extends StatefulWidget {
  const SkinPage({ Key? key }) : super(key: key);

  @override
  State<SkinPage> createState() => _SkinPageState();
}

class _SkinPageState extends State<SkinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage(
                    'https://lmanskee.github.io/flip_coin_flutter/assets/pngs/default.png',
                    scale: 1),
                )
              ],
            ),
            
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text('Moeda'),
                        ],
                      ),

                      Row(
                        children: [
                          Text('Moeda'),
                        ],
                      )
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [                         
                          Text('Moeda'),
                        ],
                      ),

                      Row(
                        children: [
                          Text('Moeda'),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),           
          ]
        ),
      )
    );
  }
}