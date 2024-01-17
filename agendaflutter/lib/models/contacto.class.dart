import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';

class Contacto extends ChangeNotifier {
  static int contador = 1;
  String nombre, telefono, apellido, email;
  int id;
  DateTime? nacimiento;
  bool esFavorito;
  List<String> etiquetas = [];
  final DateTime creacion = DateTime.now();
  DateTime ultimaModificacion = DateTime.now();

  Contacto(
      {required this.nombre,
      this.apellido = "",
      this.email = "",
      required this.telefono,
      bool condicion = false,
      String? nacimiento,
      List<String> etiquetas = const []})
      : nacimiento = DateTime.tryParse(nacimiento ?? ''),
        esFavorito = condicion,
        id = contador++ {
    this.etiquetas = normalizarEtiquetas(etiquetas);
  }

  String get nombreCompleto => "$nombre $apellido";

  List<String> normalizarEtiquetas(List<String> entrada) {
    List<String> resultado = [];

    for (String etiqueta in entrada) {
      String etiquetaNormalizada = "";

      for (var i = 0; i < etiqueta.length; i++) {
        if (i == 0) {
          etiquetaNormalizada += etiqueta[i].toUpperCase();
        } else {
          etiquetaNormalizada += etiqueta[i].toLowerCase();
        }
      }

      etiquetaNormalizada = etiquetaNormalizada.trim();
      resultado.add(etiquetaNormalizada);
    }

    return resultado;
  }

  int? get edad =>
      nacimiento != null ? AgeCalculator.age(nacimiento!).years : null;

  @override
  String toString() {
    return """
Usuario(
  ID: $id
  Nombre: $nombre
  Apellido: $apellido
  Email: $email
  Telefono: $telefono
  Nacimiento: $nacimiento 
  Edad: $edad
  Etiquetas: $etiquetas
  Favorito: $esFavorito
)""";
  }

  Contacto copyWith(
      {String? nombre,
      String? apellido,
      String? telefono,
      String? email,
      bool? esFavorito,
      String? nacimiento,
      List<String>? etiquetas}) {
    return Contacto(
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        telefono: telefono ?? this.telefono,
        email: email ?? this.email,
        condicion: esFavorito ?? this.esFavorito,
        nacimiento: nacimiento ?? this.nacimiento.toString(),
        etiquetas: etiquetas ?? this.etiquetas);
  }

  void notificar() {
    notifyListeners();
  }

  void cambiarFav() {
    esFavorito = !esFavorito;
    ultimaModificacion = DateTime.now();
    notifyListeners();
  }
}
