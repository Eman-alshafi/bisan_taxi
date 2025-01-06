import 'package:flutter/material.dart';
import 'package:taxiapp/signupscreens/fifthscreen.dart';

class fourthscreen extends StatelessWidget {
  const fourthscreen({super.key});

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
                  "assets/images/Car driving-bro (1).png",
                  height: 220,
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 250,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 80.0),
                        child: Image.asset(
                          "assets/images/m6.png",
                          height: 80,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50.0,
                        ),
                        child: Image.asset(
                          "assets/images/m7.png",
                          height: 85,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => fifthscreen()));
                          },
                          icon: Image.asset("assets/images/progress (3).png")),

                      // Image.asset("assets/images/progress (1).png")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Column(
                    children: [Image.asset("assets/images/Frame 2 (2).png")],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
