/* 

id
name
status
species
gender
image

*/
class Character {
  final String name;
  final String image;
  final String status;
  final String species;
  final String gender;

  Character(
      {required this.name,
      required this.image,
      required this.status,
      required this.species,
      required this.gender});

  factory Character.fromJSON(dynamic json) {
    try {
      return Character(
          name: json['name'] as String,
          status: json['status'] as String,
          species: json['species'] as String,
          gender: json['gender'] as String,
          image: json['image'] as String);
    } catch (e) {
      print("Error creating character from JSON: $e");
      return Character(
        name: '',
        image: '',
        status: '',
        species: '',
        gender: '',
      );
    }
  }
}
