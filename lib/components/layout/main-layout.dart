import 'package:flutter/material.dart';
import 'package:gabi_example/pages/o2sat.dart';
import 'package:gabi_example/pages/page.dart';
import 'package:gabi_example/pages/temperature.dart';

class MainLayout extends StatefulWidget {
    MainLayout({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
    Page body = new TemperaturePage();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            key: _scaffoldKey,
            backgroundColor: const Color(0xFF222222),
            appBar: AppBar(
                title: Text(body.title),
                leading: IconButton(
                    icon: Icon(Icons.menu),
                    tooltip: 'Menu',
                    onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                    },
                ),
            ),
            body: this.body,
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                    DrawerHeader(
                        child: Text('PROFILE'),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                        ),
                    ),
                    ListTile(
                        title: Text('Temperature'),
                        onTap: () {
                            setState(() {
                                body = TemperaturePage();
                            });
                            Navigator.pop(context);
                        },
                    ),
                    ListTile(
                        title: Text('O² Saturation'),
                        onTap: () {
                            setState(() {
                                body = O2SatPage();
                            });
                            Navigator.pop(context);
                        },
                    ),
                ]
              )
            ),
        );
    }
}
