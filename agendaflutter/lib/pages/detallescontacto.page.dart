import 'package:agenda/modals/mensaje.snackbar.dart';
import 'package:agenda/models/contacto.class.dart';
import 'package:agenda/pages/editarcontactopage.page.dart';
import 'package:agenda/widgets/iconodetalle.widget.dart';
import 'package:agenda/widgets/iconofavdetallepage.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetallesContactoPage extends StatefulWidget {
  final Contacto contacto;
  const DetallesContactoPage({super.key, required this.contacto});

  @override
  State<DetallesContactoPage> createState() => _DetallesContactoPageState();
}

class _DetallesContactoPageState extends State<DetallesContactoPage> {
  DateFormat dateFormat = DateFormat.yMMMd();
  DateFormat timeFormat = DateFormat.Hm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detalles del contacto"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>
                          EditarContactoPage(contacto: widget.contacto)));
                },
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.contacto.cambiarFav();
                  });
                },
                icon: IconoFav(
                  valor: widget.contacto.esFavorito,
                ))
          ],
        ),
        body: Column(children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              height: 200,
              width: 200,
              padding: const EdgeInsets.all(8),
              child: IconoDetalle(etiquetas: widget.contacto.etiquetas)),
          Text(widget.contacto.nombreCompleto,
              style: const TextStyle(
                  fontSize: 30, decoration: TextDecoration.none)),
          const SizedBox(height: 50),
          ListTile(
            title: const Text(
              "Correo electrónico",
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              widget.contacto.email,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.mail),
            onTap: () {
              mostrarMensaje(
                  context, "Enviando email a ${widget.contacto.email}");
            },
          ),
          const SizedBox(height: 8),
          ListTile(
            title: const Text(
              "Teléfono",
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              widget.contacto.telefono,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.phone),
            onTap: () {
              mostrarMensaje(
                  context, "Enviando sms a ${widget.contacto.telefono}");
            },
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ListTile(
                  title: const Text(
                    "Nacimiento",
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    widget.contacto.nacimiento
                        .toString()
                        .replaceAll("00:00:00.000", ""),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: ListTile(
                    title: const Text(
                      "Edad",
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      widget.contacto.edad.toString(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 8),
          ListTile(
            title: const Text(
              "Etiquetas",
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              widget.contacto.etiquetas.join(", "),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
                "Added on ${dateFormat.format(widget.contacto.creacion)} ${timeFormat.format(widget.contacto.creacion)}"),
          ),
          Center(
            child: Text(
                "Modified on ${dateFormat.format(widget.contacto.ultimaModificacion)} ${timeFormat.format(widget.contacto.ultimaModificacion)}"),
          )
        ]));
  }
}
