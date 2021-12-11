import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:prayer_time_application/screens/qibla_compass/widgets/qibla_compass.dart';

class QiblahCompassScreen extends StatefulWidget {
  const QiblahCompassScreen({Key? key}) : super(key: key);
  static String routeName = "/qiblah";

  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompassScreen> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _deviceSupport,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );

          if (snapshot.hasError)
            return Center(
              child: Text('Error: ${snapshot.error.toString()}'),
            );
          if (snapshot.hasData)
            return QiblaCompass();
          else
            return Container(
              child: Text('Error'),
            );
        },
      ),
    );
  }
}
