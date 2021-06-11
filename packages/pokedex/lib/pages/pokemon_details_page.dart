import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/bloc/pokedex_details_bloc.dart';
import 'package:pokedex/helpers/text_handler.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repository/navigator_manager.dart';

class PokemonDetailsPage extends StatefulWidget {
  final arguments;

  const PokemonDetailsPage(
    this.arguments, {
    Key? key,
  }) : super(key: key);

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  PokemonDetailsBloc bloc = PokemonDetailsBloc();
  NumberFormat formatter = NumberFormat('#000');

  bool execGif = false;
  int? id;

  @override
  void initState() {
    super.initState();
    id = widget.arguments + 1;
    bloc.getDetailsById(id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.stream,
        builder: (context, AsyncSnapshot<PokemonModel> snapshot) {
          if (snapshot.hasError) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: MediaQuery.of(context).padding.top,
                  ),
                  child: IconButton(
                    onPressed: () {
                      NavigatorManager.navigator.pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      'Erro: ${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            );
          }
          if (snapshot.hasData) {
            PokemonModel pokemonModel = snapshot.data!;
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: TextHandler.getTypeColor(
                    pokemonModel.types![0].type!.name!,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                        top: MediaQuery.of(context).padding.top,
                        bottom: 8,
                      ),
                      child: IconButton(
                        onPressed: () {
                          NavigatorManager.navigator.pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  TextHandler.capitalizeFirstLetter(
                                      pokemonModel.name!),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                  ),
                                ),
                                Text(
                                  '#${formatter.format(id)}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 10,
                              width: 10,
                              child: Stack(
                                children: [],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              width: double.infinity,
                              height: 240,
                              child: Image.network(
                                'https://www.pkparaiso.com/imagenes/xy/sprites/animados/${pokemonModel.name}-2.gif',
                                scale: 0.8,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Container(
                              child: Image.network(
                                'https://www.pkparaiso.com/imagenes/xy/sprites/animados/${pokemonModel.name}.gif',
                                height: 100,
                                width: 100,
                                scale: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
