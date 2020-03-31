
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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Colors.blue,
      body: new SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (text) {

                //Show these result
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.place),
                  hintText: "Inserisci",
                  contentPadding: EdgeInsets.all(15.0),
                  border: InputBorder.none,
                  filled: true,

                ),
              ),
            ),

          ],
        ),
      ),
    );

  }
}

