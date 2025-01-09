import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Driverarrived extends StatelessWidget {
  const Driverarrived({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaxiScreen(),
    );
  }
}

class TaxiScreen extends StatefulWidget {
  const TaxiScreen({super.key});

  @override
  _TaxiScreenState createState() => _TaxiScreenState();
}

class _TaxiScreenState extends State<TaxiScreen> {
  late GoogleMapController _mapController;
  final LatLng _startPoint = LatLng(31.951569, 35.923962);
  final LatLng _driverLocation = LatLng(31.9474, 35.9284);

  Set<Marker> _createMarkers() {
    return {
      Marker(
        markerId: MarkerId('start'),
        position: _startPoint,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
      Marker(
        markerId: MarkerId('driver'),
        position: _driverLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          _buildGoogleMap(),
          _buildDriverDetails(),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: _buildBackButton(context),
      actions: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(
            'assets/images/im2.png',
            height: 250,
            width: 150,
          ),
        ),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  GoogleMap _buildGoogleMap() {
    return GoogleMap(
      onMapCreated: (controller) => _mapController = controller,
      initialCameraPosition: CameraPosition(
        target: LatLng(31.949722, 35.932778),
        zoom: 14.0,
      ),
      markers: _createMarkers(),
    );
  }

  Widget _buildDriverDetails() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5))],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDriverTextInfo1(),
            _buildDriverInfo(),
            SizedBox(height: 20),
            Divider(color: Colors.grey[300]),
            SizedBox(height: 2),
            _buildActionButtons(),
            SizedBox(height: 2),
            Divider(color: Colors.grey[300]),
            SizedBox(height: 20),
            _buildLocationDetails(),
            SizedBox(height: 10),
            _buildPriceDetails(),
            SizedBox(height: 30),
            _buildConfirmButton()

          ],
        ),
      ),
    );
  }

  Widget _buildDriverInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // _buildTimeTag(),
        Spacer(),
        _buildDriverTextInfo(),
        SizedBox(width: 10),
        _buildDriverImage(),
      ],
    );
  }

  Widget _buildTimeTag() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(color: Colors.yellow[700], borderRadius: BorderRadius.circular(30)),
      child: Text('دقائق 3', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
  Widget _buildDriverTextInfo1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            _buildTimeTag(),
            Spacer(),
            SizedBox(height: 5),
            Text('سائقك على وشك الوصول', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),



          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 20,bottom: 20),
              child: Image.asset("assets/images/Group 1171276041 (1).png"),
            )
          ],
        )



      ],
    );
  }
  Widget _buildDriverTextInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        //Text('السائق القريب منك', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text('أحمد علي', style: TextStyle(fontSize: 20)),
        SizedBox(height: 5),
        Row(
          children: [
            Text('42-86659', style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold)),
            Text(' | FORD Fusion', style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildDriverImage() {
    return Column(
      children: [
        Container(
          width: 70, // عرض الصورة
          height: 90, // ارتفاع الصورة
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // لتكون الزوايا مستديرة (يمكن ضبطها بـ 0 للزوايا الحادة)
            image: DecorationImage(
              image: AssetImage('assets/images/Rectangle 1732.png'),
              fit: BoxFit.cover, // لجعل الصورة تغطي المساحة بالكامل
            ),
          ),
        ),
        SizedBox(height: 0.5),
        Row(
          children: [
            Icon(Icons.star, color: Colors.yellow, size: 15),
            SizedBox(width: 4),
            Text('4.9', style: TextStyle(fontSize: 15)),
          ],
        ),
      ],
    );
  }



  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionButton('واتساب', 'assets/images/whatsapp (2) 1 (1).png'),
        _buildActionButton('رسالة', 'assets/images/Icon.png'),
        _buildActionButton('اتصال', 'assets/images/Phone.png'),
      ],
    );
  }

  Widget _buildActionButton(String label, String iconPath) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        splashFactory: NoSplash.splashFactory,
      ),
      child: Row(
        children: [
          Text(label, style: TextStyle(color: Colors.black)),
          SizedBox(width: 8),
          Image.asset(iconPath, width: 30, height: 30),
        ],
      ),
    );
  }

  Widget _buildLocationDetails() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('فندق سيزر شارع يافا', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Icon(Icons.location_on, color: Colors.yellow[700]),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('الوقت للوصول: 25 دقيقة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Icon(Icons.access_time, color: Colors.yellow[700]),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceDetails() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('₪ 20 ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('السعر', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildConfirmButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow[700],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
      ),
      child: Text('تتبع الرحلة', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }


}
