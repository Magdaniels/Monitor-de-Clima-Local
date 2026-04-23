import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';

class WeatherScreen extends StatefulWidget {
  // Este constructor 'const' es la clave para que main.dart no marque error
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _isLoading = false;

  void _fetchWeather() async {
    setState(() => _isLoading = true);
    try {
      final weather = await _weatherService.fetchWeather();
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error al conectar con n8n")),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  IconData _getWeatherIcon(String description) {
    String desc = description.toLowerCase();
    if (desc.contains('nube') || desc.contains('nuboso')) return Icons.cloud;
    if (desc.contains('lluvia')) return Icons.beach_access;
    if (desc.contains('trueno')) return Icons.flash_on;
    return Icons.wb_sunny;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade300, Colors.blue.shade900],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "CARTAGENA",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 50),
              if (_isLoading)
                const CircularProgressIndicator(color: Colors.white)
              else if (_weather != null) ...[
                Icon(_getWeatherIcon(_weather!.description), size: 100, color: Colors.white),
                const SizedBox(height: 20),
                Text(
                  "${_weather!.temperature.toStringAsFixed(1)}°C",
                  style: const TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.w200),
                ),
                Text(
                  _weather!.description.toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 1.5),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.water_drop, color: Colors.white70),
                      const SizedBox(width: 10),
                      Text(
                        "Humedad: ${_weather!.humidity}%",
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: _fetchWeather,
                icon: const Icon(Icons.refresh),
                label: const Text("ACTUALIZAR"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue.shade900,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}