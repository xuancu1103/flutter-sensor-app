import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Bai2Explorer extends StatefulWidget {
  @override
  State<Bai2Explorer> createState() => _Bai2ExplorerState();
}

class _Bai2ExplorerState extends State<Bai2Explorer> {
  String _pos = "Đang lấy vị trí...";
  @override
  void initState() {
    super.initState();
    _initGPS();
  }

  void _initGPS() async {
    LocationPermission permission = await Geolocator.requestPermission(); //
    if (permission != LocationPermission.denied) {
      Position p = await Geolocator.getCurrentPosition(); //
      setState(
        () => _pos =
            "Lat: ${p.latitude.toStringAsFixed(4)}\nLong: ${p.longitude.toStringAsFixed(4)}",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bài 2: GPS & La bàn")),
      body: Column(
        children: [
          Text(_pos),
          Expanded(
            child: StreamBuilder<MagnetometerEvent>(
              stream: magnetometerEventStream(),
              builder: (context, snapshot) {
                double angle = 0;
                if (snapshot.hasData)
                  angle = atan2(snapshot.data!.y, snapshot.data!.x); //
                return Center(
                  child: Transform.rotate(
                    angle: -angle,
                    child: const Icon(
                      Icons.navigation,
                      size: 100,
                      color: Colors.red,
                    ),
                  ),
                ); //
              },
            ),
          ),
        ],
      ),
    );
  }
}
