import 'package:flutter/material.dart';

class DashboardSection extends StatelessWidget {
    // a property on this class
    final Widget child;
    final double height;
    final Color color;

    DashboardSection({
        Key key,
        this.child,
        this.height = 300,
        this.color,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        // This method is rerun every time setState is called, for instance as done
        // by the _incrementCounter method above.
        //
        // The Flutter framework has been optimized to make rerunning build methods
        // fast, so that you can just rebuild anything that needs updating rather
        // than having to individually change instances of widgets.
        return Container(
          padding: const EdgeInsets.all(1.0),
          margin: const EdgeInsets.all(5.0),
          height: this.height,
          color: this.color,
          child: Container(
              padding: const EdgeInsets.all(8.0),
              height: this.height,
              color: Colors.black87,
              child: this.child,
          )
        );
    }
}
