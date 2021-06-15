import 'package:flutter/material.dart';
import 'package:pokedex/bloc/pokedex_bloc.dart';
import 'package:pokedex/helpers/text_handler.dart';
import 'package:pokedex/models/pokedex_model.dart';
import 'package:pokedex/repository/navigator_manager.dart';
import 'package:pokedex/widgets/pokedex_list_item.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 57,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: MediaQuery.of(context).padding.left,
              right: MediaQuery.of(context).padding.right,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      NavigatorManager.parentNavigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  ),
                ),
                Center(
                  child: Text(
                    'Pokedex',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: bloc.pokedexStream,
                builder: (context, AsyncSnapshot<List<PokemonEntry>> snapshot) {
                  if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Center(
                        child: Text(
                          'Erro: ${snapshot.error}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    List<PokemonEntry> list = snapshot.data!;
                    return GridView.builder(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 12, bottom: 32),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          mainAxisExtent: 100),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return PokedexListItem(
                          pokemon: list[index].pokemonSpecies!,
                          index: index,
                        );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
