import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({super.key, required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Harry Potter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: character.name,
            child: Image.network(
              character.imageUrl,
              height: height * 0.6,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 1; i <= 5; i++)
                    (character.stars >= i)
                        ? const Icon(Icons.star)
                        : const Icon(Icons.star_border),
                ],
              ),
              Text("${character.reviews} reviews"),
            ],
          ),
          Text(
            character.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
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
      ),
    );
  }
}
