import 'package:flutter/cupertino.dart';
import 'package:section_weather_app/models/weather_model.dart';

class Weather_Provider extends ChangeNotifier{
  Weather_Model? _weather_data;
  set weatherdata(Weather_Model? weather){
    _weather_data =weather;
    notifyListeners();
  }
  Weather_Model? get weather_data =>_weather_data;
}