import 'package:http/http.dart' as http;
import 'package:pokedex/helpers/request_handler.dart';

class ApiManager {
  static final ApiManager _apiManager = ApiManager();
  static const String POKEDEX_URL = "https://pokeapi.co/api/v2";
  static ApiManager get instance => _apiManager;

  Future getPokedex() async {
    try {
      Uri uri = Uri.parse('$POKEDEX_URL/pokedex/1');
      var res = await RequestHandler.handleResponse(await http.get(uri));

      return res;
    } catch (e) {
      throw e;
    }
  }

  Future getPokemonDetailsById(int id) async {
    try {
      Uri uri = Uri.parse('$POKEDEX_URL/pokemon/$id');
      var res = await RequestHandler.handleResponse(await http.get(uri));

      return res;
    } catch (e) {
      throw e;
    }
  }
}
