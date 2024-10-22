import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:pokedex_24_sept/data/models/pokemon.dart';

class HiveRepo {
  final pokemonBoxName = 'pokemonBox';

  void registerAdapter()
  {
    Hive.registerAdapter(PokemonAdapter());
  } 

  void addPokemon(Pokemon pokemon)async{
    final pokemonBox = await Hive.openBox<Pokemon>(pokemonBoxName);
    if(pokemonBox.isOpen){
      await pokemonBox.put(pokemon.id!, pokemon);
    }else{
      throw Exception('Box is not open');
    }
  }

   void deletePokemon(String id)async{
    final pokemonBox = await Hive.openBox<Pokemon>(pokemonBoxName);
    if(pokemonBox.isOpen){
      await pokemonBox.delete(id);
    }else{
      throw Exception('Box is not open');
    }
  }

  Future<List<Pokemon>> getAllPokemonFromHive() async{
     final pokemonBox = await Hive.openBox<Pokemon>(pokemonBoxName);
    if(pokemonBox.isOpen){
      return pokemonBox.values.toList();
    }else{
      throw Exception('Box is not open');
    }
  }

    Future<Pokemon> getSinglePokemonFromHive(String id) async{
     final pokemonBox = await Hive.openBox<Pokemon>(pokemonBoxName);
    if(pokemonBox.isOpen){
      return pokemonBox.get(id)!;
    }else{
      throw Exception('Box is not open');
    }
  }
}

final hiveRepoProvider = Provider<HiveRepo>((repo)=>HiveRepo());