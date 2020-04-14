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
    return MaterialApp(
      title: "App su App",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('App'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Attività",
                ),
                Tab(
                  text: "Statistiche",
                )
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              TabActivities(),
              TabChart(),

            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
