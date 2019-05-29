import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gabi_example/components/layout/monitor_view.dart';
import 'package:gabi_example/model/data_point.dart';
import 'page.dart';

var rand = new Random();

class TemperaturePage extends Page {
    TemperaturePage({Key key}) : super(
        key: key,
        title: 'Temperature'
    );

    @override
    _TemperaturePageState createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
    bool menuOpen = false;
    List<DataPoint> data = [
      DataPoint(t: DateTime.now().add(new Duration(seconds: -1)), v: 37.3),
      DataPoint(t: DateTime.now(), v: 37.4),
    ];

    Timer timer = null;

    double curV = 37.1;

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
            unit: '°C',
            rangeMin: 34,
            rangeMax: 41,
            rangeAlertMin: 37,
            rangeAlertMax: 38,
        );
    }

    @override
    dispose() {
      super.dispose();
      timer.cancel();
    }
}
