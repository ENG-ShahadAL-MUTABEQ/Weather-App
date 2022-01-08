import 'package:flutter/material.dart';

class WeatherDisplayData {
  AssetImage? weatherImage;
  WeatherDisplayData({required this.weatherImage});
}

WeatherDisplayData getWeatherDisplayData(int condition) {
  if (condition < 300) {
    return WeatherDisplayData(
      weatherImage: const AssetImage(
        'images/storm.png',
      ),
    ); //storm
  } else if (condition < 400) {
    return WeatherDisplayData(
      weatherImage: const AssetImage('images/rainy.png'),
    ); //rainy
  } else if (condition < 600) {
    return WeatherDisplayData(
      weatherImage: const AssetImage('images/umbrella.png'),
    ); //umbrella
  } else if (condition < 700) {
    return WeatherDisplayData(
      weatherImage: const AssetImage('images/snowy.png'),
    ); //snowy
  } else if (condition < 800) {
    return WeatherDisplayData(
      weatherImage: const AssetImage('images/windy.png'),
    ); //windy
  } else if (condition == 800) {
    return WeatherDisplayData(
      weatherImage: const AssetImage('images/sun.png'),
    ); //sun
  } else if (condition <= 804) {
    return WeatherDisplayData(
      weatherImage: const AssetImage('assets/cloudy.png'),
    ); //cloudy
  } else {
    return WeatherDisplayData(
      weatherImage: const AssetImage('images/sad.png'),
    ); //sad
  }
}
