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
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 39, 45, 39),
          border: Border.all(
              width: 1, color: const Color.fromARGB(255, 1, 255, 9))),
      child: Row(
        children: [
          SizedBox(
            height: 90,
            width: 90,
            // ignore: unnecessary_null_comparison
            child: Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    characterImage,
                    fit: BoxFit.cover,
                  )),
              Positioned(
                top: 4,
                right: 4,
                child: Icon(
                  size: 20,
                  Icons.circle,
                  color: status == "Alive"
                      ? const Color.fromARGB(255, 0, 255, 8)
                      : status == "Dead"
                          ? const Color.fromARGB(255, 255, 17, 0)
                          : Colors.grey,
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 255, 8),
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Get_Schwifty'),
                ),
                Text(
                  gender,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  species,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
