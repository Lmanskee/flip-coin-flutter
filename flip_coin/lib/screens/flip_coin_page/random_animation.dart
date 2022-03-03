import 'dart:math';

int randomNumber = Random().nextInt(2);

String randomAnimation() {
  if(randomNumber == 1) {
    return 'CoinFlipReturnS';
  } else{
    return 'CoinFlipReturnC';
  }
}