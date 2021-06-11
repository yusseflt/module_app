import 'package:pokedex/models/pokedex_model.dart';
import 'package:pokedex/repository/api_manager.dart';
import 'package:rxdart/subjects.dart';

class PokedexBloc {
  PublishSubject<List<PokemonEntry>>? _pokedexSubject;
  Stream<List<PokemonEntry>> get pokedexStream => _pokedexSubject!.stream;
  ApiManager _apiManager = ApiManager.instance;

  PokedexBloc() {
    _pokedexSubject = PublishSubject<List<PokemonEntry>>();
  }

  Future getPokedex() async {
    try {
      var res = await _apiManager.getPokedex();

      PokedexModel pokedexModel = PokedexModel.fromJson(res);

      _pokedexSubject!.sink.add(pokedexModel.pokemonEntries!);
    } catch (e) {
      _pokedexSubject!.addError(e);
      throw e;
    }
  }
}
