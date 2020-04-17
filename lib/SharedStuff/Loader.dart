import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/cupertino.dart';

class Loader extends StatelessWidget{

  Color _Color;

  EdgeInsetsGeometry _Padding;

  double Size;


  Loader([Color color, EdgeInsetsGeometry p, double size ]){
    _Color= (color==null) ? Colors.red : color ;
    _Padding= (p==null) ? EdgeInsets.fromLTRB(50, 50,50, 50 )  : p;
    Size= (size==null) ? 50.0: size;
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        child: Center(
            child:Padding(
              padding: _Padding,
              child: SpinKitHourGlass(
                color: _Color,
                size: Size,
              ),
            )

        )

    );
  }

}