import 'dart:async';
import 'dart:math';

import 'package:gabi_example/model/data_point.dart';

var rand = new Random();

/// Mock service listening to the backend.
class GabiBackendService {
  Timer listenTemperature(Function callback) {
    double curV = 37.1;
    return new Timer.periodic(const Duration(seconds: 1), (_) {
      curV = curV + (rand.nextDouble() - 0.5) * 0.7;
      callback(DataPoint(t: DateTime.now(), v: curV));
    });
  }

  Timer listenO2Sat(Function callback) {
    double curV = 94;
    return new Timer.periodic(const Duration(seconds: 1), (_) {
      curV = curV + (rand.nextDouble() - 0.5) * 1;
      callback(DataPoint(t: DateTime.now(), v: curV));
    });
  }
}
