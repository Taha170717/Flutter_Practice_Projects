import 'package:flutter/material.dart';
import 'package:tasklytudo/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
await Hive.initFlutter("hive_boxes");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskly Tudo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: HomePage(),

    );

  }


}

