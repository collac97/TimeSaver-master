import 'package:flutter/material.dart';

Container testDayView = Container(
  color: Colors.red.shade300,
  child: const Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'Day page',
        style: TextStyle(fontSize: 50.0),
      ),
      Text('Empty for now'),
    ]),
  ),
);

Container testMonthView = Container(
  color: Colors.green.shade300,
  child: const Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'Month page',
        style: TextStyle(fontSize: 50.0),
      ),
      Text('Empty for now'),
    ]),
  ),
);

Container testFunctionView = Container(
  color: Colors.amber.shade300,
  child: const Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'Functions page',
        style: TextStyle(fontSize: 50.0),
      ),
      Text('Empty for now'),
    ]),
  ),
);

Container testSettingView = Container(
  color: Colors.purpleAccent.shade200,
  child: const Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'Settings page',
        style: TextStyle(fontSize: 50.0),
      ),
      Text('Empty for now'),
    ]),
  ),
);
