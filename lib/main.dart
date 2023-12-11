//Import dart packages
import 'package:flutter/material.dart';

//Import project packages
import 'package:timesaver/views/main_view.dart';
import 'package:timesaver/core/db/database_handle.dart';

void main() {
  //Start db handle
  mainAppDbInit();

  runApp(const TimeSaverApp());
}

class TimeSaverApp extends StatelessWidget {
  const TimeSaverApp({super.key});

  // Root app Widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Saver',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors
                .deepPurple), //Leave like this, new colorscheme have to be created
        useMaterial3: true,
      ),
      home: const TimeSaverHomePage(title: 'TimeSaver Home'),
    );
  }
}
