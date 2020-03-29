
import 'package:easyqueue/TabActivities/TabActivities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTripSection extends StatefulWidget
{
  AddTripSection ({Key key}) :super( key: key);

  AddTripSectionState TripSectionState= new AddTripSectionState();

  
  void ShowSection(){TripSectionState.setState((){TripSectionState.viewVisible=true;});}


  @override
  AddTripSectionState createState()=> TripSectionState;
}

class AddTripSectionState extends State<AddTripSection>
{

  final _formKey = GlobalKey<FormState>();
  bool viewVisible = false ;
  void HideSection(){setState((){viewVisible=false;});}

 @override
 Widget build(BuildContext context)
 {
   return Visibility(
     maintainSize: true,
     maintainAnimation: true,
     maintainState: true,
     visible: viewVisible,
     child:   new Center(
       child:   new Container(
         height: 400,
         width: 400,
         color: Colors.blueGrey,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new FlatButton.icon(
                    icon: Icon(Icons.save),
                    label: Text('Salva'),
                    color: Colors.amber,
                    textColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    splashColor: Colors.white,
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
                    splashColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    onPressed: HideSection,
                  ),
                ],
              )
            ],
          ),


        ),
       ),

     ),
   );
 }


  Widget build_(BuildContext context) {
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: viewVisible,
      child:   new Center(
        child:   new Container(
              height: 400,
              width: 400,
              color: Colors.blueGrey,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end ,
                        children: <Widget>[
                          new FlatButton.icon(
                            icon: Icon(Icons.save),
                            label: Text('Salva'),
                            color: Colors.amber,
                            textColor: Colors.black,
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                            splashColor: Colors.white,
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
                            splashColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            onPressed: HideSection,
                          ),
                        ],

                      ),

                    ),

                ),
    );
  }
}