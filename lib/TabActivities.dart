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



  int Counter=0;

  sendData(){
    DatabaseReference db = FirebaseDatabase.instance.reference().child("rino-3fbc0");
    db.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        print(values["via"]);
      });
    });



  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
      body: new Center(

      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$Counter'
          ),
       ],
      ),
     ),
          floatingActionButton: new FloatingActionButton(
            onPressed: sendData,
            elevation: 50,
            hoverElevation: 50,
            splashColor: Colors.amberAccent,
            tooltip: 'Increment',
            child: new Icon(Icons.add),
    ),
    );

    }
}

