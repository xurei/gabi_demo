import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gabi_example/components/layout/monitor_view.dart';
import 'package:gabi_example/model/data_point.dart';
import 'page.dart';

var rand = new Random();

class O2SatPage extends Page {
  O2SatPage({Key key}) : super(
    key: key,
    title: 'O² Saturation'
  );

  @override
  _O2SatPageState createState() => _O2SatPageState();
}

class _O2SatPageState extends State<O2SatPage> {
  bool menuOpen = false;
  List<DataPoint> data = [
    DataPoint(t: DateTime.now().add(new Duration(seconds: -1)), v: 93.1),
    DataPoint(t: DateTime.now(), v: 93.4),
  ];

  Timer timer = null;

  double curV = 94;

  @override
  initState() {
    super.initState();

    this.timer = new Timer.periodic(const Duration(seconds: 1), (_) =>
      setState(() {
        curV = curV + (rand.nextDouble()-0.5) * 0.7;

        if (data.length > 50) {
          var newData = data.sublist(data.length - 50);
          newData.add(DataPoint(t: DateTime.now(), v: curV));
          data = newData;
        }
        else {
          var newData = data.sublist(0);
          newData.add(DataPoint(t: DateTime.now(), v: curV));
          data = newData;
        }
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return MonitorView(
      data: data,
      unit: '%',
      rangeMin: 80,
      rangeMax: 100,
      rangeAlertMin: 89,
      rangeAlertMax: 98,
    );
  }

  @override
  dispose() {
    super.dispose();
    timer.cancel();
  }
}
