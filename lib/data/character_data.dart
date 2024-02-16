import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';

class CharacterData extends ChangeNotifier {
  List<Character> characters = [
    Character(
      id: 1,
      imageUrl:
          'https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg',
      name: 'Harry Potter',
      strength: 6,
      magic: 8,
      speed: 9,
    ),
    Character(
      id: 2,
      imageUrl:
          'https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/1200?cb=20120729103114&path-prefix=es',
      name: 'Hermione Granger',
      strength: 7,
      magic: 10,
      speed: 8,
    ),
    Character(
      id: 3,
      imageUrl:
          'https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg',
      name: 'Ron Weasley',
      strength: 8,
      magic: 6,
      speed: 6,
    ),
  ];

  Character getCharacterFromId(int id) {
    Character character =
        characters.firstWhere((character) => character.id == id);
    return character;
  }

  void addReview(int id, int stars) {
    Character character = getCharacterFromId(id);
    character.reviews++;
    character.totalStars += stars;
    notifyListeners();
  }

  void toggleFavorite(int id) {
    Character character = getCharacterFromId(id);
    character.favorite = !character.favorite;
    notifyListeners();
  }
}
