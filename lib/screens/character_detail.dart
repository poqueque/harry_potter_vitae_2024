import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:harry_potter/widgets/rating.dart';
import 'package:provider/provider.dart';

import '../data/character_data.dart';
import '../models/character.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.id, this.showAppBar = true});
  final int id;
  final bool showAppBar;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  double lastClickedReview = 0;
  late AppLocalizations l;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    l = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Consumer<CharacterData>(
      builder: (context, characterData, child) {
        Character character = characterData.getCharacterFromId(widget.id);
        return Scaffold(
          appBar: (widget.showAppBar)
              ? AppBar(
                  title: Text(l.title(character.name)),
                )
              : null,
          body: Column(
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
                  Flexible(
                    child: Text(
                      l.nReviews(character.reviews),
                    ),
                  ),
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
          ),
        );
      },
    );
  }
}
