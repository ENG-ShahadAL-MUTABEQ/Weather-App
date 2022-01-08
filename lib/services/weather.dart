import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const apiKey = '1eb3f3f3e4550a7f8134225302781ba1';
const openWeatherURI = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        Uri.parse('$openWeatherURI?q=$cityName&appid=$apiKey&units=metric'));

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(Uri.parse(
        '$openWeatherURI?lat=${location.lat}&lon=${location.log}&appid=$apiKey&units=metric'));
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Image getWeatherImage(int condition) {
    if (condition <= 300) {
      return Image.asset(
        'images/storm.png',
        height: 100.0,
        width: 100.0,
      ); //storm
    } else if (condition <= 400) {
      return Image.asset(
        'images/rainy.png',
        height: 100.0,
        width: 100.0,
      );
      //rainy
    } else if (condition <= 600) {
      return Image.asset(
        'images/umbrella.png',
        height: 100.0,
        width: 100.0,
      ); //umbrella
    } else if (condition <= 700) {
      return Image.asset(
        'images/snowy.png',
        height: 100.0,
        width: 100.0,
      ); //snowy
    } else if (condition <= 800) {
      return Image.asset(
        'images/windy.png',
        height: 100.0,
        width: 100.0,
      ); //windy
    } else if (condition == 800) {
      return Image.asset(
        'images/sun.png',
        height: 100.0,
        width: 100.0,
      ); //sun
    } else if (condition <= 804) {
      return Image.asset(
        'images/cloudy.png',
        height: 100.0,
        width: 100.0,
      ); //cloudy
    } else {
      return Image.asset(
        'images/sad.png',
        height: 100.0,
        width: 100.0,
      ); //sad
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Wear a 🧥 Stay warm';
    }
  }
}
