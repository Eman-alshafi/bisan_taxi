import 'package:flutter/material.dart';

import 'package:taxiapp/signupscreens/fifthscreen.dart';
import 'package:taxiapp/signupscreens/signupscreen.dart';
import 'package:taxiapp/signupscreens/signuptwo.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1C1C),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // السهم للرجوع
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      fifthscreen()), // استبدل YourNextScreen بشاشة الوجهة
            ); // العودة إلى الشاشة السابقة
          },
        ),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 15),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, right: 50),
              child: Text(
                'تسجيل دخول',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cairo"),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFF191919),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "رقم الهاتف",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Cairo"),
                ),
              ),
              TextField(
                textAlign: TextAlign.right, // محاذاة النص إلى الجهة اليمنى
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF191919),
                  labelText: '000 000 0000 ',
                  labelStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.only(right: 0.0, left: 150.0),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VerticalDivider(color: Colors.grey, thickness: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          '+970',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "Cairo"),
                        ),
                      ),
                    ],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(double.infinity, 60),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            signupotwo()), // استبدل YourNextScreen بشاشة الوجهة
                  );
                },
                child: Text(
                  'استمرار',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Cairo"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(65.0),
                child: Image.asset(
                  'assets/images/im2.png', // استبدل هذا بالمسار الصحيح للشعار
                  height: 80,
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  // هنا يمكن إضافة منطق الانتقال إلى شاشة تسجيل الدخول
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 240.0, left: 70),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          // انتقل إلى الشاشة المطلوبة
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    signupOne()), // استبدل YourNextScreen بشاشة الوجهة
                          );
                        },
                        child: Text(
                          'انشاء حساب ؟',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Cairo"),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Text(
                        'لا تمتلك حساب',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Cairo"),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
