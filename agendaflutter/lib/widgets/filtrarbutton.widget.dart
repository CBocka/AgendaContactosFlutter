import 'package:agenda/models/agenda.class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OpcionFiltrarAppBar extends StatefulWidget {
  const OpcionFiltrarAppBar({Key? key}) : super(key: key);

  @override
  State<OpcionFiltrarAppBar> createState() => _OpcionFiltrarAppBarState();
}

class _OpcionFiltrarAppBarState extends State<OpcionFiltrarAppBar> {
  @override
  Widget build(BuildContext context) {
    Agenda agenda = Provider.of<Agenda>(context);
    return PopupMenuButton(
      icon: const Icon(Icons.filter_alt),
      itemBuilder: (context) => [
        for (String etiqueta in agenda.etiquetasFiltroTotales)
          PopupMenuItem(
            child: Consumer<Agenda>(
              builder: (context, agenda, _) {
                bool isEtiquetaSelected =
                    agenda.etiquetasFiltro.contains(etiqueta);
                return SwitchListTile(
                  value: isEtiquetaSelected,
                  title: Text(etiqueta),
                  onChanged: (value) {
                    setState(() {
                      if (value) {
                        agenda.actualizarFiltro(etiqueta, true);
                      } else {
                        agenda.actualizarFiltro(etiqueta, false);
                      }
                    });
                  },
                );
              },
            ),
          ),
        PopupMenuItem(
          child: Consumer<Agenda>(
            builder: (context, agenda, _) {
              bool isEtiquetaSelected = agenda.etiquetasFiltro.contains("");
              return SwitchListTile(
                value: isEtiquetaSelected,
                title: const Text("Sin etiquetas"),
                onChanged: (value) {
                  setState(() {
                    if (value) {
                      agenda.actualizarFiltro("", true);
                    } else {
                      agenda.actualizarFiltro("", false);
                    }
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
