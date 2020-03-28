
import 'package:easyqueue/TabActivities/AddTripSection.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class TabActivities extends StatefulWidget
{
  TabActivities({Key key}) :super (key : key);
  @override
  TabActivitiesState createState()=> TabActivitiesState();
}

class TabActivitiesState extends State<TabActivities>
{
  bool viewVisible = false ;

  void showWidget(){
    setState(() {
      viewVisible = true ;
    });
  }

  void hideWidget(){
    setState(() {
      viewVisible = false ;

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Colors.blue,
      body: new SafeArea(

      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Visibility(

              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: viewVisible,
              child: AddTripSection(

              )
          ),
        ],
              ),
     ),
          floatingActionButton: new FloatingActionButton(
            onPressed:showWidget,
            elevation: 50,
            hoverElevation: 50,
            splashColor: Colors.amberAccent,
            tooltip: 'Increment',
            child: new Icon(Icons.add),

    ),
    );

    }
}

