import 'package:flutter/material.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/helpers/image_loader.dart';
import 'package:weather/helpers/text_handler.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repository/navigator_manager.dart';
import 'package:weather/widgets/status_container.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherBloc bloc = WeatherBloc();
  ImageLoader imageLoader = ImageLoader.instance;
  Image? selectedBackground;

  List? images;

  @override
  void initState() {
    super.initState();
    bloc.getWeatherByCity();
    // int rand = Random().nextInt(6);
    images = [
      imageLoader.clearDay,
      imageLoader.rainDay,
      imageLoader.snowDay,
      imageLoader.clearNight,
      imageLoader.rainNight,
      imageLoader.snowNight,
    ];

    selectedBackground = imageLoader.clearDay;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 27, 36, 1),
      body: Stack(
        children: [
          selectedBackground!,
          Container(
            width: double.infinity,
            height: double.infinity,
            child: StreamBuilder(
              stream: bloc.weatherStream,
              builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
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
                  WeatherModel? weather = snapshot.data;
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: MediaQuery.of(context).padding.top,
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            NavigatorManager.parentNavigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${weather!.name}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        ),
                                        Text(
                                          TextHandler.formatTemperature(
                                              weather.main!.temp),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 120,
                                          ),
                                        ),
                                      ],
                                    ),
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: Text(
                                        '${weather.weather![0].description}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                StatusContainer(weather: weather)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
