import 'dart:math';

class contrasenasController {
  static const String letrasMayusculas = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const String letrasMinusculas = 'abcdefghijklmnopqrstuvwxyz';
  static const String letrasMayusculasFacil = 'ABCDEFGHJKLMNPQRSTUVWXYZ';
  static const String letrasMinusculasFacil = 'abcdefghijkmnpqrstuvwxyz';
  static const String numerosFacil = '23456789';
  static const String numeros = '0123456789';
  static const String simbolos = '!@#\$%^&*()_+-=[]{}|;:\'",.<>?/';

  String generarContra(int longitud, bool incluirMayusculas, bool incluirMinusculas, bool incluirNumeros, bool incluirSimbolos) {
    String caracteresPermitidos = '';
    if (incluirMayusculas) caracteresPermitidos += letrasMayusculas;
    if (incluirMinusculas) caracteresPermitidos += letrasMinusculas;
    if (incluirNumeros) caracteresPermitidos += numeros;
    if (incluirSimbolos) caracteresPermitidos += simbolos;

    return List.generate(longitud, (index) {
      final indexAleatorio = Random().nextInt(caracteresPermitidos.length);
      return caracteresPermitidos[indexAleatorio];
    }).join('');
  }

  String generarContraFacil(int longitud, bool incluirMayusculas, bool incluirMinusculas, bool incluirNumeros, bool incluirSimbolos) {
    String caracteresPermitidos = '';
    if (incluirMayusculas) caracteresPermitidos += letrasMayusculasFacil;
    if (incluirMinusculas) caracteresPermitidos += letrasMinusculasFacil;
    if (incluirNumeros) caracteresPermitidos += numeros;
    if (incluirSimbolos) caracteresPermitidos += simbolos;

    return List.generate(longitud, (index) {
      final indexAleatorio = Random().nextInt(caracteresPermitidos.length);
      return caracteresPermitidos[indexAleatorio];
    }).join('');
  }


}