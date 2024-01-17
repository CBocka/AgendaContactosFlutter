import 'package:agenda/models/agenda.class.dart';
import 'package:agenda/models/contacto.class.dart';
import 'package:agenda/widgets/contactotile.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListadoContactosFavs extends StatefulWidget {
  const ListadoContactosFavs({super.key});

  @override
  State<ListadoContactosFavs> createState() => _ListadoContactosFavsState();
}

class _ListadoContactosFavsState extends State<ListadoContactosFavs> {
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
          List<Contacto> favoritos = [];

          for (Contacto element in contactosFiltrados) {
            if (element.esFavorito) {
              favoritos.add(element);
            }
          }

          return ListView.builder(
            itemCount: favoritos.length,
            itemBuilder: (context, index) =>
                ContactoTile(contacto: favoritos[index]),
          );
        });
  }
}
