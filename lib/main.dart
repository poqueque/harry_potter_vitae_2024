import 'package:flutter/material.dart';
import 'package:harry_potter/data/preferences.dart';
import 'package:harry_potter/gen/fonts.gen.dart';
import 'package:harry_potter/screens/character_list.dart';
import 'package:provider/provider.dart';

import 'data/character_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CharacterData()),
        ChangeNotifierProvider(create: (context) => Preferences()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: FontFamily.montserrat,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurple.shade200,
            centerTitle: true,
          ),
          useMaterial3: true,
        ),
        home: const CharacterList(),
      ),
    );
  }
}
