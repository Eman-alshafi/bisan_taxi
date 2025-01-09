import 'package:flutter/material.dart';
import 'package:taxiapp/homescrens/hometwoscreen.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // يجعل محتوى الشاشة خلف الـ AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // يجعل الـ AppBar شفافًا
        elevation: 0, // يزيل الظل
        title: Text(
          'مرحباً محمد',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false, // يجعل النص إلى اليمين
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200], // لون الخلفية بدلاً من الخريطة
              child: Center(
                child: Icon(
                  Icons.location_on,
                  color: Colors.yellow,
                  size: 40,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                hintText: 'حدد وجهتك...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search),
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'حسابك',
        ),
          BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'نشاطاتك',
        ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'محفظتك',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),



        ],
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {

    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    homeTwoScreen()), // استبدل YourNextScreen بشاشة الوجهة
    ); // العودة إلى الشاشة السابقة
    },



        child: Icon(Icons.navigation),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// import 'package:flutter/material.dart';

// class homescreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true, // يجعل محتوى الشاشة خلف الـ AppBar
//       appBar: AppBar(
//         backgroundColor: Colors.transparent, // يجعل الـ AppBar شفافًا
//         elevation: 0, // يزيل الظل
//         title: Text(
//           'مرحباً محمد',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: false, // يجعل النص إلى اليمين
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.menu,
//               color: Colors.black,
//             ),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               color: Colors.grey[200], // لون الخلفية بدلاً من الخريطة
//               child: Center(
//                 child: Icon(
//                   Icons.location_on,
//                   color: Colors.yellow,
//                   size: 40,
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(16),
//             color: Colors.white,
//             child: TextField(
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.grey[100],
//                 hintText: 'حدد وجهتك...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//                 prefixIcon: Icon(Icons.search),
//               ),
//               textAlign: TextAlign.right,
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'الرئيسية',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.wallet),
//             label: 'محفظتك',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'نشاطاتك',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'حسابك',
//           ),
//         ],
//         selectedItemColor: Colors.yellow,
//         unselectedItemColor: Colors.grey,
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.yellow,
//         onPressed: () {},
//         child: Icon(Icons.navigation),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }
