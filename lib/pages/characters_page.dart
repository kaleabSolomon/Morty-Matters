import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character.dart';
import 'package:rickandmorty/models/character_api.dart';
import 'package:rickandmorty/widgets/character_tile.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  List<Character> characters = [];

  @override
  initState() {
    super.initState();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    characters = await CharacterApi.getCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, int index) {
          return CharacterTile(
              name: characters[index].name,
              image: characters[index].image,
              status: characters[index].status,
              species: characters[index].species,
              gender: characters[index].gender);
        });
  }
}
