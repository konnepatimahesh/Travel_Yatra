import 'package:flutter/material.dart';

class CityDetailsScreen extends StatelessWidget {
  final String cityName;
  final String imageUrl;

  const CityDetailsScreen({
    required this.cityName,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final attractions = [
      "Taj Mahal",
      "Red Fort",
      "India Gate"
    ];
    final foodStalls = ["Chalo Dhaba", "Street Tandoor", "Masala Cafe"];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cityName, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text("Popular Places:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ...attractions.map((place) => ListTile(
                    leading: Icon(Icons.place),
                    title: Text(place),
                  )),
                  const SizedBox(height: 12),
                  Text("Popular Food Stalls:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ...foodStalls.map((stall) => ListTile(
                    leading: Icon(Icons.restaurant),
                    title: Text(stall),
                  )),
                  const SizedBox(height: 12),
                  Text("Tourist Guide Info:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ListTile(leading: Icon(Icons.person), title: Text("Mahesh")),
                  ListTile(leading: Icon(Icons.phone), title: Text("7989704550")),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Booking Confirmed!")),
                      );
                    },
                    icon: Icon(Icons.hotel),
                    label: Text("Book Hotel"),
                    style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}