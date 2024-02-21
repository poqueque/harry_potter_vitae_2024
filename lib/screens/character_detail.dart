import 'package:flutter/material.dart';
import 'package:harry_potter/widgets/rating.dart';
import 'package:provider/provider.dart';

import '../data/character_data.dart';
import '../models/character.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.id});
  final int id;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  double lastClickedReview = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Harry Potter App"),
      ),
      body: Consumer<CharacterData>(
        builder: (context, characterData, child) {
          Character character = characterData.getCharacterFromId(widget.id);
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: character.name,
                child: Image.asset(
                  character.assetPath,
                  height: height * 0.6,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Rating(stars: character.totalStars / character.reviews),
                  Text("${character.reviews} reviews"),
                  InkWell(
                    onTap: () {
                      characterData.toggleFavorite(character.id);
                    },
                    child: (character.favorite)
                        ? const Icon(Icons.favorite, color: Colors.deepPurple)
                        : const Icon(Icons.favorite_border,
                            color: Colors.deepPurple),
                  )
                ],
              ),
              Text(
                character.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Rating(
                stars: lastClickedReview,
                color: Colors.deepPurple,
                onStarClicked: (value) {
                  lastClickedReview = value.toDouble();
                  characterData.addReview(widget.id, value);
                  setState(() {});
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.fitness_center),
                      const Text("Fuerza"),
                      Text("${character.strength}"),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.auto_fix_high),
                      const Text("Magia"),
                      Text("${character.magic}"),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.speed),
                      const Text("Speed"),
                      Text("${character.speed}"),
                    ],
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
