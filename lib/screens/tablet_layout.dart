import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:harry_potter/screens/character_list.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  int? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome to Hogwarts"),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: CharacterList(
                showAppBar: false,
                onCharacterTap: (clickedId) {
                  id = clickedId;
                  setState(() {});
                },
              ),
            ),
            if (id == null)
              const Expanded(
                flex: 2,
                child: Center(child: Text("Escoge un personaje de Hogwarts")),
              )
            else
              Expanded(
                flex: 2,
                child: CharacterDetail(
                  id: id!,
                  showAppBar: false,
                ),
              )
          ],
        ));
  }
}
