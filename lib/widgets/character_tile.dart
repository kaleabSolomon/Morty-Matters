import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  final String name;
  final String characterImage;
  final String status;
  final String species;
  final String gender;
  const CharacterTile(
      {super.key,
      required this.name,
      required this.characterImage,
      required this.status,
      required this.species,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 39, 45, 39),
          border: Border.all(
              width: 1, color: const Color.fromARGB(255, 1, 255, 9))),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            // ignore: unnecessary_null_comparison
            child: characterImage != null
                ? Image.network(
                    characterImage,
                    fit: BoxFit.cover,
                  )
                : Placeholder(),
          )
        ],
      ),
    );
  }
}
