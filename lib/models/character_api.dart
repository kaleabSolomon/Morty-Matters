import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rickandmorty/models/character.dart';

class CharacterApi {
  static Future<List<dynamic>> getCharacter() async {
    var uri = Uri.parse('https://rickandmortyapi.com/api/character');
    final fetchedJson = await http.get(uri);
    Map<String, dynamic> data = jsonDecode(fetchedJson.body);

    List<dynamic> charactersJson = data['results'];
    List<Character> characters = charactersJson.map((charJson) {
      return Character.fromJSON(charJson);
    }).toList();
    List characterList = [];

    characters.forEach((character) {
      characterList.add(character);
    });
    return characterList;
    // return Character.extractFetchedJson(characterList);
  }
}
