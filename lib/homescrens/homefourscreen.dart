import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxiapp/homescrens/hometwoscreen.dart';

class homefourScreen extends StatelessWidget {
  const homefourScreen({super.key});

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
          buildLogo(), // الشعار في الأعلى
          buildCarSelection(), // الصندوقين لصور السيارات
          buildSearchButton(context), // زر البحث في الأسفل
          buildBackButton(context), // زر الرجوع في الأعلى
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
      top: 100,
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
              buildLocationTextBox("أدخل موقعك هنا..."),
              SizedBox(height: 10),
              buildLocationRow("أين وجهتك", "assets/images/Group 3.jpg"),
              SizedBox(height: 10),
              buildLocationTextBox("حدد وجهتك هنا..."),
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

  Widget buildLocationTextBox(String hintText) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        hintText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: "Cairo",
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  // رفع الشعار للأعلى
  Widget buildLogo() {
    return Positioned(
      top: 10,  // رفع الشعار إلى الأعلى
      left: 270,
      right: 0,
      child: Column(
        children: [
          Image.asset(
            'assets/images/im2.png',
            width: 100,
            height: 90,
          ),
        ],
      ),
    );
  }

  // إضافة صندوقين جنب بعض
  Widget buildCarSelection() {
    return Positioned(
      bottom: 450, // وضع الصندوقين فوق الشعار
      left: 10,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildCarBox("assets/images/image 35.png", "هونداي 2022", 20), // صندوق السيارة الأولى
          buildCarBox("assets/images/image 36.png", "هونداي 2022", 25), // صندوق السيارة الثانية
        ],
      ),
    );
  }

  // تصميم صندوق السيارة مع النص ونوع السيارة
  Widget buildCarBox(String imagePath, String carName, double price) {
    return Container(
      width: 190,
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
        children: [
          // الصورة والنص بجانبها
          Row(
            children: [
              Image.asset(imagePath, width: 50, height: 50),  // صورة السيارة
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  carName,  // اسم السيارة
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cairo",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // سعر التوصيل مع رمز الشيكل
          Text(
            " ₪${price.toString()}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo",
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // زر البحث في الأسفل
  Widget buildSearchButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: ElevatedButton(
        onPressed: () {
          // من هنا يمكنك إضافة وظيفة البحث عند الضغط على الزر
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow[700], // اللون الأصفر
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          "بحث",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  // زر الرجوع في الأعلى على اليسار
  Widget buildBackButton(BuildContext context) {
    return Positioned(
      top: 20,
      left: 10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black, // خلفية سوداء للزر
          borderRadius: BorderRadius.circular(50), // إذا أردت جعل الزر دائريًا
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // أيقونة الرجوع بيضاء
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      homeTwoScreen()), // استبدل YourNextScreen بشاشة الوجهة
            );  // الرجوع إلى الشاشة السابقة
          },
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints(),
          iconSize: 30,
          color: Colors.black, // تعطيل اللون الداخلي
        ),
      ),
    );
  }
}
