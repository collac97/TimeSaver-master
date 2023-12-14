//import 'package:flutter/material.dart';

import 'dart:ffi';
import 'package:flutter/material.dart';

class Day {
  int id;
  int date;
  String notes;

  Day(this.id, this.date, this.notes);

  //Named constructon to init class from map
  Day.cFromMap(Map<dynamic, dynamic> sourceData)
      : id = sourceData['Id'] as int,
        date = sourceData['Date'] as int,
        notes = sourceData['Notes'] as String;

  void fromMap(Map<String, Object?> mappedData) {
    id = mappedData['Id'] as int;
    date = mappedData['Date'] as int;
    notes = mappedData['Notes'] as String;
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Date': date,
      'Notes': notes,
    };
  }
}

class Workshift {
  int id;
  int mainIdRef;
  String startTime;
  String endTime;

  Workshift(
      {required this.id,
      required this.mainIdRef,
      required this.startTime,
      required this.endTime});

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'MainIdRef': mainIdRef,
      'StartTime': startTime,
      'EndTime': endTime,
    };
  }
}

class Expances {
  int id;
  int mainRefId;
  Float total;
  Text description;
  int paymentMethod;

  Expances(
      {required this.id,
      required this.mainRefId,
      required this.total,
      required this.description,
      required this.paymentMethod});

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'MainRefId': mainRefId,
      'Total': total,
      'Description': description,
      'PaymentMethod': paymentMethod,
    };
  }
}

class PaymentMethod {
  int id;
  String name;
  bool refound;

  PaymentMethod({required this.id, required this.name, required this.refound});

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Name': name,
      'Refound': refound,
    };
  }
}

class CarTripRefound {
  int id;
  int mainRefId;
  Float tripDistance;
  String description;
  int veichle;

  CarTripRefound(
      {required this.id,
      required this.mainRefId,
      required this.tripDistance,
      required this.description,
      required this.veichle});

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'MainRefId': mainRefId,
      'TripDistance': tripDistance,
      'Description': description,
      'Veichle': veichle,
    };
  }
}

class Veichle {
  int id;
  String name;
  bool refound;

  Veichle({required this.id, required this.name, required this.refound});

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Name': name,
      'Refound': refound,
    };
  }
}
