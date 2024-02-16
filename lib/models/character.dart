class Character {
  final int id;
  final String imageUrl;
  final String name;
  final int strength;
  final int magic;
  final int speed;

  int totalStars = 0;
  int reviews = 0;
  bool favorite = false;

  Character({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.strength,
    required this.magic,
    required this.speed,
  });
}
