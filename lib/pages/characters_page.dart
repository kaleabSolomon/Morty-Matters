import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character_api.dart';
import 'package:rickandmorty/widgets/character_tile.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  List<dynamic> characters = [];
  bool isLoading = true;

  @override
  initState() {
    super.initState();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    characters = await CharacterApi.getCharacter();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 0, 255, 8),
              strokeWidth: 6,
            ),
          )
        : ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, int index) {
              return CharacterTile(
                  name: characters[index].name,
                  characterImage: characters[index].image,
                  status: characters[index].status,
                  species: characters[index].species,
                  gender: characters[index].gender);
            });
  }
}
