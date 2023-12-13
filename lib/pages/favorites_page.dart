import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character.dart';
import 'package:rickandmorty/widgets/character_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<dynamic> favorites = [];
  List<String> favList = [];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  initState() {
    super.initState();
    _loadCharacters();
  }

  void _loadCharacters() async {
    final SharedPreferences prefs = await _prefs;
    favList = prefs.getStringList('favorites') ?? [];
    setState(() {
      for (String jsonString in favList) {
        Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        favorites.add(Character.fromJSON(jsonMap));
      }
    });

    favorites.forEach((favChar) => print(favChar.toString()));
  }

  void _saveToFavorites() async {
    final SharedPreferences prefs = await _prefs;
    favList = favorites.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList("favorites", favList);
  }

  @override
  Widget build(BuildContext context) {
    if (favorites.isNotEmpty) {
      return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, int index) {
            return Slidable(
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      setState(() {
                        favorites.removeAt(index);
                      });
                      _saveToFavorites();
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                  )
                ],
              ),
              child: CharacterTile(
                  name: favorites[index].name,
                  characterImage: favorites[index].image,
                  status: favorites[index].status,
                  species: favorites[index].species,
                  gender: favorites[index].gender),
            );
          });
    } else {
      return const Center(child: Text("no favorites"));
    }
  }
}
