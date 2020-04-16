import 'package:flutter/material.dart';
import 'package:easyqueue/TabActivities/TabActivities.dart';
import 'package:easyqueue/TabChart/TabChart.dart';
import 'package:easyqueue/main.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
 
    switch(settings.name){
      case '/calendar':
        return MaterialPageRoute(builder: (_) => TabActivities());

      case '/chart':
        return MaterialPageRoute(builder: (_) => TabChart());


    }
}
}