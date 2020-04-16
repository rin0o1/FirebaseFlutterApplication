
import 'package:easyqueue/Settings/NavDrawer.dart';
import 'package:easyqueue/TabActivities/Calendar.dart';
import 'package:easyqueue/TabActivities/TabActivities.dart';
import 'package:easyqueue/TabChart/TabChart.dart';
import 'package:easyqueue/Settings/Settings.dart';
import 'package:easyqueue/routeGenerator.dart';
import 'package:flutter/material.dart';


import 'HomePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(),
    initialRoute: '/',
   // onGenerateRoute:RouteGenerator.generateRoute,
    routes: <String, WidgetBuilder>{
        '/calendar':(BuildContext context) => TabActivities(),
      '/chart':(BuildContext context) => TabChart(),
      '/option': (BuildContext context) => Settings(),
    }
    );
  }
}


