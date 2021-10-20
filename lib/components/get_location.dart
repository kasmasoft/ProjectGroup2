// //@dart=2.9

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoder/geocoder.dart';

// class GetLocation extends StatefulWidget {
//   static String routeName = "/locattion";

//   @override
//   State<GetLocation> createState() => _GetLocationState();
// }

// class _GetLocationState extends State<GetLocation> {
//   String location;

//   getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);

//     print(position.latitude);
//     print(position.longitude);
//     getAddressFromCordinates(
//         Coordinates(position.latitude, position.longitude));
//   }

//   getAddressFromCordinates(Coordinates cords) async {
//     var addresses = await Geocoder.local.findAddressesFromCoordinates(cords);
//     var first = addresses.first;
//     print("${first.addressLine}");
//     setState(() {
//       location = first.addressLine;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   getCurrentLocation();
//                 },
//                 child: Text('My Current Location'),
//               ),
//               (location != null) ? Text(location.toString()) : Text(''),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
