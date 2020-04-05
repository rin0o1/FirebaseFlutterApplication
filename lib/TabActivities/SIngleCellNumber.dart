import 'package:easyqueue/TabActivities/Calendar.dart';
import 'package:flutter/material.dart';


class CellNumber extends StatefulWidget{


  CellNumberState _CellNUmberState;

  CellNumber(Key key,int dayNumber, int gridViewIndex , bool IsTheDay ):super(key:key) {

       _CellNUmberState= new CellNumberState(dayNumber, gridViewIndex,IsTheDay);

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


  CellNumberState(int dayNumber,int gridViewIndex ,bool isTheDay)
  {

    DayNumber=dayNumber;

    GridViewIndex=gridViewIndex;
    IsTheDay=isTheDay;

    CellColor= Colors.orange;

  }

  @override
  Container build(BuildContext context) {
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
            buildDayNumberWidget(),
            //buildDayEventInfoWidget(dayNumber)
          ],
        ),
      ),
    );
  }

  Align buildDayNumberWidget( ) {

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 35.0, // Should probably calculate these values
        height: 43.0,
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