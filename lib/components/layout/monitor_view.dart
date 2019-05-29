import 'package:flutter/material.dart';

//import 'package:fcharts/fcharts.dart';
import 'package:date_format/date_format.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:gabi_example/components/chart/line_chart.dart';
import 'package:gabi_example/model/data_point.dart';

import 'dashboard_section.dart';

class MonitorView extends StatefulWidget {
  const MonitorView({Key key,
    this.unit,
    this.rangeMin,
    this.rangeMax,
    this.rangeAlertMin,
    this.rangeAlertMax,
    this.data}) : super(key: key);

  final String unit;
  final double rangeMin;
  final double rangeMax;
  final double rangeAlertMin;
  final double rangeAlertMax;
  final List<DataPoint> data;

  @override
  _MonitorViewState createState() => _MonitorViewState();
}

class _MonitorViewState extends State<MonitorView> {
  @override
  Widget build(BuildContext context) {
    double value = widget.data[widget.data.length - 1].v;

    String rangeText = "In normal range";
    Color color = Colors.blueGrey[900];

    if (value < widget.rangeAlertMin) {
      rangeText = "Too low !";
      color = Colors.red;
    }
    else if (value > widget.rangeAlertMax) {
      rangeText = "Too high !";
      color = Colors.red;
    }

    return Center(
      child: ListView(
        children: <Widget>[
          DashboardSection(
              color: color,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value.toStringAsFixed(1) + widget.unit,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 50),
                  ),
                  Text(
                    rangeText,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
          ),
          DashboardSection(
            height: 300,
            color: Colors.blueGrey[900],
            child: SimpleLineChart(
              data: widget.data,
              rangeMin: widget.rangeMin,
              rangeMax: widget.rangeMax,
            ),
          ),
        ],
      ),
    );
  }
}
