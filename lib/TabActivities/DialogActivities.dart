
import 'package:easyqueue/TabActivities/TabActivities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AddTripSection extends StatefulWidget
{
  AddTripSection ({Key key}) :super( key: key);

  AddTripSectionState TripSectionState= new AddTripSectionState();

  void ShowSection(){TripSectionState.setState((){TripSectionState.viewVisible=true;});}

  @override
  AddTripSectionState createState()=> TripSectionState;

}

class AddTripSectionState extends State<AddTripSection> {
  final _formKey = GlobalKey<FormState>();
  bool viewVisible = false;

  void HideSection() {
    setState(() {
      viewVisible = false;
    });
  }

  Form CreateForm() {
    return Form(
        key: _formKey,
        child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Inserisci",
                    contentPadding: EdgeInsets.all(15.0),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Inserisci",
                    contentPadding: EdgeInsets.all(15.0),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Inserisci",
                    contentPadding: EdgeInsets.all(15.0),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Inserisci",
                    contentPadding: EdgeInsets.all(15.0),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
            ]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: viewVisible,
      child: new Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: 400,
        width: 400,
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                CreateForm()
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new FlatButton.icon(

                      icon: Icon(Icons.save),
                      label: Text('Salva'),
                      color: Colors.amber,
                      textColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
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
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      onPressed: HideSection,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }


}