
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
          color: Colors.blueGrey,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new FlatButton.icon(
                icon: Icon(Icons.save),
                label: Text('Salva'),
                color: Colors.amber,
                textColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                onPressed: () {},
              ),
              new FlatButton.icon(
                icon: Icon(Icons.close),
                label: Text('Cancel'),
                color: Colors.redAccent,
                textColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                onPressed: () { },
              ),

            ],
          ),
      )
        ],
      ),
      );
  }
}