import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rickandmorty/pages/characters_page.dart';
import 'package:rickandmorty/pages/favorites_page.dart';
import 'package:rickandmorty/widgets/appbar.dart';
import 'package:rickandmorty/widgets/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Initial index

  void _onIndexChanged(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body = const CharacterPage();

    if (_selectedIndex == 1) {
      body = const FavoritesPage();
    }
    return Scaffold(
      appBar: MyAppBar(height: MediaQuery.of(context).size.height * 0.08),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage("assets/r&m.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken))),
          child: body,
        ),
      ]),
      bottomNavigationBar: BottomNavigation(
        onIndexChanged: _onIndexChanged,
      ),
    );
  }
}
