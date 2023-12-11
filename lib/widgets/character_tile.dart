import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  final String name;
  final String image;
  final String status;
  final String species;
  final String gender;
  const CharacterTile(
      {super.key,
      required this.name,
      required this.image,
      required this.status,
      required this.species,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 27, 27, 27)),
    );
  }
}
