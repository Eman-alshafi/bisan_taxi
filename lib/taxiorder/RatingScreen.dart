import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Ratingscreen extends StatelessWidget {
  const Ratingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TripCompletionScreen(),
    );
  }
}

class TripCompletionScreen extends StatefulWidget {
  const TripCompletionScreen({super.key});

  @override
  _TripCompletionScreenState createState() => _TripCompletionScreenState();
}

class _TripCompletionScreenState extends State<TripCompletionScreen> {
  late GoogleMapController _mapController;

  final LatLng _center = LatLng(31.951569, 35.923962); // مركز الخريطة
  double _rating = 0; // لتقييم السائق

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // جعل الخلفية شفافة
        elevation: 0, // إزالة الظل
        actions: [
          // وضع اللوغو في الأعلى على اليمين
          Positioned(
            right: 10,
            top: 10,
            left: 10,
            child: Image.asset(
              'assets/images/im2.png', // ضع مسار الصورة المناسبة للوغو
              width: 170,
              height: 270,
            ),
          ),
        ],
        leading: Positioned(
          left: 10,
          top: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  // ضع الإجراء الذي تود أن يحدث عند الضغط على الأيقونة
                },
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // خريطة جوجل
          GoogleMap(
            onMapCreated: (controller) {
              _mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
          ),
          // الجزء السفلي الذي يحتوي على المحتوى
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2, // رفع المحتوى إلى المنتصف
            left: 40,
            right: 40,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // أيقونة النجاح
                  Image.asset("assets/images/check (7) 1.png"),
                  SizedBox(height: 10),
                  // نص إكمال الرحلة
                  Text(
                    'اكتملت رحلتك',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // السعر
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '₪ 20 السعر',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // نص تقييم السائق
                  Text(
                    'هل تريد تقييم السائق',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: "Cairo"),
                  ),
                  SizedBox(height: 10),
                  // نجوم التقييم
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          Icons.star,
                          size: 35,
                          color: index < _rating ? Colors.yellow[700] : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _rating = index + 1.0;
                          });
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  // زر التقييم
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('تم تقييم السائق بـ $_rating نجوم'),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.yellow[700]!, width: 1), // إضافة لون الحدود
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 110),
                    ),
                    child: Text('تقييم',style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Cairo",
                      fontSize: 16
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
