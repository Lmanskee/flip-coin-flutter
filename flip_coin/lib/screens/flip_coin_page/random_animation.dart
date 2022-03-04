import 'dart:math';

String randomAnimation() {
  int firstRandomNumber = Random().nextInt(2); // 1 => Cara; 2 => Coroa

  if (firstRandomNumber == 1) {
    return 'CoinFlipStartsSReturnS';
  } else {
    return 'CoinFlipStartsSReturnC';
  }
}