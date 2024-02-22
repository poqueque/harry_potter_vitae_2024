import 'package:flutter/material.dart';
import 'package:harry_potter/screens/tablet_layout.dart';

import 'character_list.dart';

class AdaptivePage extends StatelessWidget {
  const AdaptivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          debugPrint(constraints.maxWidth.toString());
          if (constraints.maxWidth < 600) {
            return const CharacterList();
          } else {
            return const TabletLayout();
          }
        },
      ),
    );
  }
}
