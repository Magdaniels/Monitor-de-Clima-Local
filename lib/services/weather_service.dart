import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart'; 

class WeatherService {
  
  static const String webhookUrl = 'https://danielmagdaniels.app.n8n.cloud/webhook/Clima';

  Future<Weather> fetchWeather() async {
    try {
      final response = await http.get(Uri.parse(webhookUrl));

      if (response.statusCode == 200) {
  
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        
        return Weather.fromJson(jsonResponse);
      } else {
    
        throw Exception('Error del servidor: Código ${response.statusCode}');
      }
    } catch (e) {
   
      throw Exception('Fallo al conectar con n8n. Verifica tu conexión o el Webhook.');
    }
  }
}