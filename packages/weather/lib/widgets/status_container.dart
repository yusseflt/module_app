import 'package:flutter/material.dart';
import 'package:weather/helpers/text_handler.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repository/navigator_manager.dart';
import 'package:weather/widgets/status_item.dart';

class StatusContainer extends StatelessWidget {
  final WeatherModel weather;
  const StatusContainer({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Colors.white.withOpacity(0.1),
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: InkWell(
            onTap: () {
              NavigatorState navigator = NavigatorManager.navigator;

              navigator.pushNamed('weatherDetails', arguments: weather);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: StatusItem(
                    topText: TextHandler.formatHumidity(weather.main!.humidity),
                    bottomText: 'Humidity',
                  ),
                ),
                Container(
                  width: 1.6,
                  height: 24,
                  color: Colors.white.withOpacity(0.4),
                ),
                Expanded(
                  child: StatusItem(
                    topText: TextHandler.formatPressure(weather.main!.pressure),
                    bottomText: 'Pressure',
                  ),
                ),
                Container(
                  width: 1.6,
                  height: 24,
                  color: Colors.white.withOpacity(0.4),
                ),
                Expanded(
                  child: StatusItem(
                    topText: TextHandler.formatWindSpeed(weather.wind!.speed),
                    bottomText: 'Wind',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
