import 'dart:math';
import 'dart:ui';

import 'package:easyqueue/Model/mSingleShift.dart';
import 'package:easyqueue/TabActivities/Calendar.dart';
import 'package:easyqueue/TabActivities/DialogActivities.dart';
import 'package:flutter/material.dart';
import 'package:easyqueue/Utilities/DataManager.dart';

class CellNumber extends StatefulWidget{


  CellNumberState _CellNUmberState;

  CellNumber(int dayNumber, int gridViewIndex , bool IsTheDay, SingleShift singleShift, DateTime myDateTime , AdditionalInformation additionalInformation){
       _CellNUmberState= new CellNumberState(dayNumber, gridViewIndex,IsTheDay, singleShift, myDateTime,additionalInformation);
  }

  @override
  State<StatefulWidget> createState(){ return _CellNUmberState;}
}

class CellNumberState extends State<CellNumber>
{
  int DayNumber;
  int GridViewIndex;
  bool IsTheDay;
  Color CellColor;
  SingleShift _SingleShift;
  DateTime MyDateTime;

  DataManager _dataManager;

  bool CanSave=false;

  AdditionalInformation _AdditionalInformation;



  CellNumberState(int dayNumber,int gridViewIndex ,bool isTheDay, SingleShift singleShift, DateTime myDateTime, AdditionalInformation additionalInformation)
  {
    DayNumber=dayNumber;
    GridViewIndex=gridViewIndex;
    IsTheDay=isTheDay;
    CellColor= Colors.blue;
    _SingleShift= singleShift;
    MyDateTime=myDateTime;
    _AdditionalInformation= additionalInformation;

    _dataManager= new DataManager();

    if (singleShift==null)
    {
      CanSave=true;
      CellColor=Colors.orange;
    }
  }

  @override
  Container build(BuildContext context) {

    return new Container(
      margin: const EdgeInsets.all(3.0),
      padding: const EdgeInsets.all(1.0),
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color:CellColor),
      child: GestureDetector(
        onTap: (MyDateTime==null) ? ()=>{} : onClick,
        onLongPress: (_AdditionalInformation==null) ? ()=> {} : onLongClick,
        child: new Column(
          children: <Widget>[
            buildDayNumberWidget(),

            //buildDayEventInfoWidget(dayNumber)
          ],
        ),
      ),
    );
  }


  void onLongClick(){

    print("----------------------------------------------------------------------------");
    _AdditionalInformation.ShowSection();
  }

  void onClick()
  {

   setState(() {
      if (CanSave)
      {
        CellColor=Colors.blue;
        CanSave=false;
        _SingleShift= new SingleShift(MyDateTime);
        _dataManager.saveModel(_SingleShift);
      }
      else {
        CellColor= Colors.orange;
        CanSave=true;
        _dataManager.removeModelFromKey(_SingleShift.Key);
    }

   });

  }

  Align buildDayNumberWidget( ) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 37.0, // Should probably calculate these values
        height: 53.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (this.IsTheDay) ? Colors.yellowAccent : null),
        padding: EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
        child: new Text(
          (DayNumber==-1) ? ' ' : DayNumber.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }


}