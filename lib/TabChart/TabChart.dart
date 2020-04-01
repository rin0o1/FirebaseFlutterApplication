
import 'package:easyqueue/TabActivities/DialogActivities.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class TabChart extends StatefulWidget
{
  TabChart({Key key}) :super (key : key);
  @override
  TabChartState createState()=> TabChartState();
}

class TabChartState extends State<TabChart>
{
  AddTripSection TripSection= new AddTripSection();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Colors.blue,
      body: new SafeArea(

        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TripSection
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed:TripSection.ShowSection,
        backgroundColor: Colors.orange,
        elevation: 50,
        hoverElevation: 50,
        splashColor: Colors.blue,
        tooltip: 'Increment',
        child: new Icon(Icons.add),

      ),
    );

  }
}
