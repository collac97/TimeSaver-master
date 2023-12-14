import 'package:sqflite/sqflite.dart';

import 'package:timesaver/classes/sqlite_models.dart';

//This file is to test day function until home project is handled
Future<Day> getActualDay(Database appDbInstance) async {
  //New instance have to be created to avoid null-safety error, and forcing null-safety

  //Save time stamp of today to have comparable value
  final today = DateTime.timestamp();
  print('actual timestamp');
  print(today);

  //Read last saved date from DB
  List<Map> dbResult = await appDbInstance.query('day',
      columns: ['Id', 'Date', 'Notes'], orderBy: "Date DESC", limit: 1);

  if (dbResult.isEmpty) {
    //Mean no days are into DB
    //Create actual day and return it
    print('no days are present');
    return createActualDay(appDbInstance);
  }

  //Instance one Day object
  Day lastSavedDay = Day.cFromMap(dbResult[0]);

  print(lastSavedDay.id);
  print(lastSavedDay.date);
  print(lastSavedDay.notes);

  //Extracct timestamp from DateTime datatype
  DateTime lastTimestamp =
      DateTime.fromMillisecondsSinceEpoch(lastSavedDay.date * 1000);

  if (today.year == lastTimestamp.year &&
      today.month == lastTimestamp.month &&
      today.day == lastTimestamp.day) {
    //Last saved timestamp is actual day, so we can return actual day
    print('lastSavedDate returned');
    return lastSavedDay;
  } else {
    //Last saved day is not today
    //Create actual day and return it
    print('create new day');
    return createActualDay(appDbInstance);
  }
}

Future<Day> createActualDay(Database appDbInstance) async {
  //Save actual timestamp to load into DB
  DateTime dateNow = DateTime.timestamp();
  double tempDate = dateNow.millisecondsSinceEpoch / 1000;
  int date = tempDate.truncate();
  print('get actual timestamp to save into DB');
  print(date);

  //Create map to use on load method
  Map<String, Object?> mCreatedDay = {'Date': date, 'Notes': ''};

  //Load actual new day and return new Row DB Id
  mCreatedDay['Id'] = await appDbInstance.insert('day', mCreatedDay);
  print('get new inseted day ID');
  print(mCreatedDay['Id']);

  //Decalair empty day to create instace and then load parameters into it
  Day createdDay = Day.cFromMap(mCreatedDay);
  createdDay.fromMap(mCreatedDay);

  print('day created');

  return createdDay;
}
