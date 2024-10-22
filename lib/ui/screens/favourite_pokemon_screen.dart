import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_24_sept/data/models/pokemon.dart';
import 'package:pokedex_24_sept/providers/pokemon_future_provider.dart';
import 'package:pokedex_24_sept/repos/hive_repo.dart';

// class FavouritePokemonScreen extends ConsumerStatefulWidget {
//   const FavouritePokemonScreen({super.key});

//   @override
//   ConsumerState<FavouritePokemonScreen> createState() => _FavouritePokemonScreenState();
// }

// class _FavouritePokemonScreenState extends ConsumerState<FavouritePokemonScreen> {

//   List<Pokemon> favPokemonList = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.microtask(()async {
//       await ref.read(hiveRepoProvider)
//       .getAllPokemonFromHive()
//       .then((pokemonList){
//         log(pokemonList.length.toString());
//         setState(() {
//           favPokemonList =  pokemonList;
//         });
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       appBar: AppBar(title: Text('Favorite Pokemon screen'),),
//       body: 
//       ListView.builder(itemCount: favPokemonList.length,itemBuilder: (context, index) {
//          return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
//             CachedNetworkImage(imageUrl: favPokemonList[index].imageurl!,height: 80,),
//             Column(children: [Text(favPokemonList[index].name!),Text(favPokemonList[index].typeofpokemon!.first)],),
//             IconButton(onPressed: (){
//               ref.read(hiveRepoProvider).deletePokemon(favPokemonList[index].id!);
          
//                 ref.read(hiveRepoProvider)
//                 .getAllPokemonFromHive()
//                 .then((pokemonList){
//                   log(pokemonList.length.toString());
//             setState(() {
//           favPokemonList =  pokemonList;
//         });
//       });
             
//             },icon:Icon(Icons.delete))
//           ],);
//       },)
//       // Text(favPokemonList.length!=0?favPokemonList.first.name!:'No Pokemon'),
//     );
//   }
// }

class FavouritePokemonScreen extends ConsumerStatefulWidget {
  const FavouritePokemonScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavouritePokemonScreenState();
}

class _FavouritePokemonScreenState extends ConsumerState<FavouritePokemonScreen> {

  @override
  Widget build(BuildContext context) {
    final AsyncValue<int> asyval = ref.watch(counterStreamProvider);
    return Scaffold(body: asyval.when(data: (data){
        return Center(child: Text(data.toString()));
    }, error: (error,sd){

    }, loading: (){}));
  }
}