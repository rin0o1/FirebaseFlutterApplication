
import 'package:flutter/material.dart';
import 'package:easyqueue/TabChart/ChartReport.dart';
import 'package:flutter/cupertino.dart';

class TabChart extends StatefulWidget
{
  TabChart({Key key}) :super (key : key);
  @override
  TabChartState createState()=> TabChartState();
}

class TabChartState extends State<TabChart>
{


  @override
  Widget build(BuildContext context) {

    return ChartReport();

  }

}

