import 'package:easyqueue/TabChart/TabChart.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NavDrawerState();
  }
}

class NavDrawerState extends State<NavDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,

        children: <Widget>[
          DrawerHeader(
            child: Text('menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),

          Hero(
              tag: '/calendar',
              child: GestureDetector(
                onTap: () => Navigator.of(context).popAndPushNamed('/calendar'),
                child: ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text('Calendar'),
                ),
              )
          ),

          Hero(
            tag: '/chart',
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/chart'),
              child: ListTile(
                leading: Icon(Icons.pie_chart),
                title: Text('Charts'),
              ),
            ),
          ),

          Hero(
              tag: '/option',
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/option'),
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),

                ),
              )

          ),
        ],
      ),
    );
  }
}
