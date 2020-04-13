
import 'package:easyqueue/TabActivities/TabActivities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AdditionalInformation extends StatefulWidget
{
  AdditionalInformation ({Key key}) :super( key: key);

  AdditionalInformationState TripSectionState= new AdditionalInformationState();

  //Get SingleShift information
  void ShowSection(){TripSectionState.setState((){TripSectionState.viewVisible=true;});}

  @override
  AdditionalInformationState createState()=> TripSectionState;

}

class AdditionalInformationState extends State<AdditionalInformation> {
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

            ]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainSize: false,
      maintainAnimation: true,
      maintainState: true,
      visible: viewVisible,
      child: new Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.redAccent,

       ),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        margin: EdgeInsets.fromLTRB(10, 45, 10, 0),
        height: 380,
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
                      color: Colors.orangeAccent,
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
                      color: Colors.orangeAccent,
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