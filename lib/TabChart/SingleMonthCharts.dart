
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:easyqueue/Utilities/DataManager.dart';

class SingelMonthCharts extends StatefulWidget {

  SingelMonthCharts({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ChartReporState createState() => ChartReporState();


}

class ChartReporState extends State<SingelMonthCharts>{

  Color labelColor;
  String elapsedTime = '';
  TextStyle PercentageValueLabel ;

  double PercentageToShow;
  int DayWorked;
  
  DataManager _DataManager;
  
  
  ChartReporState(){
    _DataManager= new DataManager();
  }


  @override
  Widget build(BuildContext context) {

  PercentageValueLabel= Theme.of(context).textTheme.display3.merge(
      new TextStyle(color: Colors.lightGreen));

    return SingleChildScrollView(

      scrollDirection: Axis.horizontal,
      child: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                buildPieChar(),
                buildRadialChar()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildPieChar(){
    return Container(
        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: new AnimatedCircularChart(
          size: const Size(200.0, 200.0),
          initialChartData: <CircularStackEntry>[
            new CircularStackEntry(
              <CircularSegmentEntry>[
                new CircularSegmentEntry(
                  60,
                  Colors.lightGreenAccent,
                  rankKey: 'completed',
                ),
                new CircularSegmentEntry(
                  100,
                  Colors.blueGrey[600],
                  rankKey: 'remaining',
                ),
              ],
              rankKey: 'progress',
            ),
          ],
          chartType: CircularChartType.Radial,
          edgeStyle: SegmentEdgeStyle.round,
          percentageValues: true,
          holeLabel: "60%",
          labelStyle: PercentageValueLabel,
        )

    );
  }

  Container buildRadialChar(){
    return   Container(

      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: new AnimatedCircularChart(
        size: const Size(200.0, 200.0),

        initialChartData:  <CircularStackEntry>[
          new CircularStackEntry(
            <CircularSegmentEntry>[
              new CircularSegmentEntry(60, Colors.lightGreenAccent, rankKey: 'Q1'),
              new CircularSegmentEntry((100.00-60),Colors.blueGrey[600], rankKey: 'Q2'),
            ],
          ),
        ],
        chartType: CircularChartType.Pie,
        edgeStyle: SegmentEdgeStyle.round,
      ),
    );
  }


  getInformationForCharts(){

    _DataManager.getTotalHoursAndTotalMoneyFromMonth(DateTime.now()).then( (List<double> r) {




     });

  }

}


