import 'dart:io';

import 'strings.dart';
import 'utils/enum/lado_enum.dart';

class CheckValues {
  static bool checkLentePrime(double esfericoDireito, double esfericoEsquerdo, double cilidrincoDireito, double cilidrincoEsquerdo) {
    double maxGrauEsferico = calcMaxGrauEsferico(cilidrincoDireito, cilidrincoEsquerdo);
    if (esfericoDireito >= -3 && esfericoDireito <= maxGrauEsferico && esfericoEsquerdo >= -3 && esfericoEsquerdo <= maxGrauEsferico) {
      return true;
    } else if (cilidrincoDireito >= -2 && cilidrincoEsquerdo >= -2) {
      return true;
    }
    return false;
  }

  static bool checkLenteVision(double esfericoDireito, double esfericoEsquerdo, double cilidrincoDireito, double cilidrincoEsquerdo) {
    if (esfericoDireito <= 0 && esfericoDireito >= -15 || esfericoEsquerdo <= 0 && esfericoEsquerdo >= -15) {
      return true;
    } else if (cilidrincoDireito <= 0 && cilidrincoDireito >= -5 || cilidrincoEsquerdo <= 0 && cilidrincoEsquerdo >= -5) {
      return true;
    }
    return false;
  }

  static double calcMaxGrauEsferico(double cilidrincoDireito, double cilidrincoEsquerdo) {
    if (cilidrincoDireito < 0 || cilidrincoEsquerdo < 0) {
      return -10;
    }
    return -12;
  }

  static double getValueCilindrico(Lado lado) {
    bool validado = false;
    double value = 0.0;
    while (!validado) {
      print(Strings.inputValorCilindrico + lado.name.toString());
      var inputed = stdin.readLineSync()?.split(' ').map(double.tryParse).toList()[0];
      if (inputed != null) {
        if (inputed > 0 || inputed < -6) {
          print(Strings.valorCilindricoInvalido);
        } else {
          if (_grauValido(inputed)) {
            validado = true;
            value = inputed;
          }
        }
      } else {
        print(Strings.valorInvalido);
      }
    }
    return value;
  }

  static double getValueEsferico(Lado lado) {
    bool validado = false;
    double value = 0.0;
    while (!validado) {
      print(Strings.inputValorEsferico + lado.name.toString());
      var inputed = stdin.readLineSync()?.split(' ').map(double.tryParse).toList()[0];
      if (inputed != null) {
        if (inputed > 0 || inputed < -15) {
          print(Strings.valorEsfericoInvalido);
        } else {
          if (_grauValido(inputed)) {
            validado = true;
            value = inputed;
          }
        }
      } else {
        print(Strings.valorInvalido);
      }
    }
    return value;
  }

  static bool _grauValido(double value) {
    if (value % .25 == 0) {
      return true;
    }
    print(Strings.grauInvalido);
    return false;
  }
}
