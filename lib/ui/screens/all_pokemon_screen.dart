import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_24_sept/data/models/pokemon.dart';
import 'package:pokedex_24_sept/providers/pokemon_future_provider.dart';
import 'package:pokedex_24_sept/providers/theme_providers.dart';
import 'package:pokedex_24_sept/repos/pokemon_repo.dart';
import 'package:pokedex_24_sept/themes/styles.dart';
import 'package:pokedex_24_sept/ui/screens/favourite_pokemon_screen.dart';
import 'package:pokedex_24_sept/ui/screens/pokemon_details_screen.dart';
import 'package:pokedex_24_sept/utils/extensions/buildcontext_extensions.dart';
import 'package:pokedex_24_sept/utils/helpers/helpers.dart';

class AllPokemonScreen extends ConsumerWidget {
  const AllPokemonScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final AsyncValue<List<Pokemon>> pokemonList = ref.watch(pokemonFutureProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Pokedex'),actions: [IconButton(onPressed: (){
      // Navigator.of(context).push(MaterialPageRoute(buildexr: (context) => FavouritePokemonScreen(),));
      context.nav(const FavouritePokemonScreen());
    },icon:const Icon(Icons.favorite)),IconButton(onPressed: (){
      ref.read(themeProvider.notifier).toggleTheme();
    },icon:const Icon(Icons.lightbulb))],),body: 
      pokemonList.when(data: (data){
          return GridView.builder(itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 1/1), 
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                pokemonList.when(data: (data){
                    context.nav(PokemonDetailsScreen(pokemon: data[index]));  
                }, error: (error,stk){}, loading: (){});
                
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(color: Helpers.getPokemonCardColour(pokemonType: data[index].typeofpokemon!.first),
                child: Stack(
                  children: [
                    Positioned(top:10 ,
                    left: 10,
                      child: Text(data[index].name!,style: const TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold))),
                    Positioned(top:40 ,
                    left: 10,child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: const Color.fromARGB(125, 0, 0, 0)),child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(data[index].typeofpokemon!.first,style: const TextStyle(color: Colors.white),),
                    ))),
                    Positioned(top: 50,
                      left: 45,child: Image.asset('images/pokeball.png',height: 150,)),
                    Positioned(
                      top: 50,
                      left: 45,
                      child: Hero(
                        tag: data[index].id!,
                        child: CachedNetworkImage(imageUrl: data[index].imageurl!,
                        height: 150,
                        fit: BoxFit.cover,placeholder: (context, url) {
                          return const Center(child: CircularProgressIndicator());
                        }),
                      ),
                    ),
                    
                  ],
                )),
              ),
            );
          },);
      }, error: (error,stk){
          return Center(child: Text(error.toString()));
      }, loading: (){
          return const Center(child: CircularProgressIndicator());
      })
    );
  }
}

