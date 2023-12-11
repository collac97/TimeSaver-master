import 'package:flutter/material.dart';

Column workshiftButtonsView = const Column(
  children: [
    MaterialButton(
        onPressed: onPressedWorkshiftEnter,
        color: Colors.red,
        height: 80,
        minWidth: 100,
        child: Text('Entrata')),
    SizedBox(height: 30),
    MaterialButton(
        onPressed: onPressedWorkshiftExit,
        color: Colors.red,
        height: 80,
        minWidth: 100,
        child: Text('Uscita'))
  ],
);

void onPressedWorkshiftEnter() {}

void onPressedWorkshiftExit() {}
