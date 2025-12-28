import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Bai1Motion extends StatefulWidget {
  @override
  State<Bai1Motion> createState() => _Bai1MotionState();
}

class _Bai1MotionState extends State<Bai1Motion> {
  int count = 0;
  DateTime _lastShake = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bài 1: Lắc máy")),
      body: StreamBuilder<UserAccelerometerEvent>(
        stream: userAccelerometerEventStream(), //
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            double accel = sqrt(
              pow(snapshot.data!.x, 2) +
                  pow(snapshot.data!.y, 2) +
                  pow(snapshot.data!.z, 2),
            ); //
            if (accel > 15 &&
                DateTime.now().difference(_lastShake).inMilliseconds > 500) {
              //
              count++;
              _lastShake = DateTime.now();
            }
          }
          return Center(
            child: Text(
              "Số lần lắc: $count",
              style: const TextStyle(fontSize: 40),
            ),
          );
        },
      ),
    );
  }
}
