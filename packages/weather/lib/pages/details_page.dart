import 'package:flutter/material.dart';
import 'package:weather/helpers/text_handler.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repository/navigator_manager.dart';

class WeatherDetailsPage extends StatefulWidget {
  final arguments;

  WeatherDetailsPage(this.arguments);

  @override
  _WeatherDetailsPageState createState() => _WeatherDetailsPageState();
}

class _WeatherDetailsPageState extends State<WeatherDetailsPage> {
  WeatherModel? weather;
  List<Map<String, String>> strings = [];
  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 22,
  );

  @override
  void initState() {
    super.initState();

    weather = widget.arguments;

    var a = [
      {
        "title": 'Max',
        "content": "${TextHandler.formatTemperature(weather!.main!.tempMax)}C",
      },
      {
        "title": 'Min',
        "content": "${TextHandler.formatTemperature(weather!.main!.tempMin)}C",
      },
      {
        "title": 'Actual temp',
        "content": "${TextHandler.formatTemperature(weather!.main!.temp)}C",
      },
    ];

    strings.addAll([
      {
        "title": 'Climate',
        "content": "${weather!.weather![0].main}",
      },
      {
        "title": 'Description',
        "content": "${weather!.weather![0].description}",
      },
      {
        "title": 'Clouds',
        "content": "${weather!.clouds!.all}%",
      },
      {
        "title": 'Feels like',
        "content":
            "${TextHandler.formatTemperature(weather!.main!.feelsLike)}C",
      },
      {
        "title": 'Humidity',
        "content": "${TextHandler.formatHumidity(weather!.main!.humidity)}",
      },
      {
        "title": 'Pressure',
        "content": "${TextHandler.formatPressure(weather!.main!.pressure)}",
      },
      {
        "title": 'Wind Speed',
        "content": "${TextHandler.formatWindSpeed(weather!.wind!.speed)}",
      },
      {
        "title": 'Wind Direction',
        "content": "${weather!.wind!.deg}°",
      },
      {
        "title": 'Sunrise',
        "content": "${TextHandler.formatDate(weather!.sys!.sunrise!)}",
      },
      {
        "title": 'Sunset',
        "content": "${TextHandler.formatDate(weather!.sys!.sunset!)}",
      },
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(32, 63, 94, 1),
            Color.fromRGBO(7, 15, 23, 1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: 16,
              ),
              child: IconButton(
                onPressed: () {
                  NavigatorManager.navigator.pop();
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.network(
                    'http://openweathermap.org/img/wn/${weather!.weather![0].icon}@2x.png'),
              ),
            ),
            SizedBox(height: 12),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Max: ${TextHandler.formatTemperature(weather!.main!.tempMax)}C',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Min: ${TextHandler.formatTemperature(weather!.main!.tempMin)}C',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 80,
                ),
                children: [
                  for (Map<String, String> map in strings)
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            map['title']!,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                          Text(
                            map['content']!,
                            style: textStyle,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
