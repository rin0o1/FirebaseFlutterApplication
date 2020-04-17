import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:easyqueue/Utilities/DataManager.dart';
import 'package:date_utils/date_utils.dart';
import 'package:easyqueue/SharedStuff/Loader.dart';

class SingleMonthCharts extends StatefulWidget {


  DateTime _dateTime;

  SingleMonthCharts(DateTime _dateTime){
       this._dateTime=_dateTime;
  }


  @override
  ChartReporState createState() => ChartReporState(_dateTime);
}

class ChartReporState extends State<SingleMonthCharts> {

  Color labelColor;
  String elapsedTime = '';
  TextStyle PercentageValueLabel;
  Color EmptySpace ;
  Color BusySpace ;

  DateTime _dateTime;
  double PercentageDayWorkedToShow = -1;
  int DayWorked = 0;
  int MontLength = 0;

  DataManager _DataManager;

  bool CanRender = false;

  ChartReporState(DateTime _dateTime) {

    BusySpace= Colors.green;
    EmptySpace=Colors.orangeAccent;
    _DataManager = new DataManager();
    this._dateTime=_dateTime;
  }

  @override
  void initState() {
    getInformationForCharts();
  }

  @override
  Widget build(BuildContext context) {

    PercentageValueLabel = Theme.of(context)
        .textTheme
        .display2
        .merge(new TextStyle(color: Colors.blue));

    if (CanRender) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildPieChar(),
                  buildRadialChar(),
                ],
              )
            ],
          ),
        ),
      );
    }
    return Loader();
  }

  Container buildPieChar() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: new AnimatedCircularChart(
          size: const Size(200.0, 200.0),
          initialChartData: <CircularStackEntry>[
            new CircularStackEntry(
              <CircularSegmentEntry>[
                new CircularSegmentEntry(
                  PercentageDayWorkedToShow,
                  BusySpace,
                  rankKey: 'completed',
                ),
                new CircularSegmentEntry(
                  100,
                  EmptySpace,
                  rankKey: 'remaining',
                ),
              ],
              rankKey: 'progress',
            ),
          ],
          chartType: CircularChartType.Radial,
          edgeStyle: SegmentEdgeStyle.flat,
          percentageValues: true,
          holeLabel: "${DayWorked}/${MontLength} ",
          labelStyle: PercentageValueLabel,
        ));
  }

  Container buildRadialChar() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: new AnimatedCircularChart(
        size: const Size(200.0, 200.0),
        initialChartData: <CircularStackEntry>[
          new CircularStackEntry(
            <CircularSegmentEntry>[
              new CircularSegmentEntry(
                  PercentageDayWorkedToShow, BusySpace,
                  rankKey: 'Q1'),
              new CircularSegmentEntry(
                  (100.00 - PercentageDayWorkedToShow),EmptySpace,
                  rankKey: 'Q2'),
            ],
          ),
        ],
        chartType: CircularChartType.Pie,
        edgeStyle: SegmentEdgeStyle.round,
      ),
    );
  }

  getInformationForCharts() {
    
    DateTime lastDayInInt = Utils.lastDayOfMonth(_dateTime);
    MontLength = int.parse(lastDayInInt.day.toString());

    _DataManager.getTotalHoursAndTotalMoneyFromMonth(_dateTime)
        .then((List<double> r) {
      if (r == null) {
        PercentageDayWorkedToShow = 0;
        print("######################################LIST RESULT NULL");
        return;
      }

      setState(() {
        CanRender = true;
        DayWorked = r[0].toInt();

        //100 * GiorniLavorati /GiorniTotaliDelMese
        PercentageDayWorkedToShow =
            ((100 * DayWorked) / MontLength).roundToDouble();
      });
    });
  }

  changeDate(DateTime dateTime){
    setState(() {
      this._dateTime=dateTime;
    });
  }

}
