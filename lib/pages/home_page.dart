import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rickandmorty/widgets/appbar.dart';
import 'package:rickandmorty/widgets/botton_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            color: Colors
                .transparent, // Transparent to ensure the blur only affects the background
          ),
        )
      ]),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
