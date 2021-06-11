import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repository/api_manager.dart';
import 'package:rxdart/subjects.dart';

class PokemonDetailsBloc {
  PublishSubject<PokemonModel>? _pokemonDetailsSubject;
  Stream<PokemonModel> get stream => _pokemonDetailsSubject!.stream;
  ApiManager _apiManager = ApiManager.instance;

  PokemonDetailsBloc() {
    _pokemonDetailsSubject = PublishSubject<PokemonModel>();
  }

  Future getDetailsById(int id) async {
    try {
      var res = await _apiManager.getPokemonDetailsById(id);

      PokemonModel pokemonModel = PokemonModel.fromJson(res);

      _pokemonDetailsSubject!.sink.add(pokemonModel);
    } catch (e) {
      _pokemonDetailsSubject!.addError(e);
    }
  }
}
