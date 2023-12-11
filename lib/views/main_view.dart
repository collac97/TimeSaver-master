import 'package:flutter/material.dart';
import 'package:timesaver/views/test_view.dart';

import 'package:timesaver/views/day_view/day_view.dart';

class TimeSaverHomePage extends StatefulWidget {
  const TimeSaverHomePage({super.key, required this.title});

  final String title;

  @override
  State<TimeSaverHomePage> createState() => _TimeSaverHomePageState();
}

class _TimeSaverHomePageState extends State<TimeSaverHomePage> {
  int currentHomePageState = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // IOS use CupertinoTabBar
        bottomNavigationBar: NavigationBar(
          //When bottom navigation bar button is pressed save actual selected page and set status
          onDestinationSelected: (int index) {
            setState(() {
              currentHomePageState = index;
            });
          },
          selectedIndex: currentHomePageState,
          //Declaire the bottomNAvigationBar icons
          destinations: const <Widget>[
            NavigationDestination(
                icon: Icon(Icons.calendar_view_day), label: 'Actual Day'),
            NavigationDestination(
                icon: Icon(Icons.calendar_month), label: 'Month'),
            NavigationDestination(icon: Icon(Icons.build), label: 'Functions'),
            NavigationDestination(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
        //Body of each page
        body: <Widget>[
          //Day View
          //testDayView,
          mainDayView,

          //Month View
          testMonthView,

          //Function view
          testFunctionView,

          //Setting view
          testSettingView
        ][currentHomePageState]);
  }
}
