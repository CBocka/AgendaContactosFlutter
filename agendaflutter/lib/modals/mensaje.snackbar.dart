// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void mostrarMensaje(BuildContext context, String mensaje) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(mensaje),
    duration: Duration(seconds: 2),
  ));
}
