import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:weather/weather.dart';

class RemoteConfigManager {
  static RemoteConfig remoteConfigInstance = RemoteConfig.instance;

  static void initFirebase() async {
    await Firebase.initializeApp();
    await remoteConfigInstance.fetchAndActivate();

    print(remoteConfigInstance.getAll());

    Weather.addApiKey(remoteConfigInstance.getString('weather_api_key'));
  }
}
