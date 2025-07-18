import 'package:flutter/material.dart';
import 'package:gomoon/pages/home_pages.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoMoon',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(31, 31, 31, 1.0)
      ),
        debugShowCheckedModeBanner: false,
        home: HomePage()

    );
  }
  
}
