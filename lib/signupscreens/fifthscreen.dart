import 'package:flutter/material.dart';
import 'package:taxiapp/signupscreens/loginscreen.dart';
import 'package:taxiapp/signupscreens/signupscreen.dart';

class fifthscreen extends StatelessWidget {
  const fifthscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191919),
      // appBar: AppBar(
      //  // titleSpacing: 10,
      //
      //
      //
      // ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 45.0, left: 1.0, right: 80),
                  child: Column(
                    children: [
                      //   Image.asset("assets/images/m3.png")
                      //
                      //   //Text("تخطي" ,style:  TextStyle(fontSize: 30 , color: Color(0xFFF3B603),  ), ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 63.0, left: 23.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/im2.png",
                        height: 83,
                        width: 155.03,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 400,
                width: 400,
                child: Image.asset(
                  "assets/images/Car d.png",
                  height: 220,
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 150,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Image.asset(
                          "assets/images/m9.png",
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, bottom: 20, top: 1),
                    child: SizedBox(
                      width: 350,
                      child: MaterialButton(
                        height: 50,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signupOne()));
                        },
                        child: Image.asset("assets/images/m10.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, bottom: 20, top: 1),
                    child: SizedBox(
                      width: 350,
                      child: MaterialButton(
                        height: 50,
                        color: Color(0xFF191919),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loginscreen()));
                        },
                        child: Image.asset("assets/images/b2.png"),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
