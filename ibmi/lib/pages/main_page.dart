import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bmi_page.dart';
import 'history_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> tabs = [BMIPage(), HistoryPage()];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.greenAccent,
        middle: Text(
          'IBMi',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      child: CupertinoTabScaffold(

        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'History',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return tabs[index];
            },
          );
        },
      ),
    );
  }
}
