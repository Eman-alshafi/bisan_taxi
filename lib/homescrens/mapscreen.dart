import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapscreen extends StatelessWidget {
  const mapscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;

  final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(31.8996, 35.2042), // الموقع: رام الله
    zoom: 14, // يمكنك ضبط التكبير حسب رغبتك
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialPosition,
            onMapCreated: (controller) {
              _controller = controller;
            },
          ),
          // زر الرجوع في أعلى اليسار
          Positioned(
            top: 40,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black, // خلفية الزر سوداء
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white), // أيقونة الرجوع بيضاء
                onPressed: () {
                  Navigator.pop(context); // الرجوع إلى الشاشة السابقة
                },
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(),
                iconSize: 30,
              ),
            ),
          ),
          // الشعار في أسفل الجهة اليسرى
          Positioned(
            bottom: 20, // يحدد المسافة من الأسفل
            left: 10, // يحدد المسافة من الجهة اليسرى
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                //color: Colors.white, // خلفية الشعار
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                'assets/images/im2.png', // استبدلها بمسار الشعار الخاص بك
                width: 150, // عرض الشعار
                height: 150, // ارتفاع الشعار
              ),
            ),
          ),
        ],
      ),
    );
  }
}
