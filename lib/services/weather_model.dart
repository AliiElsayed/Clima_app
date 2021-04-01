import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';
const kApikey = 'e73f6b11dc134464eae9c6750e1ee6e5';

class WeatherModel {

  Future<dynamic> getCityWeather(String name) async {
    var requiredUrl = '$openWeatherMapURL?q=$name&appid=$kApikey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: requiredUrl);
    var cityWeatherData = await networkHelper.getData();
    return cityWeatherData;
  }

  Future<dynamic> getWeatherData() async {

    Location location = Location();
    await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kApikey&units=metric');
    var finalWeatherData = await networkHelper.getData();
    return finalWeatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 200) {
      return '🤷‍♂️'; // dont now
    } else if (condition < 300) {
      return '☈'; // thunderstorm
    } else if (condition < 400) {
      return '🌧'; //Drizzle
    } else if (condition < 600 && condition >= 500) {
      return '🌧️'; //Rain
    } else if (condition < 700) {
      return '🌨️'; //Snow
    } else if (condition < 800) {
      return '🌫'; //fog
    } else if (condition == 800) {
      return '⛅'; //clear
    } else if (condition <= 804) {
      return '☁️'; //cloud
    } else {
      return '🤷‍♂️';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp > 10) {
      return 'Bring a Coat just in case';
    } else {
      return 'You\'ll need Scarf and Gloves';
    }
  }
}
