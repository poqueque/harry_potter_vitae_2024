import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:provider/provider.dart';

import '../data/character_data.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Hogwarts"),
      ),
      body: Consumer<CharacterData>(
        builder: (context, characterData, child) {
          return ListView(
            children: [
              for (var character in characterData.characters)
                ListTile(
                  leading: Hero(
                      tag: character.name,
                      child: Image.network(character.imageUrl)),
                  title: Text(character.name),
                  subtitle: Text("${character.reviews} reviews"),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterDetail(
                          id: character.id,
                        ),
                      ),
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
