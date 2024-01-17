import 'package:flutter/material.dart';

class IconoFav extends StatelessWidget {
  final bool valor;
  const IconoFav({super.key, required this.valor});

  @override
  Widget build(BuildContext context) {
    if (valor) {
      return const Icon(Icons.star);
    } else {
      return const Icon(Icons.star_border);
    }
  }
}
