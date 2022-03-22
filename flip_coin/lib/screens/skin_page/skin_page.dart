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
            GestureDetector(
              onTap: () {
                print('default-coin');
              },

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
            
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('half-dollar-coin');
                        },

                        child: Column(
                          children: [
                            Row(
                              children: [
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
                        onTap: () {
                          print('libra-coin');
                        },

                        child: Column(
                          children: [
                            Row(
                              children: [
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
                        onTap: () {
                          print('eur-coin');
                        },

                        child: Column(
                          children: [
                            Row(
                              children: [
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
                        onTap: () {
                          print('real-coin');
                        },

                        child: Column(
                          children: [
                            Row(
                              children: [
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
            ),           
          ]
        ),
      )
    );
  }
}