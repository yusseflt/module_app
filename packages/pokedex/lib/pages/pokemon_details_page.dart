import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/bloc/pokedex_details_bloc.dart';
import 'package:pokedex/helpers/text_handler.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repository/navigator_manager.dart';
import 'package:pokedex/widgets/about_tab.dart';
import 'package:pokedex/widgets/base_stats_tab.dart';
import 'package:pokedex/widgets/loader_image.dart';
import 'package:pokedex/widgets/sprites_tab.dart';

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
                Positioned(
                  top: 100,
                  right: -200,
                  child: Image.asset(
                    'assets/png/pokeball.png',
                    package: 'pokedex',
                    color: Colors.white.withOpacity(0.8),
                    scale: 0.4,
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
                          right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              NavigatorManager.navigator.pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 24.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                  Row(
                                    children: pokemonModel.types!
                                        .map<Widget>(
                                          (Type type) => Container(
                                            margin: EdgeInsets.only(right: 8),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              color: TextHandler.getTypeColor(
                                                  type.type!.name!),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Text(
                                              type.type!.name!.toUpperCase(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(24),
                                    child: LoaderImage(
                                      'https://www.pkparaiso.com/imagenes/xy/sprites/animados/${pokemonModel.name}.gif',
                                      height: 120,
                                      width: 100,
                                      scale: 0.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                ),
                                child: DefaultTabController(
                                  initialIndex: 0,
                                  length: 3,
                                  child: Column(
                                    children: [
                                      TabBar(
                                        tabs: [
                                          Tab(
                                            child: Text(
                                              'About',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Text(
                                              'Base Stats',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Text(
                                              'Sprites',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          children: [
                                            AboutTab(
                                              height: pokemonModel.height!,
                                              weight: pokemonModel.weight!,
                                              abilities:
                                                  pokemonModel.abilities!,
                                            ),
                                            BaseStatsTab(
                                                stats: pokemonModel.stats!),
                                            SpritesTab(
                                              sprites: pokemonModel.sprites!,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
