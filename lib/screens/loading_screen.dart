import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather_model.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getLocationWeather();
  }

  Future<void> getLocationWeather() async {
    WeatherModel weather = WeatherModel();
    var weatherData = await weather.getWeatherData();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          weatherData: weatherData,
        ),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please, Wait While Loading...',
              style: TextStyle(fontSize: 25.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.0,
            ),

            SpinKitDualRing(

              size: 70.0,
              color: Colors.blue.shade200,
            ),
          ],
        ),
      ),
    );
  }
}
