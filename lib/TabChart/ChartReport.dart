import 'package:flutter/material.dart';
import 'GeneralSituation.dart';
import 'SingleMonthCharts.dart';

class ChartReport extends StatefulWidget {

  ChartReport({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ChartReporState createState() => ChartReporState();

}

class ChartReporState extends State<ChartReport>{


  DateTime  _dateTime;
  SingleMonthCharts _SingleMonthCharts;
  

  ChartReporState(){
    _dateTime= DateTime.now();
    _SingleMonthCharts= new SingleMonthCharts(_dateTime);
  }

  @override
  Widget build(BuildContext context)  {

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                child: new Text('Report ${_dateTime.month}-${_dateTime.year}',
                    style: Theme.of(context).textTheme.display1
                    ),
              ),
            ],
          ),
          _SingleMonthCharts,
           GeneralSituationBarChart()
        ],
      ),


    );

  }




}


