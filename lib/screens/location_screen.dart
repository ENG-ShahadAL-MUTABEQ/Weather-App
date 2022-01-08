import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, this.locationWeather}) : super(key: key);

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  var temp;
  String? cityName;
  //String? weatherIcon;
  String? weatherMessage;
  Image? weatherImage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        weatherImage = Image.asset(
          'images/sad.png',
          height: 100.0,
          width: 100.0,
        );
        weatherMessage = 'Unable to get Weather Data!!';
        cityName = ' ';
        return;
      }
      double temp2d = weatherData['main']['temp'];
      temp = temp2d.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherImage = weatherModel.getWeatherImage(condition);
      weatherMessage = weatherModel.getMessage(temp);
      cityName = weatherData['name'];
    });
    //weatherIcon = weatherModel.getWeatherIcon(condition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xFF2C0431),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70),
                  )),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            onPressed: () async {
                              var weatherData =
                                  await weatherModel.getLocationWeather();
                              updateUI(weatherData);
                            },
                            iconSize: 40.0,
                            icon: const Icon(
                              Icons.location_on,
                              size: 40.0,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              var typedName = await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const CityScreen();
                                }),
                              );
                              if (typedName != null) {
                                var weatherData = await weatherModel
                                    .getCityWeather(typedName);
                                updateUI(weatherData);
                              }
                            },
                            iconSize: 40.0,
                            icon: const Icon(
                              Icons.search,
                              size: 45.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 80.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text(
                        '$cityName',
                        textAlign: TextAlign.left,
                        style: kCityName,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            '$temp°',
                            style: kTempTextStyle,
                          ),
                          Container(
                            child: weatherImage,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                '$weatherMessage!',
                textAlign: TextAlign.center,
                style: kMessageTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
