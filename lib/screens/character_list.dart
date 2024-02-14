import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/screens/character_detail.dart';

List<Character> characters = [
  Character(
    imageUrl:
        'https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg',
    name: 'Harry Potter',
    stars: 3.4,
    reviews: 50,
    strength: 6,
    magic: 8,
    speed: 9,
  ),
  Character(
    imageUrl:
        'https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/1200?cb=20120729103114&path-prefix=es',
    name: 'Hermione Granger',
    stars: 4.4,
    reviews: 86,
    strength: 7,
    magic: 10,
    speed: 8,
  ),
  Character(
    imageUrl:
        'https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg',
    name: 'Ron Weasley',
    stars: 1.4,
    reviews: 48,
    strength: 8,
    magic: 6,
    speed: 6,
  ),
];

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Hogwarts"),
      ),
      body: ListView(
        children: [
          for (var character in characters)
            ListTile(
              leading: Hero(
                  tag: character.name,
                  child: Image.network(character.imageUrl)),
              title: Text(character.name),
              subtitle: Text("${character.reviews} reviews"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CharacterDetail(
                              character: character,
                            )));
              },
            ),
        ],
      ),
    );
  }
}
