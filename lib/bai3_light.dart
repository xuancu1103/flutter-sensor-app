import 'package:flutter/material.dart';
import 'package:light_sensor/light_sensor.dart';

class Bai3Light extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: LightSensor.luxStream(), //
      builder: (context, snapshot) {
        int lux = snapshot.data ?? 0;
        bool isDark = lux < 20; //
        return Scaffold(
          backgroundColor: isDark ? Colors.black : Colors.white,
          appBar: AppBar(title: const Text("Bài 3: Đo ánh sáng")),
          body: Center(
            child: Text(
              "$lux LUX",
              style: TextStyle(
                fontSize: 50,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
