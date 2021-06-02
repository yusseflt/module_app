import 'package:http/http.dart' as http;
import 'package:module_app/helpers/request_handler.dart';

class ApiManager {
  static final ApiManager _apiManager = ApiManager();

  static const String WEATHER_URL = "http://api.openweathermap.org/data/2.5";

  ApiManager get instance => _apiManager;

  Future currentWeatherByCity(String cityName) async {
    try {
      Uri uri = Uri.parse(
          '$WEATHER_URL/weather?q=$cityName&appid=59cbf0a7dc265dc2f2dce853d96a57d3&units=metric');
      var res = await RequestHandler.handleResponse(await http.get(uri));

      return res;
    } catch (e) {
      throw e;
    }
  }
}
