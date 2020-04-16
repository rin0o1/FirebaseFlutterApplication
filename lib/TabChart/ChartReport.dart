
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'SingleMonthCharts.dart';

class ChartReport extends StatefulWidget {

  ChartReport({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ChartReporState createState() => ChartReporState();


}

class ChartReporState extends State<ChartReport>{

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(

        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 0, 10),
                child: new Text('Report',
                    style: Theme.of(context).textTheme.display1),
              ),
            ],
          ),

          SingelMonthCharts()
        ],
      ),


    );

  }




}


