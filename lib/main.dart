import 'package:flutter/material.dart';
import 'package:gabi_example/pages/temperature.dart';

import 'components/layout/dashboard_section.dart';
import 'components/layout/main_layout.dart';

void main() => runApp(MyApp());

const primaryColor = const Color(0xFF79E2FC);

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: primaryColor,
              scaffoldBackgroundColor: const Color(0xFFEFEFEF),
              backgroundColor: const Color(0xFFEFEFEF),
              textTheme: TextTheme(
                  body1: TextStyle(
                      color: Colors.white,
                  ),
              )),
            home: MainLayout(title: 'Flutter Demo Home Page')/*MyHomePage()*/,
        );
    }
}

class MyHomePage extends StatefulWidget {
    MyHomePage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    int _counter = 0;
    bool menuOpen = false;
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

    void _incrementCounter() {
        setState(() {
            // This call to setState tells the Flutter framework that something has
            // changed in this State, which causes it to rerun the build method below
            // so that the display can reflect the updated values. If we changed
            // _counter without calling setState(), then the build method would not be
            // called again, and so nothing would appear to happen.
            _counter++;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            key: _scaffoldKey,
            backgroundColor: const Color(0xFF222222),
            appBar: AppBar(
                title: Text(widget.title),
                leading: IconButton(
                    icon: Icon(Icons.menu),
                    tooltip: 'Air it',
                    onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                    },
                ),
            ),
            drawer: Drawer(

              child: ListView(
                  children: [
                      Text('drawer'),
                  ]
              )
            ),
            body: Center(
                child: ListView(
                    // Column is also layout widget. It takes a list of children and
                    // arranges them vertically. By default, it sizes itself to fit its
                    // children horizontally, and tries to be as tall as its parent.
                    //
                    // Invoke "debug painting" (press "p" in the console, choose the
                    // "Toggle Debug Paint" action from the Flutter Inspector in Android
                    // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                    // to see the wireframe for each widget.
                    //
                    // Column has various properties to control how it sizes itself and
                    // how it positions its children. Here we use mainAxisAlignment to
                    // center the children vertically; the main axis here is the vertical
                    // axis because Columns are vertical (the cross axis would be
                    // horizontal).
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
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
                backgroundColor: primaryColor,
            ),
        );
    }
}
