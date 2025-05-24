import 'package:flutter/material.dart';
import 'city_details_screen.dart'; // ✅ Import your CityDetailsScreen

class TravelPlace {
  final String name;
  final String description;
  final String imageUrl;

  TravelPlace({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class PlaceCard extends StatelessWidget {
  final TravelPlace place;
  final VoidCallback onTap;

  const PlaceCard({required this.place, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  place.imageUrl,
                  width: 100,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(place.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(place.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TravelScreen extends StatelessWidget {
  TravelScreen({Key? key}) : super(key: key);

  final List<TravelPlace> places = [
    TravelPlace(
      name: "Delhi",
      description: "Iconic white marble mausoleum in Agra.",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/d/da/Taj-Mahal.jpg",
    ),
    TravelPlace(
      name: "Jaipur",
      description: "The Pink City known for its forts and palaces.",
      imageUrl:
          "https://res.cloudinary.com/dmw7m6nji/image/upload/v1748029633/images_nhx85h.jpg",
    ),
    TravelPlace(
      name: "Kerala Backwaters",
      description: "Serene water canals and houseboats.",
      imageUrl:
          "https://res.cloudinary.com/dmw7m6nji/image/upload/v1748029627/download_qaahti.jpg",
    ),
    TravelPlace(
      name: "Goa Beaches",
      description: "Famous beaches and nightlife.",
      imageUrl:
          "https://res.cloudinary.com/dmw7m6nji/image/upload/v1748029618/download_1_wubpuz.jpg",
    ),
    TravelPlace(
      name: "Varanasi",
      description: "Spiritual city on the banks of the Ganges.",
      imageUrl:
          "https://res.cloudinary.com/dmw7m6nji/image/upload/v1748029646/kasi_jol1dr.jpg",
    ),
    TravelPlace(
      name: "Leh Ladakh",
      description: "Breathtaking mountain landscapes.",
      imageUrl:
          "https://res.cloudinary.com/dmw7m6nji/image/upload/v1748029652/ladak_qh11dx.jpg",
    ),
    TravelPlace(
      name: "Mysore Palace",
      description: "Grand royal palace in Karnataka.",
      imageUrl:
          "https://res.cloudinary.com/dmw7m6nji/image/upload/v1748029659/mysore_uzia1g.jpg",
    ),
    TravelPlace(
      name: "Andaman Islands",
      description: "Tropical islands with pristine beaches.",
      imageUrl:
          "https://res.cloudinary.com/dmw7m6nji/image/upload/v1748029639/islands_z8dlvh.jpg",
    ),
  ];

  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Contact Info'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('7989704550'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mahesh'),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('vkonnepati36@jnn.edu.in'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Nellore'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          )
        ],
      ),
    );
  }

  void _onSettingsSelected(BuildContext context, String choice) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$choice selected')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.blue,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(6),
              child: Image.network(
                'https://res.cloudinary.com/dmw7m6nji/image/upload/e_background_removal/f_png/v1747993147/WhatsApp_Image_2025-05-23_at_15.07.50_22456ceb_cvlkf4.jpg',
                width: 64,
                height: 64,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: const Text(
            'Travel Yatra',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.contact_phone),
              tooltip: 'Contact',
              onPressed: () => _showContactDialog(context),
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.settings),
              onSelected: (value) => _onSettingsSelected(context, value),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'Profile',
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 8),
                      Text('Profile'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'Favourite Places',
                  child: Row(
                    children: [
                      Icon(Icons.place),
                      SizedBox(width: 8),
                      Text('Favourite Places'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'Favourite Food Stalls',
                  child: Row(
                    children: [
                      Icon(Icons.restaurant),
                      SizedBox(width: 8),
                      Text('Favourite Food Stalls'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'Logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => PlaceCard(
          place: places[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CityDetailsScreen(
                  cityName: places[index].name,
                  imageUrl: places[index].imageUrl,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}