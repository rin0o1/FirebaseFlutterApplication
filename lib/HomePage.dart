import 'package:easyqueue/Settings/NavDrawer.dart';
import 'package:easyqueue/TabActivities/Calendar.dart';
import 'Settings/NavDrawer.dart';
import 'TabActivities/TabActivities.dart';
import 'TabChart/TabChart.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'TabActivities/TabActivities.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          drawer: NavDrawer(),
          appBar: AppBar(
            title: Text('App'),
          ),
          body:TabActivities(),
    );


  }
}
