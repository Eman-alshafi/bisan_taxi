import 'package:flutter/material.dart';
import 'package:taxiapp/homescrens/locationscreen.dart';
import 'package:taxiapp/homescrens/mapscreen.dart';
import 'package:taxiapp/signupscreens/signupscreen.dart';

class signupotwo extends StatelessWidget {
  const signupotwo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerificationScreen(),
    );
  }
}

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1C1C), // نفس اللون الخلفية
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // السهم للرجوع
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      signupOne()), // استبدل YourNextScreen بشاشة الوجهة
            ); // العودة إلى الشاشة السابقة
          },
        ),
        title: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text(
            "التحقق من الرمز",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Cairo"),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8),
            Text(
              "يرجى التحقق عن طريق إدخال \nالرمز الذي تم إرساله إلى رقم هاتفك",
              style: TextStyle(
                  color: Colors.grey[400], fontSize: 20, fontFamily: "Cairo"),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return Container(
                    height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFF1C1C1C),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Colors.grey, width: 2.0), // تحديد اللون السكني
                    ),
                    child: TextField(
                      textAlign: TextAlign.center, // محاذاة النص في المركز
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number, // فقط أرقام
                      maxLength: 1, // حقل واحد فقط لكل مربع
                      decoration: InputDecoration(
                        counterText: '', // لإخفاء عداد الأحرف
                        border: InputBorder.none, // إزالة الحد
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 190),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      // وظيفة إعادة الإرسال
                    },
                    child: Text(
                      "إعادة الإرسال",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 16,
                          fontFamily: "Cairo"),
                    ),
                  ),
                  Text(
                    "لم تتلق الرمز؟",
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, fontFamily: "Cairo"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mapscreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "تفعيل",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Cairo"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Image.asset("assets/images/im2.png", height: 80),
            ),
          ],
        ),
      ),
    );
  }
}
