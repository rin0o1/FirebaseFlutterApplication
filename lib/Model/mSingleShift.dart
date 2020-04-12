import 'dart:ui';

import 'package:easyqueue/Model/mBaseModel.dart';

class SingleShift extends BaseModel
{


  String Date;
  double  AdditionalHours;
  double AdditionalPayment;


  String Notes;

  SingleShift (DateTime Date, [double AdditionHours,
    double AdditionPayment, String Notes])
  {
    buildKey(Date);
    this.AdditionalHours=AdditionHours?? 0;
    this.AdditionalPayment=AdditionPayment?? 0;
  }


  @override
  Map<String, dynamic> getClassInJson() => {
    'Key' :Key,
    'Date': Date,
    'AdditionalInHours': AdditionalHours.toString(),
    'AdditionalPayment': AdditionalPayment.toString(),
    'Notes': Notes
  };


  SingleShift.SingleShiftFromJson ( Map<String, dynamic> json )
      :
        Date= json['Date'] ,
        AdditionalHours = double.parse(json['AdditionalInHours']),
        AdditionalPayment = double.parse(json['AdditionalPayment']),
        Notes= json['Notes']    ;



  setKeyFromJson()
  {
    Key=Date.toString();
  }

  buildKey(DateTime date)
  {
    String Month= date.month.toString();
    String Day=date.day.toString();
    String Year= date.year.toString();
    Key= Day +"-"+ Month + "-" + Year;
    Date= Key;
  }

  setDate(DateTime dateTime) {
    buildKey(dateTime);

  }
  setAdditionalDurationInHours(double additionalhours){
    this.AdditionalHours=additionalhours;
  }
  setAdditionalPaymentForHour(double additionpayment){
    this.AdditionalPayment=additionpayment;
  }

  setNotes(String notes) {
    this.Notes=notes;
  }

}