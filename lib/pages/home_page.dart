import 'package:flutter/material.dart';
import 'package:rickandmorty/widgets/appbar.dart';
import 'package:rickandmorty/widgets/botton_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(height: MediaQuery.of(context).size.height * 0.08),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage("assets/r&m.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken))),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
