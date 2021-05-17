import 'package:flutter/material.dart';
import 'package:clima/services/weather_model.dart';
import 'package:clima/utilites/constants.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:progress_hud/progress_hud.dart';


class LocationScreen extends StatefulWidget {
  LocationScreen({@required this.weatherData});
  final weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherHelper = WeatherModel();
  int temperature;
  String weatherIcon;
  var weatherMessage;
  String city;
  String description;
  String inWord;
  ProgressHUD _progress;



  @override
  void initState() {
    super.initState();
    _progress = ProgressHUD(
      backgroundColor: Colors.grey.withOpacity(0.1),
      color: Colors.blueAccent.shade100,
      // text: 'loading',
      loading: false,
      containerColor: Colors.blue.withOpacity(0.0),
      borderRadius: 20.0,
    );
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic data) {
    setState(() {
      if (data == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable To Fetch Weather Data';
        city = '';
        inWord = '';
        return;
      }
      var temp = data['main']['temp'];
      temperature = temp.toInt();
      int condition = data['weather'][0]['id'];
      weatherIcon = weatherHelper.getWeatherIcon(condition);
      weatherMessage = weatherHelper.getMessage(temperature);
      city = data['name'];
      description = data['weather'][0]['description'];
      inWord = 'in';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/location_background.jpg',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.9), BlendMode.dstATop),
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          child: Icon(
                            Icons.near_me,
                            color: Colors.white,
                            size: 40.0,
                          ),
                          onPressed: () async {
                           _progress.state.show();
                            var weatherData =
                                await weatherHelper.getWeatherData();
                            updateUI(weatherData);
                            _progress.state.dismiss();
                          },
                        ),
                        FlatButton(
                          child: Icon(
                            Icons.location_city,
                            color: Colors.white,
                            size: 40.0,
                          ),
                          onPressed: () async {
                            String cityName = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CityScreen(),
                              ),
                            );
                            if (cityName != null) {
                              var cityWeatherData =
                                  await weatherHelper.getCityWeather(cityName);
                              updateUI(cityWeatherData);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$temperature°',
                              style: kRowTextStyle,
                            ),
                            Text(
                              '$description',
                              style: kDescriptionTextStyle,
                            ),
                          ],
                        ),
                        Text(
                          weatherIcon,
                          style: kEmojiStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      '$weatherMessage \n $inWord $city ',
                      style: kMessageTextStyle,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _progress,
        ],
      ),
    );
  }
}
