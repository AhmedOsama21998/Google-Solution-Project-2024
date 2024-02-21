import 'package:flutter/material.dart';
import 'package:google_solution_proj/config/assets.dart';
import 'package:google_solution_proj/style/styles.dart';

class WeatherModel {
  String date;

  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date : data['location']['localtime'],
        temp : jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
  /// The image of the weather
  String getImage(){
    if (weatherStateName =='Thunderstorm'||weatherStateName=='Thunder'){
      return AssetData.scatteradThunder;
  }
  else if(weatherStateName =='Clear'||weatherStateName=='Light Cloud'){
      return AssetData.cloudyClear;
  }
  else if(weatherStateName=='Snow'||weatherStateName=='Hail'||weatherStateName=='Sleet'){
  return AssetData.snow;}
  else if(weatherStateName=='Heavy Cloud'){
        return AssetData.cloudy;
    }
  else if(weatherStateName=='Heavy Rain'||weatherStateName=='Showers'||weatherStateName=='Light Rain'||weatherStateName=='Patchy rain possible'){
return AssetData.rainly;
    }

  else {
return AssetData.cloud;
    }
  }
  MaterialColor getThemeColor(){
    if (weatherStateName =='Thunderstorm'||weatherStateName=='Thunder'){
      return Styles.brown;
  }
  else if(weatherStateName =='Clear'||weatherStateName=='Light Cloud'){
      return Styles.orange;
  }
  else if(weatherStateName=='Snow'||weatherStateName=='Hail'||weatherStateName=='Sleet'){
  return Styles.blue;}
  else if(weatherStateName=='Heavy Cloud'){
        return Styles.blueGrey;
    }
  else if(weatherStateName=='Heavy Rain'||weatherStateName=='Showers'||weatherStateName=='Light Rain'||weatherStateName=='Patchy rain possible'){
return Styles.blue;
    }

  else {
return Styles.orange;
    }
  }
}