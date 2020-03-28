
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTripSection extends StatefulWidget
{
  AddTripSection ({Key key}) :super( key: key);
  @override
  AddTripSectionState createState()=> AddTripSectionState();
}

class AddTripSectionState extends State<AddTripSection>
{

 @override
  Widget build(BuildContext context) {
    return  new Center(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
      new Container(
          height: 400,
          width: 400,
          color: Colors.white30,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.end ,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              RaisedButton(

                child: Text('Ciao'),
              )
            ],
          ),
      )
        ],
      ),
      );
  }
}