import 'package:flutter/material.dart';
import 'package:tugas1_flutter/tugas14_flutter/api/api_service.dart';

import '../models/pokemon_model.dart';
import 'pokemon_detail_screen.dart';

class HomeScreenPokemon extends StatefulWidget {
  const HomeScreenPokemon({super.key});

  @override
  State<HomeScreenPokemon> createState() => _HomeScreenPokemonState();
}

class _HomeScreenPokemonState extends State<HomeScreenPokemon> {
  late Future<List<Pokemon>> _pokemonList;
  List<Pokemon> _allPokemons = [];
  List<Pokemon> _filteredPokemons = [];
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadPokemons();
  }

  void _loadPokemons() {
    _pokemonList = ApiService.fetchPokemons();
    _pokemonList.then((data) {
      setState(() {
        _allPokemons = data;
        _filteredPokemons = data;
      });
    });
  }

  void _filterPokemons(String query) {
    final filtered =
        _allPokemons
            .where(
              (pokemon) =>
                  pokemon.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    setState(() {
      _filteredPokemons = filtered;
    });
  }

  Future<void> _refresh() async {
    _loadPokemons();
    _searchController.clear();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Daftar Pokémon',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterPokemons,
              decoration: InputDecoration(
                hintText: 'Cari Pokémon...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              color: Colors.white,
              backgroundColor: Colors.redAccent,
              child: FutureBuilder<List<Pokemon>>(
                future: _pokemonList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (_filteredPokemons.isEmpty) {
                    return Center(child: Text('Tidak ditemukan.'));
                  } else {
                    return ListView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _filteredPokemons.length,
                      itemBuilder: (context, index) {
                        final pokemon = _filteredPokemons[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(12),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                pokemon.imageUrl,
                                width: 60,
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Text(
                              pokemon.name[0].toUpperCase() +
                                  pokemon.name.substring(1),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text(
                                'Tap untuk lihat detail',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) =>
                                          PokemonDetailScreen(pokemon: pokemon),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.arrow_upward, color: Colors.white),
      ),
    );
  }
}
