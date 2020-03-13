import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  static Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    NetworkHelper nh = new NetworkHelper(
        url:
            '$kOpenWeatherMapUrl?lat=${loc.lat}&lon=${loc.long}&appid=$kApiKey&units=metric');

    return await nh.getData();
  }

  static Future<dynamic> getLocationWeatherByCity(String city) async {
    Location loc = Location();
    await loc.getCurrentLocation();
    NetworkHelper nh = new NetworkHelper(
        url: '$kOpenWeatherMapUrl?q=$city&appid=$kApiKey&units=metric');

    return await nh.getData();
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
