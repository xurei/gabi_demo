import 'package:flutter/material.dart';

abstract class Page extends StatefulWidget {
    Page({Key key, this.title}) : super(key: key);
    final String title;
}
