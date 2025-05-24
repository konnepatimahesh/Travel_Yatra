class CityInfo {
  final String name;
  final String description;
  final String weather;
  final List<String> attractions;

  CityInfo({
    required this.name,
    required this.description,
    required this.weather,
    required this.attractions,
  });
}

final List<CityInfo> cities = [
  CityInfo(
    name: 'Delhi',
    description: 'Capital of India with historical monuments.',
    weather: 'Hot summers, cold winters. Avg temp: 25°C.',
    attractions: ['India Gate', 'Qutub Minar', 'Red Fort'],
  ),
  CityInfo(
    name: 'Mumbai',
    description: 'City of dreams, Bollywood and beaches.',
    weather: 'Humid coastal climate. Avg temp: 27°C.',
    attractions: ['Gateway of India', 'Marine Drive', 'Juhu Beach'],
  ),
  // Add more cities as needed
];