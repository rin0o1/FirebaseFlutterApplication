import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class TabActivities extends StatefulWidget
{
  TabActivities({Key key}) :super (key : key);

  @override
  TabActivitiesState createState()=> TabActivitiesState();

}

class TabActivitiesState extends State<TabActivities>
{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
      body: new Center(

      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
       ],
      ),
     ),
          floatingActionButton: new FloatingActionButton(
            elevation: 50,
            hoverElevation: 50,
            splashColor: Colors.amberAccent,
            tooltip: 'Increment',
            child: new Icon(Icons.add),
    ),
    );

    }
}

