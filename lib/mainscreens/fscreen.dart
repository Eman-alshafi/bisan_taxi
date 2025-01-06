import 'package:flutter/material.dart';
import 'package:taxiapp/mainscreens/secscreen.dart';

class fscreen extends StatelessWidget {
  const fscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration (seconds: 10) , (){
    //   Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => secscreen()),
    // );
    //
    // });
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => secscreen()),
      );
    });

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 300.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset("assets/images/im1.png"),
          ),
          Image.asset("assets/images/im2.png"),
        ]),
      )),
    );
  }
}
