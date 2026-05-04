import 'dart:async';

import 'package:ecommerceapp/core/functions/internetcheck.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:geolocator/geolocator.dart';
/*
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var resp;
  GoogleMapController? mapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.2733, 34.2606),
    //target: LatLng(37.956044, -122.542027),
    zoom: 14.4746,
  );

  List<Marker> markers = [
    /* Marker(
      markerId: const MarkerId('marker_1'),
      position: const LatLng(31.312529238658506, 34.24132503569126),
      infoWindow: const InfoWindow(title: 'بيتنا'),
    ),

    Marker(
      markerId: MarkerId("m2"),
      position: LatLng(31.312764406878056, 34.24112085253),
      infoWindow: InfoWindow(title: "عقل"),
    ),*/
  ];

  StreamSubscription<Position>? positionStream;
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("الرجاء تشغيل خدمة تحديد الموقع على جهازك");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("الرجاء منح صلاحيات الموقع");
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    if (permission == LocationPermission.whileInUse) {
      //1- الموقع الحالي للمستخدم
      /*Position position = await Geolocator.getCurrentPosition();
      print("=============================");
      print(position.latitude);
      print(position.longitude);
      print("=============================");
      */
      //2- تحديث الموقع بشكل مستمر===ف ي حال الشخص بتحرك
      /*
      positionStream = Geolocator.getPositionStream().listen((
        Position? position,
      ) {
        print("===============================");
        print(position!.latitude);
        print(position.longitude);
        print("===============================");
      });
      */

      //3- حساب المسافة بين موقعين
      /*  double distanceInMeters = Geolocator.distanceBetween(
        31.312514916579886,
        34.2414990440011,
        31.311657020098178,
        34.23567999154329,
      );
      print("المسافة بين الموقعين: $distanceInMeters متر");
    */

      //Traking === Marker & Update Marker (stream)
      positionStream = Geolocator.getPositionStream().listen((
        Position? position,
      ) async {
        // markers.clear();
        markers.add(
          Marker(
            markerId: const MarkerId('current_location'),
            position: LatLng(position!.latitude, position.longitude),
            infoWindow: const InfoWindow(title: 'الموقع الحالي للطلب'),
          ),
        );
        /* await mapController!.animateCamera(
          CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
        );*/
        setState(() {});
      });
    }
  }

  @override
  dispose() {
    super.dispose();
    if (positionStream != null) {
      positionStream!.cancel();
    }
  }

  initialData() async {
    resp = await internetCheck();
    print(resp);
  }

  @override
  void initState() {
    super.initState();
    initialData();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Test'), centerTitle: true),
      // LatLng(31.312510047072657, 34.24153860658407) == بيتنا
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        onTap: (LatLng latLng) async {
          List<Placemark> placemarks = await placemarkFromCoordinates(
            52.2165157,
            6.9437819,
          );
          print("==================================");
          print(placemarks[0].name);
          print(placemarks[0].street);
          print(placemarks[0].subLocality);
          print(placemarks[0].locality);
          print(placemarks[0].postalCode);
          print(placemarks[0].country);
          print("==================================");
          print("$latLng.latitude");
          print("$latLng.longitude");
        },
        onLongPress: (LatLng latLng) {
          markers.removeWhere((marker) => marker.position == latLng);
          setState(() {});
          // You can add functionality here to remove a marker or show options
        },
        markers: markers.toSet(),
      ),

      /* OtpTextField(
        borderRadius: BorderRadius.circular(15),
        borderWidth: 4,
        numberOfFields: 5,
        borderColor: Color(0xFF512DA8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true,
        //runs when a code is typed in
        onCodeChanged: (String code) {
          //handle validation or checks here
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Verification Code"),
                content: Text('Code entered is $verificationCode'),
              );
            },
          );
        }, // end onSubmit
      ),
      */
    );
  }
}
*/