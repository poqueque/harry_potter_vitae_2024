import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        title: const Text("Harry Potter App"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            'https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg',
            height: height * 0.6,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star_border),
                  Icon(Icons.star_border),
                ],
              ),
              Text("89 reviews"),
            ],
          ),
          const Text(
            "Harry Potter",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.fitness_center),
                  Text("Fuerza"),
                  Text("9"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.auto_fix_high),
                  Text("Magia"),
                  Text("10"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.speed),
                  Text("Speed"),
                  Text("8"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
