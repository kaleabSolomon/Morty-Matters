import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character.dart';
import 'package:rickandmorty/models/character_api.dart';
import 'package:rickandmorty/widgets/character_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  List<dynamic> characters = [];
  List<dynamic> favorites = [];
  List<String> favList = [];
  bool isLoading = true;
  ScrollController _scrollController = ScrollController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // ignore: prefer_final_fields
  int _page = 1;

  @override
  initState() {
    super.initState();
    _fetchCharacters();
    _loadCharacters();
    _scrollController.addListener(_scrollListener);
    // characters.forEach((element) {
    //   print(element.name);
    // });
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

  void _saveToFavorites() async {
    final SharedPreferences prefs = await _prefs;
    favList = favorites.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList("favorites", favList);
  }

  void _addToFavorites(int index) {
    Character selectedCharacter = characters[index];

    bool isInFavorites =
        favorites.any((character) => character.id == selectedCharacter.id);
    if (!isInFavorites) {
      setState(() {
        favorites.add(selectedCharacter);
      });
      _saveToFavorites();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Character Added To Favorites",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 0, 255, 8),
      ));
    } else {
      setState(() {
        favorites
            .removeWhere((character) => character.id == selectedCharacter.id);
      });
      _saveToFavorites();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Character removed from favorites",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }

  void _loadCharacters() async {
    final SharedPreferences prefs = await _prefs;
    favList = prefs.getStringList('favorites')!;
    for (String jsonString in favList) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      favorites.add(Character.fromJSON(jsonMap));
    }
    favorites.forEach((element) {
      print(element.name);
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
                return GestureDetector(
                  onDoubleTap: () {
                    _addToFavorites(index);
                  },
                  child: CharacterTile(
                      name: characters[index].name,
                      characterImage: characters[index].image,
                      status: characters[index].status,
                      species: characters[index].species,
                      gender: characters[index].gender),
                );
              } else {
                isLoading = true;
                return isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 0, 255, 8),
                        ),
                      )
                    : const SizedBox();
              }
            });
  }
}
