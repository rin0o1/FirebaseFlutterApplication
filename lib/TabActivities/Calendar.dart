import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return scrollMonthLeft();
  }
}

class scrollMonthLeft extends State<Calendar> {

  DateTime _dateTime;
  int MonthOffset=0;
  int numWeekDays = 7;

  scrollMonthLeft() {
    _dateTime = DateTime.now();

    setDaysOffset();
  }

  @override
  Widget build(BuildContext context) {

    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20,5,0,0),
                    child: new Text(
                        getMonthName(_dateTime.month) + " " + _dateTime.year.toString(),
                        style: Theme.of(context).textTheme.display1
                    ),
                  )
                ]
            ),
            GetCalendar(context),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(15,10,15,6),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FloatingActionButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13.0))),
                      backgroundColor: Colors.green,
                      child: new Icon(Icons.chevron_left),
                      onPressed: scrollMonthRight,
                    ),
                    FloatingActionButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13.0))),
                      backgroundColor: Colors.deepOrange,
                      child: new Icon(Icons.calendar_today),
                      tooltip: "Torna ad oggi",
                      onPressed: setToday,
                    ),
                    FloatingActionButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13.0))),
                      backgroundColor: Colors.green,
                      child: new Icon(Icons.chevron_right),
                      onPressed: scrollMonthRight,
                    ),
                  ],
                )
            ),
          ],
        )
      ],
    );
  }


  FutureBuilder GetCalendar(BuildContext context)
  {

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    /*28 is for weekday labels of the row*/
    // 55 is for iPhoneX clipping issue.
    final double itemHeight = (size.height - kToolbarHeight-kBottomNavigationBarHeight-24-28-55) / numWeekDays;
    //final double itemHeight=54;
    final double itemWidth = size.width / numWeekDays;

    return
      new FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return new Padding(
                padding: EdgeInsets.fromLTRB(2, 10, 2, 0),
                child:Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Expanded(
                            child: new Text('L',
                                textAlign: TextAlign.center,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline)),
                        new Expanded(
                            child: new Text('M',
                                textAlign: TextAlign.center,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline)),
                        new Expanded(
                            child: new Text('M',
                                textAlign: TextAlign.center,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline)),
                        new Expanded(
                            child: new Text('G',
                                textAlign: TextAlign.center,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline)),
                        new Expanded(
                            child: new Text('V',
                                textAlign: TextAlign.center,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline)),
                        new Expanded(
                            child: new Text('S',
                                textAlign: TextAlign.center,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline)),
                        new Expanded(
                            child: new Text('D',
                                textAlign: TextAlign.center,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline)),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                    new GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: numWeekDays,
                      childAspectRatio: (itemWidth / itemHeight),
                      shrinkWrap: true,
                      children: List.generate(
                          getNumberOfDaysInMonth(_dateTime.month),
                              (index) {
                            int dayNumber = index +1;
                            return new GestureDetector(
                              // Used for handling tap on each day view
                                child: new Container(

                                    margin: const EdgeInsets.all(3.0),
                                    padding: const EdgeInsets.all(1.0),
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        //Se è un giorno in cui ho lavorato è da inserire qui
                                        color: Colors.orange),
                                    child: new Column(
                                      children: <Widget>[
                                        buildDayNumberWidget(dayNumber),
                                        //buildDayEventInfoWidget(dayNumber)
                                      ],
                                    )));
                          }),
                    )
                  ],
                )
            );
          }
      );

  }


  Align buildDayNumberWidget(int dayNumber) {
    bool IsTheDay= (dayNumber-MonthOffset) == DateTime.now().day
        && _dateTime.month == DateTime.now().month
        && _dateTime.year == DateTime.now().year;

      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 35.0, // Should probably calculate these values
          height: 43.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (IsTheDay)  ?  Colors.yellowAccent : null
          ),
          padding: EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
          child: new Text(
            dayNumber <= MonthOffset ? ' ' : (dayNumber - MonthOffset).toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      );
  }

  Widget buildDayEventInfoWidget(int dayNumber) {
    int eventCount = 0;
    DateTime eventDate;
    if (eventCount > 0) {
      return new Expanded(
        child:
        FittedBox(
          alignment: Alignment.topLeft,
          fit: BoxFit.contain,
          child: new Text(
            "Events:$eventCount",
            maxLines: 1,
            style: new TextStyle(fontWeight: FontWeight.normal,
                background: Paint()..color = Colors.amberAccent),
          ),
        ),
      );
    } else {
      return new Container();
    }
  }

  void setDaysOffset() {
    MonthOffset = new DateTime(_dateTime.year, _dateTime.month, 0).weekday;
    MonthOffset == 7 ? (MonthOffset = 0) : MonthOffset;
  }


  void setToday() {
    setState(() {
      _dateTime = DateTime.now();
      setDaysOffset();
    });
  }

  void scrolMonthLeft() {
    setState(() {
      if (_dateTime.month == DateTime.january)
        _dateTime = new DateTime(_dateTime.year - 1, DateTime.december);
      else
        _dateTime = new DateTime(_dateTime.year, _dateTime.month - 1);

      setDaysOffset();
    });
  }

  void scrollMonthRight() {
    setState(() {
      if (_dateTime.month == DateTime.december)
        _dateTime = new DateTime(_dateTime.year + 1, DateTime.january);
      else
        _dateTime = new DateTime(_dateTime.year, _dateTime.month + 1);

      setDaysOffset();
    });
  }

  /*void _onDayTapped(int day) {
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context)
    => print("object");
  }*/

  int getNumberOfDaysInMonth(final int month) {
    int numDays = 28;

    // Months are 1, ..., 12
    switch (month) {
      case 1:
        numDays = 31;
        break;
      case 2:
        numDays = 28;
        break;
      case 3:
        numDays = 31;
        break;
      case 4:
        numDays = 30;
        break;
      case 5:
        numDays = 31;
        break;
      case 6:
        numDays = 30;
        break;
      case 7:
        numDays = 31;
        break;
      case 8:
        numDays = 31;
        break;
      case 9:
        numDays = 30;
        break;
      case 10:
        numDays = 31;
        break;
      case 11:
        numDays = 30;
        break;
      case 12:
        numDays = 31;
        break;
      default:
        numDays = 28;
    }
    return numDays + MonthOffset;
  }

  String getMonthName(final int month) {
    // Months are 1, ..., 12
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "Unknown";
    }
  }

}