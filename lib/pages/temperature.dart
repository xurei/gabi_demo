import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gabi_example/components/layout/monitor_view.dart';
import 'package:gabi_example/model/data_point.dart';
import 'package:gabi_example/services/gabi-backend-service.dart';
import 'page.dart';

var backendService = new GabiBackendService();

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

    Timer timer;

    @override
    initState() {
      super.initState();

      this.timer = backendService.listenTemperature((datapoint) =>
        setState(() {
          if (data.length > 50) {
            var newData = data.sublist(data.length - 50);
            newData.add(datapoint);
            data = newData;
          }
          else {
            var newData = data.sublist(0);
            newData.add(datapoint);
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
            rangeMax: 42,
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
