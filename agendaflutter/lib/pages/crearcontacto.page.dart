import 'package:agenda/models/agenda.class.dart';
import 'package:agenda/models/contacto.class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CrearContactoPage extends StatefulWidget {
  const CrearContactoPage({super.key});

  @override
  State<CrearContactoPage> createState() => _CrearContactoPageState();
}

class _CrearContactoPageState extends State<CrearContactoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController nombreController;
  late TextEditingController apellidoController;
  late TextEditingController emailController;
  late TextEditingController telefonoController;
  late TextEditingController fechaController;
  late TextEditingController etiquetasController;

  Agenda get miAgenda => Provider.of(context, listen: false);

  @override
  void initState() {
    super.initState();
    nombreController = TextEditingController();
    apellidoController = TextEditingController();
    emailController = TextEditingController();
    telefonoController = TextEditingController();
    fechaController = TextEditingController();
    etiquetasController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nombreController.dispose();
    apellidoController.dispose();
    emailController.dispose();
    telefonoController.dispose();
    fechaController.dispose();
    etiquetasController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _preguntarUsuario(context) ?? false;
      },
      child: Scaffold(
          appBar: AppBar(title: const Text("Crer un contacto")),
          body: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
                  children: [
                    TextFormField(
                        controller: nombreController,
                        validator: _onValidateTextoVacio,
                        decoration: const InputDecoration(
                            labelText: "Nombre (obligatorio)",
                            hintText: "Introduce el nombre del contacto")),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: apellidoController,
                        decoration: const InputDecoration(
                            labelText: "Apellido",
                            hintText: "Introduce el apellido del contacto")),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: emailController,
                        validator: _onValidateEmail,
                        decoration: const InputDecoration(
                            labelText: "Email",
                            hintText: "Introduce el email del contacto")),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: telefonoController,
                        validator: _onValidateTelefono,
                        decoration: const InputDecoration(
                            labelText: "Teléfono (obligatorio)",
                            hintText: "Introduce el teléfono del contacto")),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: fechaController,
                        readOnly: true,
                        onTap: () {
                          _obtenerFecha(context);
                        },
                        decoration: const InputDecoration(
                          labelText: "Fecha",
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: etiquetasController,
                        decoration: const InputDecoration(
                            labelText: "Etiquetas",
                            hintText:
                                "Introduce las etiquetas separadas por comas")),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: _onSave, child: const Text("Crear contacto"))
                  ],
                ),
              ))),
    );
  }

  Future<bool?> _preguntarUsuario(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content: const Text("¿Seguro que desea salir?"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Aceptar")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("Cancelar")),
          ]),
    );
  }

  String? _onValidateTextoVacio(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }

  String? _onValidateEmail(String? value) {
    RegExp exp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value == null || value.isEmpty) {
      return null;
    }

    if (exp.hasMatch(value)) {
      return null;
    } else {
      return "Formato de email incorrecto";
    }
  }

  String? _onValidateTelefono(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Campo obligatorio";
    }

    RegExp exp = RegExp(r'^(\+\d{2}\s)?\d{9}$');

    if (exp.hasMatch(value)) {
      return null;
    } else {
      return "Formato de teléfono incorrecto";
    }
  }

  Future<void> _obtenerFecha(BuildContext context) async {
    DateTime? nuevaFecha = await showDatePicker(
        context: context,
        initialDate: DateTime(1994, 1, 1),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (nuevaFecha != null) {
      fechaController.text = nuevaFecha.toString();
    }
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      List<String> etiquetas = List.empty();

      if (etiquetasController.text.isNotEmpty) {
        etiquetas = etiquetasController.text.split(",");
      }

      Contacto nuevoContacto = Contacto(
          nombre: nombreController.text,
          apellido: apellidoController.text,
          email: emailController.text,
          telefono: telefonoController.text,
          nacimiento: fechaController.text,
          etiquetas: etiquetas);

      miAgenda.contactos.add(nuevoContacto);
      miAgenda.notificar();

      Navigator.of(context).pop<bool>(true);
    } else {
      print("Los campos no se han rellenado correctamente");
    }
  }
}
