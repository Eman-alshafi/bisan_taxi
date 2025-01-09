import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class homeThirdScreen extends StatelessWidget {
  const homeThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildGoogleMap(), // خريطة Google Map
          buildLocationBox(), // صندوق الموقع
          buildHotelList(context), // تمرير context إلى دالة قائمة الفنادق
          buildLogo(), // الشعار في الأسفل
        ],
      ),
    );
  }

  Widget buildGoogleMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(31.9038, 35.2034), // موقع افتراضي (رام الله)
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
              buildInputField("رام الله، شارع الطيرة"),
              SizedBox(height: 10),
              buildLocationRow("إلى أين وجهتك", "assets/images/Group 3.jpg"),
              SizedBox(height: 10),
              buildInputField("فندق سيزر"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHotelList(BuildContext context) { // إضافة context هنا
    List<Map<String, String>> hotels = [
      {"name": "فندق الموفمبيك", "address": "رام الله، شارع يافا"},
      {"name": "فندق رويال كورت", "address": "رام الله، شارع يافا"},
      {"name": "فندق فلسطين بلازا", "address": "رام الله، شارع الإرسال"},
      {"name": "فندق سيزر", "address": "رام الله، شارع يافا"},
    ];

    return Positioned(
      top: 300,
      right: 20, // تغيير من اليسار إلى اليمين
      left: null, // تأكد من أنه ليس هناك فاصلة من الجهة اليسرى
      child: Directionality(
        textDirection: TextDirection.rtl, // لجعل النص يظهر من اليمين
        child: Container(
          height: 400,
          width: MediaQuery.of(context).size.width - 40, // استخدام context هنا بشكل صحيح
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
                  // يمكنك إضافة حدث هنا عند اختيار الفندق
                },
              );
            },
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

  Widget buildInputField(String hintText) {
    return TextField(
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
