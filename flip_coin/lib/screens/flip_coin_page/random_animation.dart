import 'dart:math';

int randomNumber = Random().nextInt(2);

String randomAnimation() {
  String retorno;

  if(randomNumber == 1) {
    retorno = 'CoinFlipReturnS';
  } else{
    retorno = 'CoinFlipReturnC';
  }
  
  return retorno;
}