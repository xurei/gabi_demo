import 'package:flutter/material.dart';

import '../components/layout/dashboard-section.dart';
import 'page.dart';

class MonitorView extends StatefulWidget {
    @override
    _MonitorViewState createState() => _MonitorViewState();
}

class _MonitorViewState extends State<MonitorView> {
    int _counter = 0;
    bool menuOpen = false;

    void _incrementCounter() {
        setState(() {
            _counter++;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Center(
            child: ListView(
                children: <Widget>[
                    DashboardSection(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text(
                                  '37°',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 50),
                              ),
                              Text(
                                  'In normal range',
                                  textAlign: TextAlign.center,
                              ),
                              Text(
                                  this.menuOpen ? 'open' : 'close',
                                  textAlign: TextAlign.center,
                              ),
                          ],
                      )),
                    Text(
                        'You have clicked the button this many times:',
                        textAlign: TextAlign.center,
                    ),
                    Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.display1,
                    ),
                ],
            ),
        );
    }
}
