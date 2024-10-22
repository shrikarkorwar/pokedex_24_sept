import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_24_sept/data/models/pokemon.dart';
import 'package:pokedex_24_sept/providers/theme_providers.dart';
import 'package:pokedex_24_sept/repos/hive_repo.dart';
import 'package:pokedex_24_sept/ui/widgets/rotating_widgets.dart';
import 'package:pokedex_24_sept/utils/extensions/buildcontext_extensions.dart';
import 'package:pokedex_24_sept/utils/helpers/helpers.dart';

class PokemonDetailsScreen extends ConsumerStatefulWidget {
  const PokemonDetailsScreen({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  ConsumerState<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends ConsumerState<PokemonDetailsScreen> {
  bool isFav=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.pokemon.name!,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {

                ref.read(hiveRepoProvider).addPokemon(widget.pokemon);
                isFav=true;
                setState(() {
                  
                });
              },
              icon: Icon(
                Icons.favorite,
                color:isFav?Colors.white:Colors.black,
              ))
        ],
      ),
      backgroundColor: Helpers.getPokemonCardColour(
          pokemonType: widget.pokemon.typeofpokemon!.first),
      body: Stack(
        children: [
          Positioned(top: 50,left: context.getWidth(percentage: 0.5)-125, 
          child:
          //  Image.asset('images/pokeball.png',width: 250,fit: BoxFit.fitWidth)
          RotatingImageWidget()
           ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
              height: context.getHeight(percentage: 0.60),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16,25,8,0),
                    child: Text(widget.pokemon.xdescription!),
                  ),
                  nameDetailsWidget(name:'Name',descp:widget.pokemon.name),
                  nameDetailsWidget(name:'Height',descp:widget.pokemon.height),
                  nameDetailsWidget(name:'Category',descp:widget.pokemon.category),
                  nameDetailsWidget(name:'Speed',descp:widget.pokemon.speed.toString()),
                  nameDetailsWidget(name:'Attack',descp:widget.pokemon.attack.toString()),
                  nameDetailsWidget(name:'Defense',descp:widget.pokemon.special_defense.toString()),
                  nameDetailsWidget(name:'Special Attack',descp:widget.pokemon.special_attack.toString()),
                  nameDetailsWidget(name:'Weakness',descp:widget.pokemon.weaknesses!.join(',')),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: context.getWidth(percentage: 0.5)-125,
            child: Hero(
              tag: widget.pokemon.id!,
              child: CachedNetworkImage(imageUrl: widget.pokemon.imageurl!,
              width: 250,fit: BoxFit.fitWidth,placeholder: (context, url) {
                return const CircularProgressIndicator();
              },),
            ),
          ),
        ],
      ),
    );
  }
}

class nameDetailsWidget extends StatelessWidget {
  const nameDetailsWidget({
   this.name, this.descp,
  });

  final name;
  final descp;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16,10,10,0),
        child: Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0,0,50,0),
        child: Text(descp,softWrap: true,style: TextStyle(fontSize: 15,),textAlign: TextAlign.start,maxLines: 2,),
      )
    ],);
  }
}
