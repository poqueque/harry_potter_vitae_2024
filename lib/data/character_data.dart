import 'package:flutter/material.dart';
import 'package:harry_potter/gen/assets.gen.dart';
import 'package:harry_potter/models/character.dart';

class CharacterData extends ChangeNotifier {
  List<Character> characters = [
    Character(
      id: 1,
      assetPath: Assets.images.harry.path,
      name: 'Harry Potter',
      strength: 6,
      magic: 8,
      speed: 9,
    ),
    Character(
      id: 2,
      assetPath: Assets.images.hermione.path,
      name: 'Hermione Granger',
      strength: 7,
      magic: 10,
      speed: 8,
    ),
    Character(
      id: 3,
      assetPath: Assets.images.ron.path,
      name: 'Ron Weasley',
      strength: 8,
      magic: 6,
      speed: 6,
    ),
  ];

  /// This method returns a character from its id
  Character getCharacterFromId(int id) {
    Character character =
        characters.firstWhere((character) => character.id == id);
    return character;
  }

  /// This method adds a review to a character
  void addReview(int id, int stars) {
    Character character = getCharacterFromId(id);
    character.reviews++;
    character.totalStars += stars;
    notifyListeners();
  }

  /// This method toggles the favorite status of a character
  void toggleFavorite(int id) {
    Character character = getCharacterFromId(id);
    character.favorite = !character.favorite;
    notifyListeners();
  }

  void addCharacter(Character character) {
    characters.add(character);
    notifyListeners();
  }

  void removeCharacter(int id) {
    characters.removeWhere((character) => character.id == id);
    notifyListeners();
  }
}
