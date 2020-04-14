import 'package:easyqueue/Model/mShiftSettings.dart';
import 'package:easyqueue/TabActivities/TabActivities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easyqueue/Model/mSingleShift.dart';
import 'package:easyqueue/Utilities/DataManager.dart';

class AdditionalInformation extends StatefulWidget {
  AdditionalInformation({Key key}) : super(key: key);

  AdditionalInformationState AddAdditionalInformation =
      new AdditionalInformationState();

  //Get SingleShift information
  void ShowSection(SingleShift s) {
    AddAdditionalInformation.ShowSection(s);
  }

  @override
  AdditionalInformationState createState() => AddAdditionalInformation;
}

class AdditionalInformationState extends State<AdditionalInformation> {



  bool viewVisible;
  SingleShift s;
  DataManager _DataManager;

  String AdditionHoursInText;
  String AdditionPaymentInText;
  String NotesText;

  AdditionalInformationState(){
    _DataManager= new DataManager();
    viewVisible=false;
  }

  void ShowSection(SingleShift _s){
    setState(() {

      s=_s;
      AdditionHoursInText=( (s==null) || s.AdditionalHours== 0.0 || s.AdditionalHours==null )  ? '' : s.getAdditionalHoursInStirng();
      AdditionPaymentInText= ( (s==null) || s.AdditionalPayment== 0.0 || s.AdditionalPayment==null) ? '' : s.getAdditionPaymentInString();
      NotesText= ( (s==null) || s.Notes==null ) ? '' : s.Notes ;

      viewVisible=true;

    });

  }

  void HideSection() {
    setState(() {
      viewVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(

      child: new Column(
        children: <Widget>[
          Visibility(
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
                        new Container(
                          height: 300,
                          child: new ListView(
                            children: <Widget>[
                              getDialogForm()
                            ],
                          ),
                        ),
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
                              onPressed: validateForm,
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
                  ]),
            ),
          )
        ],
      ),
    );
  }


  Form getDialogForm() {
    return Form(
        key: UniqueKey(),
        child: new Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: AdditionHoursInText,
                onChanged: (String v){
                  AdditionHoursInText=v;
                },
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  hintText: "Ore aggiuntive",
                  labelText: "Ore aggiuntive",
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
                initialValue: AdditionPaymentInText,
                onChanged: (String v){
                  AdditionPaymentInText=v;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Pagamenti aggiuntivi",
                  labelText: "Pagamenti aggiuntivi",
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
                initialValue:   NotesText,
                onChanged: (String v){
                  NotesText=v;
                },
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Note ",
                  labelText: "Note ",
                  contentPadding: EdgeInsets.all(15.0),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
          ],
        ));
  }

  validateForm (){


    s.setAdditionalDurationInHoursInString(AdditionHoursInText);
    s.setAdditionalPaymentForHourInString(AdditionPaymentInText);
    s.Notes= NotesText;
    _DataManager.saveModel(s);



    HideSection();


  }
}

