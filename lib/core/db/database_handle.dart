import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:shared_preferences/shared_preferences.dart';

//Enuerator
enum workshiftSaveType { emty, start, end }

//DB path strig
String mainAppDbPath = 'empty';

//Instances declair
SharedPreferences? prefs;
Database? mainAppDbInstace;

mainAppDbInit() async {
  //Make sure Binding has been initialized
  WidgetsFlutterBinding.ensureInitialized();
  print('EnsureInitialized');

  //Initialize SharedPreferences and get the instace
  final prefs = await SharedPreferences.getInstance();
  print('Getted SharedPrefs instance');

  //Check if main db is created
  if (prefs.getBool('appDbInit') != true) {
    //Create db path and save it into ShaerdPreferences
    final tempAppDbPath = join(await getDatabasesPath(), 'timesaver.db');
    prefs.setString('appDbPath', tempAppDbPath);
    print('DB path created and saved');

    //Save app init ok status
    prefs.setBool('appDbInit', true);
  }

  //Load path every time
  //Should be readed from SharedPrefs
  mainAppDbPath = join(await getDatabasesPath(), 'timesaver.db');
  //Open db
  final mainAppDbInstace = await openDb(mainAppDbPath);
}

//Create main app DB and tables
Future<Database> openDb(String path) async {
  //Create temp instance and open db
  Future<Database> mainDb;
  mainDb = openDatabase(path, version: 1, onCreate: maniAppDbCreate);
  print('main DB opened');

  return mainDb;
}

//Decalire dbcreate function
void maniAppDbCreate(Database db, int version) async {
  print('Starting create DB tables');
  await db.execute(
      //Create day table
      "CREATE TABLE IF NOT EXISTS day (Id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, Date TEXT, Notes TEXT);"
      "CREATE TABLE IF NOT EXISTS workshift (Id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, MainRefId INTEGER REFERENCES day (Id), StartTime TEXT, EndTime TEXT);"
      "CREATE TABLE IF NOT EXISTS expense (Id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, MainRefId INTEGER REFERENCES day (Id), Total INTEGER, Description TEXT, PaymentMethod INTEGER REFERENCES payment_method (Id));CREATE TABLE IF NOT EXISTS expense (Id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, MainRefId INTEGER REFERENCES day (Id), Total INTEGER, Description TEXT, PaymentMethod INTEGER REFERENCES payment_method (Id));"
      "CREATE TABLE IF NOT EXISTS payment_method (Id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, Name TEXT UNIQUE, Refound INTEGER CHECK (Refound = 0 OR Refound = 1));"
      "CREATE TABLE IF NOT EXISTS car_trip_refound (Id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, MainRefId INTEGER REFERENCES day (Id), TripDistance REAL, Description TEXT, Veichle INTEGER REFERENCES veichles (Id));"
      "CREATE TABLE IF NOT EXISTS veichles (Id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, Name TEXT UNIQUE, Refound INTEGER CHECK (Refound = 0 OR Refound = 1));");
  print('main DB tables created!');
}
