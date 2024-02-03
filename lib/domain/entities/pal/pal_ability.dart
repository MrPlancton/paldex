class PalAbility {
  const PalAbility({
    required this.level,
    required this.name,
    required this.type,
    required this.cooldown,
    required this.power,
    required this.description,
  });

  final int level;
  final String name;
  final String type;
  final int cooldown;
  final int power;
  final String description;
}
