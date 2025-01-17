import 'package:easyqueue/TabActivities/Calendar.dart';
import 'package:easyqueue/TabActivities/DialogActivities.dart';
import 'package:flutter/material.dart';
import 'package:easyqueue/Utilities/DataManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:easyqueue/Model/mSingleShift.dart';
import 'package:easyqueue/Model/mShiftSettings.dart';

class TabActivities extends StatefulWidget {
  TabActivities({Key key}) : super(key: key);
  @override
  TabActivitiesState createState() => TabActivitiesState();
}

class TabActivitiesState extends State<TabActivities> {
  DataManager m = new DataManager();
  List<SingleShift> ShiftsOfAMonth = null;

  CreateAndSaveNewShiftFromDate(DateTime time) async {
    SingleShift s = new SingleShift(time);
    await m.saveModel(s);
  }

  @override
  Widget build(BuildContext context) {


    return  Calendar();

  }
}
