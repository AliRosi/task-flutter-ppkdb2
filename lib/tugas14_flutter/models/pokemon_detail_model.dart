class PokemonDetail {
  final String name;
  final String imageUrl;
  final int height;
  final int weight;
  final List<String> types;

  PokemonDetail({
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.types,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    final imageUrl =
        json['sprites']['other']['official-artwork']['front_default'] ??
        json['sprites']['front_default'];

    final types =
        (json['types'] as List)
            .map((type) => type['type']['name'] as String)
            .toList();

    return PokemonDetail(
      name: json['name'],
      imageUrl: imageUrl,
      height: json['height'],
      weight: json['weight'],
      types: types,
    );
  }
}
