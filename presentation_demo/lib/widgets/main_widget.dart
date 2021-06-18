import 'package:flutter/material.dart';
import 'weather_tile.dart';

///variables
class MainWidget extends StatelessWidget {
  final location;
  final temp;
  final tempMin;
  final tempMax;
  final weather;
  final humidity;
  final windSpeed;

  ///requires the variables to have data
  MainWidget({
    @required this.location,
    @required this.temp,
    @required this.tempMin,
    @required this.tempMax,
    @required this.weather,
    @required this.humidity,
    @required this.windSpeed,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ///Displays the location, temperature, min & max temperature
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/3,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  '${location}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  '${temp}°C',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Text(
                'Low of ${tempMin}°C,  High of ${tempMax}°C',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
        ),
        ///Listview for the other weather information
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: ListView(
              children: <Widget>[
                WeatherTile(
                    icon: Icons.thermostat_outlined,
                    title: 'Temperature',
                    subtitle: '${temp}°C'),
                WeatherTile(
                    icon: Icons.filter_drama_outlined,
                    title: 'Weather',
                    subtitle: '${weather}'),
                WeatherTile(
                    icon: Icons.wb_sunny,
                    title: 'Humidity',
                    subtitle: '${humidity}%'),
                WeatherTile(
                    icon: Icons.waves_outlined,
                    title: 'Wind Speed',
                    subtitle: '${windSpeed} mph'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
