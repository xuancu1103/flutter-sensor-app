import 'package:flutter/material.dart';
import 'bai1_motion.dart';
import 'bai2_explorer.dart';
import 'bai3_light.dart';

void main() =>
    runApp(MaterialApp(home: MainMenu(), debugShowCheckedModeBanner: false));

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chương 20: Thực hành Cảm biến")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _menuItem(
            context,
            "Bài 1: Máy đo chuyển động",
            Colors.blue,
            Bai1Motion(),
          ),
          _menuItem(
            context,
            "Bài 2: Nhà thám hiểm (GPS)",
            Colors.green,
            Bai2Explorer(),
          ),
          _menuItem(
            context,
            "Bài 3: Cảm biến ánh sáng",
            Colors.orange,
            Bai3Light(),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
    BuildContext context,
    String title,
    Color color,
    Widget page,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.sensors, color: color),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        // LỖI Ở ĐÂY: ListTile dùng 'onTap', không phải 'onPressed'
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
