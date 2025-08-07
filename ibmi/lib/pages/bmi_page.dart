import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Container(
      color: Colors.greenAccent,
    ));
  }
}
