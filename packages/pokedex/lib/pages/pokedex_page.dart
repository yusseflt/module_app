import 'package:flutter/material.dart';
import 'package:pokedex/bloc/pokedex_bloc.dart';
import 'package:pokedex/models/pokedex_model.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  PokedexBloc bloc = PokedexBloc();

  @override
  void initState() {
    super.initState();
    bloc.getPokedex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: bloc.pokedexStream,
          builder: (context, AsyncSnapshot<List<PokemonEntry>> snapshot) {
            if (snapshot.hasData) {
              List<PokemonEntry> list = snapshot.data!;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    'https://www.pkparaiso.com/imagenes/xy/sprites/animados/${list[index].pokemonSpecies!.name}.gif',
                    errorBuilder: (context, obj, trace) => Center(
                      child: Icon(Icons.close),
                    ),
                    loadingBuilder: (context, child, loader) {
                      if (loader == null) {
                        return Center(child: child);
                      }
                      return Center(
                          child: CircularProgressIndicator(
                        value: loader.expectedTotalBytes != null
                            ? loader.cumulativeBytesLoaded /
                                loader.expectedTotalBytes!
                            : null,
                      ));
                    },
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
