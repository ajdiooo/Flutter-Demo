import 'package:flutter/material.dart';
import 'widgets/main_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

///fetch the weather info from the API
Future<WeatherInfo> fetchWeather() async {
  final zipCode = "2009";
  final apiKey = "2febb54761dab16b53d00339bcb754db";
  final requesturl = "http://api.openweathermap.org/data/2.5/weather?zip=${zipCode},PH&units=metric&appid=${apiKey}";

  final response = await http.get(Uri.parse(requesturl));

  if (response.statusCode == 200) {
    return WeatherInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading request URL info.");
  }
}

///variables
class WeatherInfo {
  final location;
  final temp;
  final tempMin;
  final tempMax;
  final weather;
  final humidity;
  final windSpeed;

  ///requires the variables to have data
  WeatherInfo({
    @required this.location,
    @required this.temp,
    @required this.tempMin,
    @required this.tempMax,
    @required this.weather,
    @required this.humidity,
    @required this.windSpeed,
});

  ///address the specific json data
  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      location: json['name'],
      temp: json['main']['temp'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
      weather: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<WeatherInfo> futureWeather;

  ///refresh the UI to display the data
  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherInfo>(
        future: futureWeather,
        builder: (context, snapshot){
          if (snapshot.hasData){
            ///pass the data from the API to main_widget
            return MainWidget(
              location: snapshot.data.location,
              temp: snapshot.data.temp,
              tempMin: snapshot.data.tempMin,
              tempMax: snapshot.data.tempMax,
              weather: snapshot.data.weather,
              humidity: snapshot.data.humidity,
              windSpeed: snapshot.data.windSpeed,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}'
              ),
            );
          } else {
            return Center(
              child: Text(
                  'Something went wrong...'
              ),
            );
          }
        },
      )
    );
  }
}
