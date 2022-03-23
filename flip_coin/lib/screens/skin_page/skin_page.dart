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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                      width: 240,
                      height: 240,
                      image: NetworkImage(
                        'https://lmanskee.github.io/flip_coin_flutter/assets/pngs/default.png'),
                    )
                  ],
                ),
              ],
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Image(
                              width: 160,
                              height: 160,
                              image: NetworkImage(
                                'https://lmanskee.github.io/flip_coin_flutter/assets/pngs/half-dollar.png'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Image(
                              width: 160,
                              height: 160,
                              image: NetworkImage(
                                'https://lmanskee.github.io/flip_coin_flutter/assets/pngs/default.png'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Image(
                              width: 160,
                              height: 160,
                              image: NetworkImage(
                                'https://lmanskee.github.io/flip_coin_flutter/assets/pngs/default.png'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Image(
                              width: 160,
                              height: 160,
                              image: NetworkImage(
                                'https://lmanskee.github.io/flip_coin_flutter/assets/pngs/default.png'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),           
        ]
      )
    );
  }
}