import 'checker.dart';
import 'utils/enum/lado_enum.dart';

void main() {
  double esfericoDireito = CheckValues.getValueEsferico(Lado.DIREITO);
  double esfericoEsquerdo = CheckValues.getValueEsferico(Lado.ESQUERDO);

  double cilidrincoDireito = CheckValues.getValueCilindrico(Lado.DIREITO);
  double cilidrincoEsquerdo = CheckValues.getValueCilindrico(Lado.ESQUERDO);

  //Checando lente prime
  bool lentePrime = CheckValues.checkLentePrime(esfericoDireito, esfericoEsquerdo, cilidrincoDireito, cilidrincoEsquerdo);

  if (lentePrime) {
    print('Lente prime disponível');
  } else {
    print('Lente vision disponível');
  }
}
