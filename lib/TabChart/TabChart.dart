
import 'package:easyqueue/Settings/NavDrawer.dart';
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
    drawer: NavDrawer(),
body: Column(
  children: <Widget>[
    Row(
      children: <Widget>[
        FlatButton(

          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Calendar'),
        ),
        FlatButton(

          onPressed: (){
            Navigator.pushNamed(context, '/chart');
          },
          child: Text('Charts'),
        ),


        SafeArea(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TripSection
          ],
        ),
      ),
      FloatingActionButton(
        heroTag: 'ChartActionButton',
        onPressed:TripSection.ShowSection,
        backgroundColor: Colors.orange,
        elevation: 50,
        hoverElevation: 50,
        splashColor: Colors.blue,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
      ],
    )
  ],
),


    );

  }
}

