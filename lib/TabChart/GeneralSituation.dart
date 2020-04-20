import 'package:easyqueue/Utilities/DataManager.dart';
import 'package:easyqueue/SharedStuff/Loader.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralSituationBarChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneralSituationBarChartState();
}

class GeneralSituationBarChartState extends State<GeneralSituationBarChart> {


  DataManager _DataManager;
  bool CanRender=false;

  List<double> PaymentsToShow;

  List<BarChartGroupData> GroupData;

  double MaxY=26;


  GeneralSituationBarChartState(){
    _DataManager= new DataManager();
    PaymentsToShow= new List<double>();
  }

  @override
  void initState() {
    getTotalPayment_();
  }

  @override
  Widget build(BuildContext context) {

    if (CanRender){
      return AspectRatio(
        aspectRatio: 1.7,
        child: Card(
          elevation: 0,
          color: Colors.white10,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 26,
              barTouchData: BarTouchData(
                enabled: false,
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipPadding: const EdgeInsets.all(0),
                  tooltipBottomMargin: 1,
                  getTooltipItem: (
                      BarChartGroupData group,
                      int groupIndex,
                      BarChartRodData rod,
                      int rodIndex,
                      ) {
                    return BarTooltipItem(
                        (PaymentsToShow[groupIndex]==0) ? " ": PaymentsToShow[groupIndex].toString()+ "€",
                      TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                      ),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  textStyle: TextStyle(
                    color: const Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14, ),
                  margin: 10,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'G';
                      case 1:
                        return 'F';
                      case 2:
                        return 'M';
                      case 3:
                        return 'A';
                      case 4:
                        return 'M';
                      case 5:
                        return 'G';
                      case 6:
                        return 'L';
                      case 7:
                        return 'A';
                      case 8:
                        return 'S';
                      case 9:
                        return 'O';
                      case 10:
                        return 'N';
                      case 11:
                        return 'D';
                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(showTitles: false),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: GroupData
            ),

          ),
        ),
      );
    }
    return Loader();

  }

  getTotalPayment_(){

    _DataManager.getTotalPayment().then( (List<double> result){

      if (result==null) { print("################RESULT ERROR"); return; }
      PaymentsToShow=result;
      List<BarChartGroupData> NewGrouData=new List<BarChartGroupData>();
      double max=result.reduce((curr, next) => curr > next? curr: next);
      int i=0;
      for (double r in result){
        double _y=(r==0)? 0 : (MaxY*r)/max;
        NewGrouData.add(BarChartGroupData(
            x: i,
            barRods: [BarChartRodData(y: _y, color: Colors.green)],
            showingTooltipIndicators: [0]));

        i++;

      }

      setState(() {
        GroupData=NewGrouData;
        CanRender=true;
      });

    } );
  }

}



