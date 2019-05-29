/// Example of a simple line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:gabi_example/model/data_point.dart';

class SimpleLineChart extends StatelessWidget {
  final List<DataPoint> data;
  final bool animate = true;
  final double rangeMin;
  final double rangeMax;

  SimpleLineChart({this.data, this.rangeMin, this.rangeMax});

  @override
  Widget build(BuildContext context) {
    var chart = new charts.TimeSeriesChart(
      _createSampleData(),
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      primaryMeasureAxis: new charts.NumericAxisSpec(
        tickProviderSpec: new charts.BasicNumericTickProviderSpec(zeroBound: false),
        viewport: charts.NumericExtents(rangeMin, rangeMax),
      ),
    );

    return chart;
  }

  /// Create one series with sample hard coded data.
  List<charts.Series<DataPoint, DateTime>> _createSampleData() {
    return [
      new charts.Series<DataPoint, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (DataPoint point, _) => point.t,
        measureFn: (DataPoint point, _) => point.v,
        //measureOffsetFn: (DataPoint point, _) => -34.0,
        //measureUpperBoundFn: (DataPoint point, _) => 42.0,
        //measureLowerBoundFn: (DataPoint point, _) => 34.0,
        //domainLowerBoundFn: (DataPoint point, _) => 2,
        //domainUpperBoundFn: (DataPoint point, _) => 4,
        data: this.data,

      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final double year;
  final int sales;

  LinearSales(this.year, this.sales);
}
