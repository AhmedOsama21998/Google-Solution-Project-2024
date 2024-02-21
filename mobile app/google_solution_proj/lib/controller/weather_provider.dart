import 'package:flutter/cupertino.dart';
import 'package:google_solution_proj/model/weather_model.dart';
import 'package:provider/provider.dart';
class WeatherProvider extends ChangeNotifier{
  String?cityName;
  WeatherModel? _weatherData;
  set weatherData(WeatherModel? weather){
    _weatherData =weather;
    notifyListeners();
  }
  WeatherModel ?get weatherData=>_weatherData;
}