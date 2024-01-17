import 'package:flutter/material.dart';

class IconosEtiquetas extends StatelessWidget {
  final List<String> etiquetas;
  const IconosEtiquetas({super.key, required this.etiquetas});

  @override
  Widget build(BuildContext context) {
    if (etiquetas.contains("Familia")) {
      return const Icon(Icons.family_restroom);
    } else if (etiquetas.contains("Amigo")) {
      return const Icon(Icons.add_reaction_outlined);
    } else if (etiquetas.contains("Trabajo")) {
      return const Icon(Icons.business);
    } else if (etiquetas.contains("Personal")) {
      return const Icon(Icons.person);
    } else {
      return const Icon(Icons.question_mark);
    }
  }
}
