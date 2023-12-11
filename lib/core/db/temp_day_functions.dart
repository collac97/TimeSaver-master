import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:timesaver/core/db/database_handle.dart';

//This file is to test day function until home project is handled

void checkIfActualDayExist() async {
  //New instance have to be created to avoid null-safety error, and forcing null-safety
  final Database localDbInstance = mainAppDbInstace!;

  List<Map> dbResult = await localDbInstance.query('day',
      columns: ['Id'], orderBy: "Date DESC", limit: 1);
}
