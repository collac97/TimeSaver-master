//import 'package:flutter/material.dart';

import 'dart:ffi';
import 'package:flutter/material.dart';

class Day {
  int id;
  String date;
  String note;

  Day({required this.id, required this.date, required this.note});
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
}

class PaymentMethod {
  int id;
  String name;
  bool refound;

  PaymentMethod({required this.id, required this.name, required this.refound});
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
}

class Veichle {
  int id;
  String name;
  bool refound;

  Veichle({required this.id, required this.name, required this.refound});
}
