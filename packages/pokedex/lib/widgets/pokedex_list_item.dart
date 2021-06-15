import 'package:flutter/material.dart';
import 'package:pokedex/helpers/text_handler.dart';
import 'package:pokedex/models/pokedex_model.dart';
import 'package:pokedex/repository/navigator_manager.dart';
import 'package:pokedex/widgets/loader_image.dart';

class PokedexListItem extends StatelessWidget {
  final PokemonSpecies pokemon;
  final int index;

  const PokedexListItem({
    Key? key,
    required this.pokemon,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black,
      borderRadius: BorderRadius.circular(8),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {
            NavigatorManager.navigator.pushNamed(
              'pokemonDetails',
              arguments: index,
            );
          },
          child: Stack(
            children: [
              Positioned(
                bottom: -30,
                right: -20,
                child: Image.asset(
                  'assets/png/pokeball.png',
                  package: 'pokedex',
                  color: Colors.white.withOpacity(0.8),
                  scale: 1.4,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TextHandler.capitalizeFirstLetter(pokemon.name!),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '#${index + 1}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    LoaderImage(
                      'https://www.pkparaiso.com/imagenes/xy/sprites/animados/${pokemon.name}.gif',
                      width: 70,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
