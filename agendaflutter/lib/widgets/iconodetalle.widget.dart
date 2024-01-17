import 'package:flutter/material.dart';

class IconoDetalle extends StatelessWidget {
  final List<String> etiquetas;
  const IconoDetalle({super.key, required this.etiquetas});

  @override
  Widget build(BuildContext context) {
    if (etiquetas.contains("Familia")) {
      return const Icon(Icons.family_restroom, size: 100);
    } else if (etiquetas.contains("Amigo")) {
      return const Icon(Icons.add_reaction_outlined, size: 100);
    } else if (etiquetas.contains("Trabajo")) {
      return const Icon(Icons.business, size: 100);
    } else if (etiquetas.contains("Personal")) {
      return const Icon(Icons.person, size: 100);
    } else {
      return const Icon(Icons.question_mark, size: 100);
    }
  }
}
