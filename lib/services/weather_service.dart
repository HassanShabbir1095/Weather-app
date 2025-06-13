import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class WeatherService {
  // Replace with your actual API key
  static const String _apiKey = '6b8786a53b8c8bf57f99204587c0c3de';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  // Fetch weather data for a city and country, returning temperature and condition
  static Future<Map<String, dynamic>?> fetchWeather(String city, String country) async {
    final url = '$_baseUrl?q=$city,$country&appid=$_apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final temp = data['main']?['temp']?.toDouble();
        final condition = data['weather']?[0]?['main'];

        if (temp == null || condition == null) {
          developer.log('Parsing error: temp or condition is null');
          return null;
        }

        return {
          'temperature': temp,
          'condition': condition,
        };
      } else {
        developer.log('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      developer.log('Exception: $e');
      return null;
    }
  }
}