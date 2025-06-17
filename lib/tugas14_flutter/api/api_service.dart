import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pokemon_detail_model.dart';
import '../models/pokemon_model.dart';

class ApiService {
  static const String apiUrl = 'https://pokeapi.co/api/v2/pokemon?limit=1000';

  static Future<List<Pokemon>> fetchPokemons() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List results = jsonData['results'];

      return List.generate(results.length, (index) {
        final item = results[index];
        final name = item['name'];
        final id = index + 1;
        final imageUrl =
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

        return Pokemon(name: name, imageUrl: imageUrl);
      });
    } else {
      throw Exception('Gagal memuat daftar Pokemon');
    }
  }

  static Future<PokemonDetail> fetchPokemonDetail(String name) async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return PokemonDetail.fromJson(jsonData);
    } else {
      throw Exception('Gagal memuat detail Pokemon');
    }
  }
}
