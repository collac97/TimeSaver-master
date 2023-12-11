import 'package:flutter/material.dart';

import 'package:timesaver/views/day_view/workshift_buttons.dart';

Container mainDayView = Container(
    margin: const EdgeInsets.only(top: 40),
    color: Colors.blue,
    child: Column(
      children: [
        Expanded(child: workTimeWindows, flex: 4),
        Expanded(child: dayTripWindows, flex: 2),
        Expanded(child: dayRefoundWindows, flex: 2)
      ],
    ));

Container workTimeWindows = Container(
  color: Colors.amber,
  child: Padding(
    padding: const EdgeInsets.all(30),
    child: Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        //Title and hour report
        children: [
          const SizedBox(
            height: 60,
            child: Text(
              'ORE',
              style: TextStyle(fontSize: 30),
            ),
          ),
          const Expanded(child: SizedBox()),
          SizedBox(
            width: 80,
            child: Container(
                color: Colors.green,
                child: const Text(
                  'Ord: 8',
                  style: TextStyle(fontSize: 20),
                )),
          ),
          const SizedBox(width: 50),
          SizedBox(
            width: 80,
            child: Container(
                color: Colors.purple,
                child: const Text(
                  'Str: 1',
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
      Row(children: [
        workshiftButtonsView,
        const Expanded(child: SizedBox()),
        workshiftTimes
      ])
    ]),
  ),
);

Container dayTripWindows = Container(
  width: double.infinity,
  color: Colors.green,
  child:
      const Padding(padding: EdgeInsets.all(10), child: Text('prova day trip')),
);

Container dayRefoundWindows = Container(
  width: double.infinity,
  color: Colors.purple,
  child: const Padding(
      padding: EdgeInsets.all(10), child: Text('prova day refound')),
);

ConstrainedBox workshiftTimes = ConstrainedBox(
  constraints: const BoxConstraints(
      maxWidth: 500, maxHeight: 500, minWidth: 220, minHeight: 220),
  child:
      Container(color: Colors.grey, child: const Text('Per ora non cè niente')),
);
