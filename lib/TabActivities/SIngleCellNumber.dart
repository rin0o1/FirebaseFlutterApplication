import 'package:easyqueue/TabActivities/Calendar.dart';
import 'package:flutter/material.dart';


class CellNumber extends StatefulWidget{

  int DayNumber;
  int MonthOffset;
  int GridViewIndex;
  DateTime _dateTime;

  CellNumber(int dayNumber, int monthOffset, int GridViewIndex, DateTime _dateTime){
    DayNumber=dayNumber;
    MonthOffset=monthOffset;
    this.GridViewIndex=GridViewIndex;
    this._dateTime=_dateTime;
    createState();
  }
  @override
  State<StatefulWidget> createState(){ return CellNumberState(DayNumber, MonthOffset, GridViewIndex,_dateTime);}
}


class CellNumberState extends State<CellNumber>
{
  int DayNumber;
  int MonthOffset;
  int GridViewIndex;
  DateTime _dateTime;
  Color CellColor;


   CellNumberState(int dayNumber, int monthOffset, int gridViewIndex, DateTime _dateTime)
  {
    DayNumber=dayNumber;
    MonthOffset=monthOffset;
    GridViewIndex=gridViewIndex;
    this._dateTime=_dateTime;
    CellColor= Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: const EdgeInsets.all(3.0),
      padding: const EdgeInsets.all(1.0),
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          //Se è un giorno in cui ho lavorato è da inserire qui
          color: CellColor),
      child: GestureDetector(
        onTap: () => {
          setState( (){
            CellColor= (CellColor==Colors.blue) ?Colors.orange : Colors.blue;

          })
        },
        child: new Column(
          children: <Widget>[
            buildDayNumberWidget(GridViewIndex),
            //buildDayEventInfoWidget(dayNumber)
          ],
        ),
      ),
    );
  }

  Align buildDayNumberWidget(int dayNumber) {
    bool IsTheDay = (dayNumber - MonthOffset) == DateTime.now().day &&
        _dateTime.month == DateTime.now().month &&
        _dateTime.year == DateTime.now().year;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 35.0, // Should probably calculate these values
        height: 43.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (IsTheDay) ? Colors.yellowAccent : null),
        padding: EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
        child: new Text(
          dayNumber <= MonthOffset ? ' ' : (dayNumber - MonthOffset).toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }
}