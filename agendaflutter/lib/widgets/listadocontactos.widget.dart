import 'package:agenda/models/agenda.class.dart';
import 'package:agenda/models/contacto.class.dart';
import 'package:agenda/widgets/contactotile.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListadoContactos extends StatefulWidget {
  const ListadoContactos({super.key});

  @override
  State<ListadoContactos> createState() => _ListadoContactosState();
}

class _ListadoContactosState extends State<ListadoContactos> {
  @override
  Widget build(BuildContext context) {
    Agenda agenda = Provider.of<Agenda>(context);

    List<Contacto> contactosFiltrados = agenda.contactos.where((contacto) {
      if (contacto.etiquetas.isEmpty) {
        return true;
      } else if (agenda.etiquetasFiltro.isEmpty) {
        return false;
      } else {
        return contacto.etiquetas
            .any((etiqueta) => agenda.etiquetasFiltro.contains(etiqueta));
      }
    }).toList();

    return ListenableBuilder(
        listenable: agenda,
        builder: (context, child) {
          return ListView.builder(
            itemCount: contactosFiltrados.length,
            itemBuilder: (context, index) =>
                ContactoTile(contacto: contactosFiltrados[index]),
          );
        });
  }
}
