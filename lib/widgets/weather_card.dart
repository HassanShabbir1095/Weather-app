import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const WeatherCard({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final double temperature = weatherData['temperature'] ?? 0.0;
    final String condition = (weatherData['condition'] ?? 'clear').toLowerCase();

    // Map weather conditions to image asset names
    String imageName;
    if (condition.contains('cloud')) {
      imageName = 'cloudy.jpg';
    } else if (condition.contains('rain')) {
      imageName = 'rain.jpg';
    } else if (condition.contains('snow')) {
      imageName = 'snow.jpg';
    } else if (condition.contains('fog') || condition.contains('mist')) {
      imageName = 'fog.jpg';
    } else if (condition.contains('clear')) {
      imageName = 'clear.jpg';
    } else {
      imageName = 'clear.jpg'; // default image
    }

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '${temperature.toStringAsFixed(1)} °C',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              'assets/images/$imageName',
              height: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            Text(
              condition[0].toUpperCase() + condition.substring(1), // Capitalize first letter
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}