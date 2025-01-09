import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:geocoding/geocoding.dart';
import 'package:taxiapp/homescrens/homefourscreen.dart';

class homeTwoScreen extends StatelessWidget {
  const homeTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String currentLocation = "جارٍ تحديد الموقع...";
  late loc.Location location;
  TextEditingController destinationController = TextEditingController();
  List<Map<String, String>> hotels = [
    {"name": "فندق الموفمبيك", "address": "رام الله، شارع يافا"},
    {"name": "فندق رويال كورت", "address": "رام الله، شارع يافا"},
    {"name": "فندق فلسطين بلازا", "address": "رام الله، شارع الإرسال"},
    {"name": "فندق سيزر", "address": "رام الله، شارع يافا"},
  ];
  List<Map<String, String>> filteredHotels = [];

  @override
  void initState() {
    super.initState();
    location = loc.Location();
    _getCurrentLocation();
    filteredHotels = []; // Initialize with an empty list
    destinationController.addListener(_filterHotels);
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          setState(() {
            currentLocation = "خدمة الموقع غير مفعلة.";
          });
          return;
        }
      }

      loc.PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == loc.PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != loc.PermissionStatus.granted) {
          setState(() {
            currentLocation = "إذن الوصول للموقع مرفوض.";
          });
          return;
        }
      }

      loc.LocationData locationData = await location.getLocation();
      List<Placemark> placemarks = await placemarkFromCoordinates(
        locationData.latitude!,
        locationData.longitude!,
      );

      if (placemarks.isNotEmpty) {
        setState(() {
          currentLocation = placemarks[0].locality ?? "لم يتم العثور على الموقع";
        });
      }
    } catch (e) {
      setState(() {
        currentLocation = "خطأ في تحديد الموقع.";
      });
    }
  }

  void _filterHotels() {
    setState(() {
      // Filter the hotels based on the entered text, checking both name and address
      filteredHotels = hotels
          .where((hotel) =>
      hotel["name"]!.contains(destinationController.text) ||
          hotel["address"]!.contains(destinationController.text))
          .toList();
    });
  }

  @override
  void dispose() {
    destinationController.removeListener(_filterHotels);
    destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildGoogleMap(),
          buildLocationBox(),
         // buildHotelList(context),
          buildLogo(),
        ],
      ),
    );
  }

  Widget buildGoogleMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(31.9038, 35.2034), // Default location (Ramallah)
        zoom: 15,
      ),
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
    );
  }

  Widget buildLocationBox() {
    return Positioned(
      top: 50,
      left: 20,
      right: 20,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildLocationRow("موقعك الحالي", "assets/images/loction 1.png"),
              SizedBox(height: 10),
              buildLocationTextBox(currentLocation),
              SizedBox(height: 10),
              buildLocationRow("إلى أين وجهتك", "assets/images/Group 3.jpg"),
              SizedBox(height: 10),
              buildInputField("حدد وجهتك"),
              if (filteredHotels.isNotEmpty) buildSuggestionsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLocationRow(String text, String imagePath) {
    return Row(
      children: [
        Image.asset(imagePath, width: 30, height: 30),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo",
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Widget buildLocationTextBox(String location) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        location,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: "Cairo",
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget buildInputField(String hintText) {
    return TextField(
      controller: destinationController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontFamily: "Cairo",
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      textAlign: TextAlign.right,
    );
  }

  Widget buildSuggestionsList() {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: filteredHotels.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.location_pin, color: Colors.orange),
            title: Text(
              filteredHotels[index]["name"]!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              filteredHotels[index]["address"]!,
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        homefourScreen()), // استبدل YourNextScreen بشاشة الوجهة
              );


              // Leave this empty to prevent navigation to the HotelDetailsScreen
            },
          );
        },
      ),
    );
  }

  Widget buildHotelList(BuildContext context) {
    return Positioned(
      top: 300,
      right: 20,
      left: null,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: 400,
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
              ),
            ],
          ),
          child: ListView.builder(
            itemCount: hotels.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.location_pin, color: Colors.orange),
                title: Text(
                  hotels[index]["name"]!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  hotels[index]["address"]!,
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  // Leave this empty to prevent navigation
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildLogo() {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Image.asset(
            'assets/images/im2.png',
            width: 150,
            height: 90,
          ),
        ],
      ),
    );
  }
}
