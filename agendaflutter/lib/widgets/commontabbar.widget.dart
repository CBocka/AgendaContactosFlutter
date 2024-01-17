// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CommonTabBar extends StatelessWidget {
  const CommonTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black87,
        child: TabBar(
          //controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.contacts),
              text: "Contactos",
            ),
            Tab(
              icon: Icon(Icons.star),
              text: "Favoritos",
            ),
          ],
        ));
  }
}
