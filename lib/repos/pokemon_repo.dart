import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_24_sept/data/models/pokemon.dart';
import 'package:pokedex_24_sept/network/dio_client.dart';
import 'package:pokedex_24_sept/utils/helpers/constants.dart';



class PokemonRepo {
  final Ref ref;

  PokemonRepo(this.ref);

  Future<List<Pokemon>> getAllPokemons() async {
    try{
      final response = await ref.read(dioProvider).get(Constants.POKEMON_API_URL);

      if(response.statusCode==200){
        final decodeJson = jsonDecode(response.data);
        List<Pokemon> pokelist = decodeJson.map<Pokemon>((pokemon)=> Pokemon.fromJson(pokemon)).toList();
        log(decodeJson.toString());
        return pokelist;
      }else{
        return Future.error('Failed to load pokemons');
      }
    
    }catch(e){
      throw Exception(e);
      
      }
  }
}


final pokemonRepoProvider = Provider<PokemonRepo>((ref)=>PokemonRepo(ref));