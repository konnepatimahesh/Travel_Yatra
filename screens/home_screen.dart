import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final String logoUrl = 'https://res.cloudinary.com/dmw7m6nji/image/upload/e_background_removal/f_png/v1747993147/WhatsApp_Image_2025-05-23_at_15.07.50_22456ceb_cvlkf4.jpg'; // Replace with your logo URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                logoUrl,
                height: 300,
                errorBuilder: (_, __, ___) => Icon(Icons.error, size: 1),
              ),
              SizedBox(height: 40),
              Text(
                'Welcome to Travel Yatra',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}