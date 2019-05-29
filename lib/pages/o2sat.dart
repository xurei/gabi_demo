import 'package:flutter/material.dart';

import '../components/layout/dashboard-section.dart';
import 'page.dart';

class O2SatPage extends Page {
    O2SatPage({Key key}) : super(
      key: key,
      title: 'O² Saturation'
    );

    @override
    _O2SatPageState createState() => _O2SatPageState();
}

class _O2SatPageState extends State<O2SatPage> {
    int _counter = 0;
    bool menuOpen = false;
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

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
