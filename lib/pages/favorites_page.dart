import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    super.initState();
    _loadCharacters();
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

  // void _saveToFavorites() async {
  //   final SharedPreferences prefs = await _prefs;
  //   favList = favorites.map((item) => jsonEncode(item.toJson())).toList();
  //   await prefs.setStringList("favorites", favList);
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount:favorites.length,  (context, index){
      
    })
  }
}
