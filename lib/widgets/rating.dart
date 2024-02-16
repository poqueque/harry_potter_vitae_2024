import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.stars,
    this.color = Colors.black,
    this.onStarClicked,
  });

  final double stars;
  final Color color;
  final Function(int)? onStarClicked;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          InkWell(
            onTap: () {
              if (onStarClicked != null) onStarClicked!(i);
            },
            child: (stars >= i)
                ? Icon(Icons.star, color: color)
                : Icon(Icons.star_border, color: color),
          ),
      ],
    );
  }
}
