class Weather {
  final double temperature;
  final String description;
  final int humidity;

  Weather({
    required this.temperature,
    required this.description,
    required this.humidity,
  });

  
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
   
      temperature: (json['main']['temp'] as num).toDouble(),
     
      description: json['weather'][0]['description'].toString(),
      
      humidity: json['main']['humidity'] as int,
    );
  }
}