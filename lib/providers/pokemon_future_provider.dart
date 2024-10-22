import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_24_sept/data/models/pokemon.dart';
import 'package:pokedex_24_sept/repos/pokemon_repo.dart';

final pokemonFutureProvider = FutureProvider<List<Pokemon>>((ref) async {
return await ref.watch(pokemonRepoProvider).getAllPokemons();
});



final counterStreamProvider = StreamProvider<int>((ref)async*{
  int counter = 0;
  while(counter<20){
    await Future.delayed(const Duration(milliseconds: 500));
    yield counter++;
  }
});