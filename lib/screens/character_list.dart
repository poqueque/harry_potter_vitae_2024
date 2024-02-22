import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:provider/provider.dart';

import '../data/character_data.dart';
import '../data/preferences.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key, this.showAppBar = true, this.onCharacterTap});

  final bool showAppBar;
  final Function(int)? onCharacterTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (showAppBar)
          ? AppBar(
              title: const Text("Welcome to Hogwarts"),
              actions: [
                Consumer<Preferences>(builder: (context, preferences, child) {
                  return Switch(
                    value: preferences.showSubtitles,
                    onChanged: (value) {
                      preferences.setShowSubtitles(value);
                    },
                  );
                }),
              ],
            )
          : null,
      body: Consumer<CharacterData>(
        builder: (context, characterData, child) {
          return ListView(
            children: [
              for (var character in characterData.characters)
                Consumer<Preferences>(builder: (context, preferences, child) {
                  return ListTile(
                    leading: Hero(
                        tag: character.name,
                        child: Image.asset(character.assetPath)),
                    title: Text(character.name),
                    subtitle: (preferences.showSubtitles)
                        ? Text("${character.reviews} reviews")
                        : Container(),
                    trailing: InkWell(
                      onTap: () {
                        characterData.toggleFavorite(character.id);
                      },
                      child: (character.favorite)
                          ? const Icon(Icons.favorite, color: Colors.deepPurple)
                          : const Icon(Icons.favorite_border,
                              color: Colors.deepPurple),
                    ),
                    onTap: () {
                      if (onCharacterTap != null) {
                        onCharacterTap!(character.id);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CharacterDetail(
                              id: character.id,
                            ),
                          ),
                        );
                      }
                    },
                  );
                }),
            ],
          );
        },
      ),
    );
  }
}
