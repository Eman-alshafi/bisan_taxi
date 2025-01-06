import 'package:flutter/material.dart';
import 'package:taxiapp/homescrens/homescreen.dart';

import 'package:taxiapp/signupscreens/signuptwo.dart';

class locationscreen extends StatelessWidget {
  const locationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationPermissionScreen(),
    );
  }
}

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(70),
              padding: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Allow "App" to use your location?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your precise location is used to show your position on the map, get directions, estimate travel times, and improve search results.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/map view.png'), // Add your map image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Precise location button
                  ElevatedButton(
                    onPressed: () {
                      // Handle precise location toggle
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          'Precise: On',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  // Allow Once button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => homescreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      side: BorderSide(color: Colors.grey),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1, vertical: 3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 8),
                        Text(
                          'Allow Once',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  // Allow While Using the App button
                  ElevatedButton(
                    onPressed: () {
                      // Handle precise location toggle
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      side: BorderSide(color: Colors.grey),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 16),
                        Text(
                          'Allow While Using the App',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  // Don't Allow button
                  ElevatedButton(
                    onPressed: () {
                      // Handle precise location toggle
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      side: BorderSide(color: Colors.grey),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 8),
                        Text(
                          'Don\'t Allow',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Add the logo at the bottom left
          Positioned(
            bottom: 10,
            left: 50,
            child: Image.asset(
              'assets/images/im2.png', // Path to your logo image
              width: 160, // You can adjust the size as needed
              height: 160,
            ),
          ),
        ],
      ),
    );
  }
}
