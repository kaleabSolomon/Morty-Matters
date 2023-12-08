import 'package:flutter/material.dart';
import 'package:rickandmorty/widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(height: MediaQuery.of(context).size.height * 0.1),
    );
  }
}
