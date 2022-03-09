import 'package:crm_smart/ui/widgets/group_button.dart';
import 'package:flutter/material.dart';

class MainPage_test extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage_test> {
  int current = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ButtonGroup(
          titles: ["أجهزة", "برامج"],//[0,1]
          current: current,
          onTab: (selected) {
            print(selected);
            setState(() {
              current = selected;
            });
          },
        ),
      ),
    );
  }
}