class PokemonDetail {
  final String name;
  final String imageUrl;
  final int height;
  final int weight;
  final List<String> types;
  final List<String> abilities;
  final String category;

  PokemonDetail({
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
    required this.category,
  });

  factory PokemonDetail.fromJson({
    required Map<String, dynamic> json,
    required Map<String, dynamic> speciesJson,
  }) {
    final imageUrl =
        json['sprites']['other']['official-artwork']['front_default'] ??
        json['sprites']['front_default'];

    final types =
        (json['types'] as List)
            .map((type) => type['type']['name'] as String)
            .toList();

    final abilities =
        (json['abilities'] as List)
            .map((a) => a['ability']['name'] as String)
            .toList();

    final genusEntry = (speciesJson['genera'] as List).firstWhere(
      (g) => g['language']['name'] == 'en',
      orElse: () => null,
    );
    final category = genusEntry != null ? genusEntry['genus'] as String : '—';

    return PokemonDetail(
      name: json['name'],
      imageUrl: imageUrl,
      height: json['height'],
      weight: json['weight'],
      types: types,
      abilities: abilities,
      category: category,
    );
  }
}
