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
  ScrollController _scrollController = ScrollController();
  // ignore: prefer_final_fields
  int _page = 1;

  @override
  initState() {
    super.initState();
    _fetchCharacters();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchCharacters();
    }
  }

  Future<void> _fetchCharacters() async {
    List<dynamic> characterList = await CharacterApi.getCharacter(_page);
    characters.addAll(characterList);
    setState(() {
      isLoading = false;
      _page++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 0, 255, 8),
              strokeWidth: 4,
            ),
          )
        : ListView.builder(
            controller: _scrollController,
            itemCount: characters.length + 1,
            itemBuilder: (context, int index) {
              if (index < characters.length) {
                return CharacterTile(
                    name: characters[index].name,
                    characterImage: characters[index].image,
                    status: characters[index].status,
                    species: characters[index].species,
                    gender: characters[index].gender);
              } else {
                isLoading = true;
                return isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 0, 255, 8),
                        ),
                      )
                    : SizedBox();
              }
            });
  }
}
