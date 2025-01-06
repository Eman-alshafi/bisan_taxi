import 'package:flutter/material.dart';
import 'package:taxiapp/mainscreens/thirdscreen.dart';

class secscreen extends StatelessWidget {
  const secscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191919),
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
                      Image.asset("assets/images/m3.png")

//Text("تخطي" ,style: TextStyle(fontSize: 30 , color: Color(0xFFF3B603), ), ),
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
                  "assets/images/City driver-pana.png",
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
                        padding: const EdgeInsets.only(left: 245.0),
                        child: Image.asset(
                          "assets/images/m.png",
                          height: 80,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, top: 1.0),
                        child: Image.asset(
                          "assets/images/m2.png",
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
                                    builder: (context) => thirdscreen()));
                          },
                          icon: Image.asset("assets/images/progress.png")),

//Image.asset("assets/images/progress.png")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Column(
                    children: [Image.asset("assets/images/Frame 2.png")],
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
