// ignore_for_file: prefer_const_constructors

import 'package:agenda/models/agenda.class.dart';
import 'package:agenda/pages/listadocontactos.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Agenda>(
      create: (_) => Agenda(),
      child: MaterialApp(
        title: 'Agenda',
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.dark,
        home: ListadoContactosPage(),
      ),
    );
  }
}
