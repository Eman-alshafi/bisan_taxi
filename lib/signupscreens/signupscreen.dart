import 'package:flutter/material.dart';
import 'package:taxiapp/signupscreens/fifthscreen.dart';
import 'package:taxiapp/signupscreens/loginscreen.dart';
import 'package:taxiapp/signupscreens/signuptwo.dart';

class signupOne extends StatelessWidget {
  const signupOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1C1C),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 9.0), // ضبط المسافة على اليسار
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back, // أيقونة السهم
                  color: Colors.white, // تغيير اللون إلى الأبيض
                ),
                onPressed: () {
                  // الكود الذي ينفذ عند الضغط على السهم (الرجوع إلى الشاشة السابقة)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            fifthscreen()), // استبدل YourNextScreen بشاشة الوجهة
                  );
                },
              ),
            ),
            Expanded(
              // هذا يسمح للنص بأن يكون في الوسط
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 60),
                child: Text(
                  'إنشاء حساب',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cairo",
                  ),
                  textAlign: TextAlign.center, // محاذاة النص في الوسط
                ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "اسم المستخدم",
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

                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF191919),
                  labelText: 'اسم المستخدم',
                  labelStyle:
                      TextStyle(color: Colors.grey, fontFamily: "Cairo"),
                  suffixIcon: Icon(Icons.person,
                      color: Colors.grey), // الأيقونة على الجهة اليمنى
                  contentPadding:
                      EdgeInsets.only(right: 20.0, left: 190.0), // تعديل الحشو
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
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
                  labelText: '000 0000 0000 ',
                  labelStyle:
                      TextStyle(color: Colors.grey, fontFamily: "Cairo"),
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
                padding: const EdgeInsets.only(top: 50.0),
                child: Image.asset(
                  'assets/images/im2.png', // استبدل هذا بالمسار الصحيح للشعار
                  height: 80,
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // هنا يمكن إضافة منطق الانتقال إلى شاشة تسجيل الدخول
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 230.0, left: 70),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          // انتقل إلى الشاشة المطلوبة
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    loginscreen()), // استبدل YourNextScreen بشاشة الوجهة
                          );
                        },
                        child: Text(
                          'تسجيل دخول؟',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Text(
                        'تملك حساب ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
