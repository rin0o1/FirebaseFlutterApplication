
import 'package:easyqueue/TabActivities/TabActivities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTripSection extends StatefulWidget
{
  AddTripSection ({Key key}) :super( key: key);

  AddTripSectionState as= new AddTripSectionState();

  void show(){as.showWidget();}
  void hide(){as.hideWidget();}

  @override
  AddTripSectionState createState()=> as;
}

class AddTripSectionState extends State<AddTripSection>
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
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: viewVisible,
      child:   new Center(
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
                    onPressed: hideWidget,
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}