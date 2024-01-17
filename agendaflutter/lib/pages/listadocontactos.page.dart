// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:agenda/models/agenda.class.dart';
import 'package:agenda/pages/crearcontacto.page.dart';
import 'package:agenda/widgets/commontabbar.widget.dart';
import 'package:agenda/widgets/filtrarbutton.widget.dart';
import 'package:agenda/widgets/listadocontactos.widget.dart';
import 'package:agenda/widgets/listadocontactosfavs.widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ListadoContactosPage extends StatefulWidget {
  const ListadoContactosPage({super.key});

  @override
  State<ListadoContactosPage> createState() => _ListadoContactosPageState();
}

class _ListadoContactosPageState extends State<ListadoContactosPage> {
  @override
  Widget build(BuildContext context) {
    Agenda miAgenda = Provider.of<Agenda>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Agenda"),
          actions: [
            IconButton(
                onPressed: () {
                  miAgenda.ordenarContactos();
                },
                icon: const Icon(FontAwesomeIcons.arrowDownAZ)),
            OpcionFiltrarAppBar()
          ],
        ),
        body: TabBarView(children: <Widget>[
          ListenableBuilder(
              listenable: miAgenda,
              builder: (context, child) {
                return ListadoContactos();
              }),
          ListenableBuilder(
              listenable: miAgenda,
              builder: (context, child) {
                return ListadoContactosFavs();
              })
        ]),
        bottomNavigationBar: const CommonTabBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => CrearContactoPage()))
                }),
      ),
    );
  }
}
