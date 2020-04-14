
import 'package:easyqueue/TabActivities/DialogActivities.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class TabChart extends StatefulWidget
{
  TabChart({Key key}) :super (key : key);
  @override
  TabChartState createState()=> TabChartState();
}

class TabChartState extends State<TabChart>
{

  AdditionalInformation a= new AdditionalInformation();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Colors.blue,
      body: new SafeArea(
        child: a
      ),
    );

  }
}

