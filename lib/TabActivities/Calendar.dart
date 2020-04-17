
import 'dart:ui';
import 'package:easyqueue/SharedStuff/Loader.dart';
import 'package:easyqueue/Model/mSingleShift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easyqueue/TabActivities/SIngleCellNumber.dart';
import 'package:date_utils/date_utils.dart';
import 'package:easyqueue/Utilities/DataManager.dart';
import 'package:easyqueue/TabActivities/DialogActivities.dart';

class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalendarState();
  }
}

class CalendarState extends State<Calendar> {


  bool CanRender=false;

  DateTime _dateTime;
  int MonthDaysOffset = 0;
  int numWeekDays = 7;

  bool IsCurrentMonthAndYear;

  List<SingleShift> SingleDayInformation;
  DataManager _dateManager;

  AdditionalInformation additionalInformation;

  CalendarState() {
    additionalInformation = new AdditionalInformation();
  }

  @protected
  @mustCallSuper
  void initState() {
    _dateTime = DateTime.now();
    setDaysOffset();
    _dateManager = new DataManager();

    GetMontDateFromDataManagerOnStart();
  }

  @override
  Widget build(BuildContext context) {
    double height_ = MediaQuery.of(context).size.height;
    double OffsetAppBar = 130; //It should be calculated

    if (CanRender) {
      return SingleChildScrollView(

          child: Container(
              height: height_ - OffsetAppBar,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 15, 0, 10),
                              child: new Text(
                                  getMonthNameItalian(_dateTime.month) +
                                      " " +
                                      _dateTime.year.toString(),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .display1),
                            )
                          ]),
                      new Stack(

                        children: <Widget>[
                          GetCalendar(context),
                          additionalInformation,
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(13.0))),
                                backgroundColor: Colors.green,
                                child: new Icon(Icons.chevron_left),
                                onPressed: scrolMonthLeft,
                              ),
                              FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(13.0))),
                                backgroundColor: Colors.deepOrange,
                                child: new Icon(Icons.calendar_today),
                                tooltip: "Torna ad oggi",
                                onPressed: setToday,
                              ),
                              FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(13.0))),
                                backgroundColor: Colors.green,
                                child: new Icon(Icons.chevron_right),
                                onPressed: scrollMonthRight,
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              )));
    }
    //Waiting file reading
    return Loader();




  }

  FutureBuilder GetCalendar(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemWidth = 58;
    final double itemHeight = 65;

    return new FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return new Padding(
          padding: EdgeInsets.fromLTRB(2, 10, 2, 0),
          child: Column(
            key: UniqueKey(),
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                      child: new Text('L',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline)),
                  new Expanded(
                      child: new Text('M',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline)),
                  new Expanded(
                      child: new Text('M',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline)),
                  new Expanded(
                      child: new Text('G',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline)),
                  new Expanded(
                      child: new Text('V',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline)),
                  new Expanded(
                      child: new Text('S',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline)),
                  new Expanded(
                      child: new Text('D',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline)),
                ],
                mainAxisSize: MainAxisSize.min,
              ),
              new GridView.count(

                  crossAxisCount: numWeekDays,
                  childAspectRatio: (itemWidth / itemHeight),
                  shrinkWrap: true,
                  children: new List.generate(
                    getNumberOfDaysInMonth(_dateTime.month),
                    (index) {
                      //-1 ---> that cell have to be without a number
                      int Day = (index < MonthDaysOffset)
                          ? -1
                          : (index - MonthDaysOffset) + 1;

                      if (Day > -1) {
                        String Key_ = Day.toString() +
                            "-" +
                            _dateTime.month.toString() +
                            "-" +
                            _dateTime.year.toString();

                        SingleShift ss = null;

                        //finding days already saved
                        if (SingleDayInformation.length >= 0) {
                          try {
                            ss = SingleDayInformation.firstWhere(
                                (s) => s.Key == Key_);
                          } catch (e) {}
                        }

                        DateTime SingleCellNumberDateTime =
                            new DateTime(_dateTime.year, _dateTime.month, Day);
                        bool IsTheDay =
                            Day == DateTime.now().day && IsCurrentMonthAndYear;

                        return new CellNumber(Day, index, IsTheDay, ss,
                            SingleCellNumberDateTime, additionalInformation);
                      }

                      return new CellNumber(
                          Day, index, false, null, null, null);
                    },
                  ))
            ],
          ));
    });
  }

  void GetMontDateFromDataManager() {
    SingleDayInformation = new List<SingleShift>();

    _dateManager
        .readMonthlyShiftFromDate(_dateTime)
        .then((List<SingleShift> result) {
      SingleDayInformation = result;
    });
  }

  void GetMontDateFromDataManagerOnStart() {
    SingleDayInformation = new List<SingleShift>();

    _dateManager
        .readMonthlyShiftFromDate(_dateTime)
        .then((List<SingleShift> result) {
      SingleDayInformation = result;

      setState(() {
        CanRender=true;
      });

    });
  }

  void setDaysOffset() {
    MonthDaysOffset = new DateTime(_dateTime.year, _dateTime.month, 0).weekday;
    MonthDaysOffset == 7 ? (MonthDaysOffset = 0) : MonthDaysOffset;
    IsCurrentMonthAndYear = _dateTime.month == DateTime.now().month &&
        _dateTime.year == DateTime.now().year;
  }

  void setToday() {
    setState(() {
      _dateTime = DateTime.now();
      setDaysOffset();
      GetMontDateFromDataManager();
    });
  }

  void scrolMonthLeft() {
    setState(() {
      _dateTime = (_dateTime.month == DateTime.january)
          ? _dateTime = new DateTime(_dateTime.year - 1, DateTime.december)
          : _dateTime = new DateTime(_dateTime.year, _dateTime.month - 1);

      setDaysOffset();
      GetMontDateFromDataManager();
    });
  }

  void scrollMonthRight() {
    setState(() {
      _dateTime = (_dateTime.month == DateTime.december)
          ? _dateTime = new DateTime(_dateTime.year + 1, DateTime.january)
          : _dateTime = new DateTime(_dateTime.year, _dateTime.month + 1);

      setDaysOffset();
      GetMontDateFromDataManager();
    });
  }

  int getNumberOfDaysInMonth(final int month) {
    DateTime date = new DateTime(DateTime.now().year, month);
    DateTime lastDayInDate = Utils.lastDayOfMonth(date);
    int lastDayInInt = int.parse(lastDayInDate.day.toString());

    return lastDayInInt + MonthDaysOffset;
  }

  String getMonthNameItalian(final int month) {
    switch (month) {
      case 1:
        return "Gennaio";
      case 2:
        return "Febbraio";
      case 3:
        return "Marzo";
      case 4:
        return "Aprile";
      case 5:
        return "Maggio";
      case 6:
        return "Giugno";
      case 7:
        return "Luglio";
      case 8:
        return "Agosto";
      case 9:
        return "Settembre";
      case 10:
        return "Ottobre";
      case 11:
        return "Novembre";
      case 12:
        return "Dicembre";
      default:
        return "Unknown";
    }
  }

  Widget buildDayEventInfoWidget(int dayNumber) {
    int eventCount = 0;
    DateTime eventDate;
    if (eventCount > 0) {
      return new Expanded(
        child: FittedBox(
          alignment: Alignment.topLeft,
          fit: BoxFit.contain,
          child: new Text(
            "Events:$eventCount",
            maxLines: 1,
            style: new TextStyle(
                fontWeight: FontWeight.normal,
                background: Paint()..color = Colors.amberAccent),
          ),
        ),
      );
    } else {
      return new Container();
    }
  }
}
