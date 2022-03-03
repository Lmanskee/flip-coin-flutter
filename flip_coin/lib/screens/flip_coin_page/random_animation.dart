import 'dart:math';

late String retornoRandomAnimation;

String initAnimation() {
  int randomNumber = Random().nextInt(2); // 1 => Cara; 2 => Coroa
  if(randomNumber == 1) {
    retornoRandomAnimation = 'CoinFlipStartsSReturnS';
  } else {
    retornoRandomAnimation = 'CoinFlipStartsSReturnC';
  } return retornoRandomAnimation;
}

String randomAnimation() {
  initAnimation.call();
  int randomNumber = Random().nextInt(2); // 1 => Cara; 2 => Coroa
  if(retornoRandomAnimation == 'CoinFlipStartsSReturnC' && randomNumber == 2) {
    return 'CoinFlipStartsCReturnC';
  } else{
    return 'CoinFlipStartsCReturnS';
  }}

