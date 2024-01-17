import 'package:agenda/models/agenda.class.dart';
import 'package:agenda/models/contacto.class.dart';
import 'package:agenda/pages/detallescontacto.page.dart';
import 'package:agenda/pages/editarcontactopage.page.dart';
import 'package:agenda/widgets/iconosetiquetas.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactoTile extends StatelessWidget {
  final Contacto contacto;

  const ContactoTile({super.key, required this.contacto});

  @override
  Widget build(BuildContext context) {
    Agenda agenda = Provider.of<Agenda>(context);

    return ListenableBuilder(
        listenable: contacto,
        builder: (context, child) {
          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => DetallesContactoPage(contacto: contacto)));
            },
            leading: IconosEtiquetas(etiquetas: contacto.etiquetas),
            title: Text("${contacto.nombre} ${contacto.apellido}"),
            subtitle: Text("${contacto.email} ${contacto.telefono}"),
            trailing: PopupMenuButton(
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                    child: ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .pop(); //Cerrar Popup una vez pulsamos esta opción
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) =>
                                  DetallesContactoPage(contacto: contacto)));
                        },
                        contentPadding: const EdgeInsets.all(0),
                        leading: const Icon(Icons.remove_red_eye),
                        title: const Text("Ver"))),
                PopupMenuItem(
                    child: ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) =>
                                  EditarContactoPage(contacto: contacto)));
                        },
                        contentPadding: const EdgeInsets.all(0),
                        leading: const Icon(Icons.edit),
                        title: const Text("Editar"))),
                PopupMenuItem(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Eliminar contacto'),
                            content: const Text(
                                '¿Estás seguro de que deseas eliminar este contacto?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  agenda.eliminarContacto(contacto.id);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Sí'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    contentPadding: const EdgeInsets.all(0),
                    leading: const Icon(Icons.delete),
                    title: const Text("Eliminar"),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
